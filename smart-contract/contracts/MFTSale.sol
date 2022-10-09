// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

import "./SSFToken.sol";
import "./MFT.sol";
import "./MFTNego.sol";

/**
* MFT 거래정보를 보관하고 해당 거래의 제안정보를 관리하는 컨트랙트
* 
* @author 황승주
*/

contract MFTSale is Ownable, IERC721Receiver {
    using SafeMath for uint256;

    // 판매하는 MFT ID
    uint256 private _MFTId;
    // 판매자의 지갑 주소
    address private _seller;
    // 구매자의 지갑 주소
    address private _buyer;
    // 즉시 구매 금액
    uint256 private _buyNowPrice;
    // 최종 거래 금액
    uint256 private _finalPrice;
    // 판매 시작 시간
    uint256 private _startedAt;
    // 판매 종료 시간
    uint256 private _endedAt;
    // 판매 종료 여부
    bool private _isEnded;
    // 판매 취소 여부
    bool private _isCanceled;
    // 제안 가능 여부
    bool private _negoAble;
    // 제안 컨트랙트 ID
    uint256[] private _negoIds;
    // 제안 컨트랙트 주소
    mapping(uint256 => address) private _negoAddrs;

    // SSAFY 토큰(SSF) 활용을 위한 ERC-20 토큰 컨트랙트
    SSFToken private _SSFTokenContract;
    // MFT 활용을 위한 ERC-721 토큰 컨트랙트
    MFT private _MFTContract;

    /**
    * constructor
    * 새로운 Sale 컨트랙트 생성
    * 
    * @ param uint256 MFTId MFT ID
    * @ param address seller 판매자
    * @ param uint256 buyNowPrice 즉시 구매 금액
    * @ param uint256 startedAt 판매 시작 시간
    * @ param bool negoAble 제안 가능 여부 
    * @ param address SSFTokenContractAddress SSAFY 토큰(ERC-20) 컨트랙트 주소
    * @ param address MFTContractAddress MFT(ERC-721) 컨트랙트 주소
    * @ return None
    * @ exception 즉시 구매 금액은 0 이상이어야 함
    * @ exception MFT가 판매자의 소유여야 함    
    */
    constructor(
        uint256 MFTId, 
        address seller, 
        uint256 buyNowPrice, 
        uint256 startedAt, 
        bool negoAble,
        address SSFTokenContractAddress,
        address MFTContractAddress
    ) {
        require(buyNowPrice >= 0, "Price must be higher than 0.");
        require(MFT(MFTContractAddress).ownerOf(MFTId) == seller, "Seller is not owner.");

        _MFTId = MFTId;
        _seller = seller;
        _buyNowPrice = buyNowPrice;
        _startedAt = startedAt;
        _isEnded = false;
        _isCanceled = false;
        _negoAble = negoAble;
        _SSFTokenContract = SSFToken(SSFTokenContractAddress);
        _MFTContract = MFT(MFTContractAddress);
    }

    /**
    * reportNego
    * 생성된 Nego 컨트랙트를 해당 Sale에 기록하고, 제안 금액을 보관한다.
    * 
    * @ param uint256 negoId Nego ID
    * @ param address negoAddr 제안 컨트랙트 주소
    * @ param address negoer 제안자 지갑 주소
    * @ param uint256 negoPrice 제안 금액
    * @ param uint256 negoAt 제안 일시
    * @ param bool isChoiced 제안 채택 여부
    * @ param bool isCanceled 제안 취소 여부
    * @ return None
    * @ exception 제안 금액은 0 이상이어야 함
    * @ exception 제안 하는 Sale은 진행중이어야 함
    * @ exception 제안 하는 Sale은 제안 가능 여부가 true이어야 함
    * @ exception 제안 하는 지갑은 제안 금액 이상의 잔고를 보유해야함
    */
    function reportNego(
        uint256 negoId,
        address negoAddr,
        address negoer,
        uint256 negoPrice,
        uint256 negoAt,
        bool isChoiced,
        bool isCanceled
    ) public {
        require(negoPrice >= 0, "Price must be higher than 0.");
        require(!_isEnded, "This sale is already ended.");
        require(_negoAble, "This sale prohibits a negotiation.");
        require(_SSFTokenContract.balanceOf(negoer) >= negoPrice, "Negoer's balance is exhausted.");

        _negoIds.push(negoId);
        _negoAddrs[negoId] = negoAddr;

        // 제안자의 지갑에서 해당 Sale 컨트랙트로 제안 금액 전송
        _SSFTokenContract.transferFrom(negoer, address(this), negoPrice);
    }

    /**
    * end
    * 거래 종료시간을 기록한다.
    * 해당 Sale을 종료 처리한다.
    * 
    * @ param None
    * @ return None
    * @ exception 종료할 Sale이 진행중이어야 함
    * @ exception 종료할 Sale이 취소상태가 아니어야 함
    */
    function end() public {
        _endedAt = block.timestamp;
        _isEnded = true;
    }

    /**
    * cancel
    * 해당 Sale을 취소 상태로 만들고,
    * 취소상태가 아닌 제안들을 환불한다.
    * 위 절차가 완료 되면 해당 Sale을 종료 처리한다.
    * 
    * @ param None
    * @ return None
    * @ exception 취소할 Sale이 진행중이어야 함
    * @ exception 취소할 Sale이 취소상태가 아니어야 함
    */
    function cancel() public {
        require(!_isEnded, "This sale is already ended.");
        require(!_isCanceled, "This sale is already canceled.");
        
        // Sale을 취소 상태로 설정
        _isCanceled = true;

        // Sale의 Nego들을 취소 처리
        for(uint i = 0; i < _negoIds.length; i++) {
            // 이미 취소된 Nego인지 확인
            if(MFTNego(_negoAddrs[_negoIds[i]]).getIsCanceled()) continue;
            
            // Nego를 취소 처리
            MFTNego canceledNego = MFTNego(_negoAddrs[_negoIds[i]]);
            canceledNego.cancel();
        }

        // Sale을 종료 상태로 변경
        end();
    }

    /**
    * buyNow
    * 판매자의 MFT와 구매자의 SSFToken을 서로 Transfer한다. 
    * 구매 관련 정보를 갱신한다.
    * 해당 Sale의 Nego들을 환불 및 취소 처리한다.
    * 해당 Sale을 종료처리한다.
    * 
    * @ param address buyer 구매자 지갑 주소
    * @ return None
    * @ exception 거래가 종료상태가 아니어야 함
    * @ exception 판매자가 MFT의 소유자여야 함
    * @ exception 구매자가 즉시 구매 금액 이상의 금액을 가지고 있어야 함
    */
    function buyNow(
        address buyer
    ) public {
        require(!_isEnded, "This sale is already ended.");
        require(_MFTContract.ownerOf(_MFTId) == _seller);
        require(_SSFTokenContract.balanceOf(buyer) >= _buyNowPrice, "Buyer's balance is exhausted.");

        // 판매자에게서 구매자에게 MFT 전송
        _MFTContract.safeTransferFrom(_seller, buyer, _MFTId);
        // 구매자에게서 판매자에게 SSFToken 전송
        _SSFTokenContract.transferFrom(buyer, _seller, _buyNowPrice);

        // 구매 관련 정보를 갱신
        _buyer = buyer;

        // Sale의 Nego들을 취소 처리
        for(uint i = 0; i < _negoIds.length; i++) {
            // 이미 취소된 Nego인지 확인
            if(MFTNego(_negoAddrs[_negoIds[i]]).getIsCanceled()) continue;
            
            // Nego를 취소 처리
            MFTNego canceledNego = MFTNego(_negoAddrs[_negoIds[i]]);
            canceledNego.cancel();
        }

        // 해당 Sale을 종료 처리
        end();
    }

    /**
    * acceptNego
    * 판매자의 MFT를 구매자에게 Transfer 하고,
    * Sale 컨트랙트에 보관중인 제안 금액을 판매자의 지갑으로 Transfer 한다.
    * 해당 Nego를 선택 처리하는 함수를 호출한다.
    * 구매 관련 정보를 갱신한다.
    * 해당 Sale의 나머지 Nego들을 환불 및 취소 처리한다.
    * 해당 Sale을 종료처리한다.
    * 
    * @ param uint256 negoId 채택된 Nego ID
    * @ return None
    * @ exception 거래가 종료상태가 아니어야 함
    * @ exception 판매자가 MFT의 소유자여야 함
    * @ exception 채택된 Nego가 취소상태가 아니어야 함
    * @ exception 채택된 Nego가 채택된 상태가 아니어야 함
    */
    function acceptNego(
        uint256 negoId
    ) public {
        require(!_isEnded, "This sale is already ended.");
        require(_MFTContract.ownerOf(_MFTId) == _seller);

        MFTNego choicedNego = MFTNego(_negoAddrs[negoId]);
        require(!choicedNego.getIsCanceled(), "This negotiation is canceled.");
        require(!choicedNego.getIsChoiced(), "This negotiation is already choiced.");

        address negoer = choicedNego.getNegoer();

        // 판매자에게서 구매자에게 MFT 전송
        _MFTContract.safeTransferFrom(_seller, negoer, _MFTId);
        // Sale 컨트랙트에서 판매자에게 SSFToken 전송
        _SSFTokenContract.transfer(_seller, choicedNego.getNegoPrice());

        // 해당 Nego 선택 처리 함수 호출
        choicedNego.choice();

        // 구매 관련 정보를 갱신
        _buyer = negoer;

        // Sale의 Nego들을 취소 처리
        for(uint i = 0; i < _negoIds.length; i++) {
            // 이미 취소된 Nego인지 확인
            if(MFTNego(_negoAddrs[_negoIds[i]]).getIsCanceled()) continue;
            // 선택된 Nego인지 확인
            if(MFTNego(_negoAddrs[_negoIds[i]]).getIsChoiced()) continue;

            // Nego를 취소 처리
            MFTNego canceledNego = MFTNego(_negoAddrs[_negoIds[i]]);
            canceledNego.cancel();
        }

        // 해당 Sale을 종료 처리
        end();
    }

    /**
    * cancelNego
    * 제안 금액을 반환하고, 해당 Nego를 취소 상태로 만드는 MFTNego의 함수를 호출한다.
    * 
    * @ param uint256 negoId 취소할 Nego ID
    * @ return None
    * @ exception 취소할 Nego가 속한 Sale이 진행중이어야 함
    * @ exception 취소할 Nego가 취소상태가 아니어야 함
    */
    function cancelNego(
        uint256 negoId
    ) public {
        // 취소할 Nego
        MFTNego canceledNego = MFTNego(_negoAddrs[negoId]);

        require(!_isEnded, "This sale is already ended.");
        require(!canceledNego.getIsCanceled(), "This negotiation is already canceled.");

        // 해당 Sale 컨트랙트에서 제안자의 지갑으로 제안 금액 환불
        _SSFTokenContract.transfer(canceledNego.getNegoer(), canceledNego.getNegoPrice());

        // Nego 컨트랙트의 취소 함수 호출
        canceledNego.cancel();
    }

    /**
    * refundNego
    * 해당 Nego를 환불 받는다.
    * 
    * @ param uint256 negoId 채택된 Nego ID
    * @ param address refunder 환불하는 사람의 지갑 주소
    * @ return None
    * @ exception 거래가 종료상태여야 함
    * @ exception negoer가 refunder여야 함
    */
    function refundNego(
        uint256 negoId,
        address refunder
    ) public {    
        require(_isEnded, "This sale is not ended yet.");
        
        MFTNego refundedNego = MFTNego(_negoAddrs[negoId]);
        require(refundedNego.getNegoer() == refunder, "Refunder is not a negoer.");

        _SSFTokenContract.transfer(refundedNego.getNegoer(), refundedNego.getNegoPrice());

        refundedNego.refund();
    }

    /**
    * getMFTId
    * 해당 Sale의 대상 MFT ID를 반환
    *
    * @ param None
    * @ return uint256 MFT ID
    * @ exception None
    */
    function getMFTId() public view returns(uint256) {
        return _MFTId;
    }

    /**
    * getSeller
    * 해당 Sale의 판매자 지갑 주소를 반환
    *
    * @ param None
    * @ return address 판매자 지갑 주소
    * @ exception None
    */
    function getSeller() public view returns(address) {
        return _seller;
    }

    /**
    * getBuyer
    * 해당 Sale의 구매자 지갑 주소를 반환
    *
    * @ param None
    * @ return address 구매자 지갑 주소
    * @ exception None
    */
    function getBuyer() public view returns(address) {
        return _buyer;
    }

    /**
    * getBuyNowPrice
    * 해당 Sale의 즉시 구매 금액을 반환
    *
    * @ param None
    * @ return uint256 즉시 구매 금액
    * @ exception None
    */
    function getBuyNowPrice() public view returns(uint256) {
        return _buyNowPrice;
    }

    /**
    * getFinalPrice
    * 해당 Sale의 최종 거래 금액을 반환
    *
    * @ param None
    * @ return uint256 최종 거래 금액
    * @ exception None
    */
    function getFinalPrice() public view returns(uint256) {
        return _finalPrice;
    }

    /**
    * getStartedAt
    * 해당 Sale의 판매 시작 시간을 반환
    *
    * @ param None
    * @ return uint256 판매 시작 시간
    * @ exception None
    */
    function getStartedAt() public view returns(uint256) {
        return _startedAt;
    }

    /**
    * getEndedAt
    * 해당 Sale의 판매 종료 시간을 반환
    *
    * @ param None
    * @ return uint256 판매 종료 시간
    * @ exception 해당 Sale의 상태가 종료상태이어야 함
    */
    function getEndedAt() public view returns(uint256) {
        require(_isEnded, "This sale is not ended yet.");
        return _endedAt;
    }

    /**
    * getIsEnded
    * 해당 Sale의 종료 여부를 반환
    *
    * @ param None
    * @ return bool Sale 종료 여부
    * @ exception None
    */
    function getIsEnded() public view returns(bool) {
        return _isEnded;
    }

        /**
    * getIsCanceled
    * 해당 Sale의 취소 여부를 반환
    *
    * @ param None
    * @ return bool Sale 취소 여부
    * @ exception None
    */
    function getIsCanceled() public view returns(bool) {
        return _isCanceled;
    }

    /**
    * getNegoAble
    * 해당 Sale의 제안 가능 여부를 반환
    *
    * @ param None
    * @ return bool 제안 가능 여부
    * @ exception None
    */
    function getNegoAble() public view returns(bool) {
        return _negoAble;
    }

    function onERC721Received(address _operator, address _from, uint256 _tokenId, bytes memory _data) override external pure returns(bytes4)
    {
        return this.onERC721Received.selector;
    }
}   