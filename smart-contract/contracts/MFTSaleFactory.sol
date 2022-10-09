// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

import "./SSFToken.sol";
import "./MFT.sol";
import "./MFTSale.sol";
import "./MFTNego.sol";

/**
* MFT 거래정보를 관리하는 컨트랙트
* 
* @author 황승주
*/

contract MFTSaleFactory is Ownable {
    using Counters for Counters.Counter;

    event SaleCreated(uint256 indexed saleId, address saleAddr, uint256 MFTId);
    event NegoCreated(uint256 indexed negoId, address negoAddr, uint256 SaleId);

    // Sale ID(1씩 자동 증가)
    Counters.Counter private _saleIds;
    // Nego ID(1씩 자동 증가)
    Counters.Counter private _negoIds;
    // Sale 컨트랙트 주소
    mapping(uint256 => address) private _saleAddrs;
    // Nego 컨트랙트 주소
    mapping(uint256 => address) private _negoAddrs;
    // MFT 판매자
    mapping(uint256 => address) private _saleSellers;
    // MFT 구매자
    mapping(uint256 => address) private _saleBuyers;
    // 해당 지갑 주소가 판매자였던 Sale ID 목록
    mapping(address => uint256[]) private _sellSaleIdsByWallet;
    // 해당 지갑 주소가 구매자였던 Sale ID 목록
    mapping(address => uint256[]) private _buySaleIdsByWallet;
    // 해당 지갑 주소의 모든 Sale ID 목록
    mapping(address => uint256[]) private _saleIdsByWallet;
    // 해당 MFT ID의 모든 Sale ID 목록
    mapping(uint256 => uint256[]) private _saleIdsOfMFT;
    // 해당 지갑 주소의 모든 Nego ID 목록
    mapping(address => uint256[]) private _negoIdsByWallet;
    // 해당 Sale ID의 모든 Nego ID 목록
    mapping(uint256 => uint256[]) private _negoIdsOfSale;
    // 해당 MFT ID의 판매 상태
    mapping(uint256 => bool) private _saleStatusOfMFT;
    // 해당 MFT ID가 현재 판매중인 Sale
    mapping(uint256 => uint256) private _currentSaleOfMFT;

    // SSAFY 토큰(SSF) 활용을 위한 ERC-20 토큰 컨트랙트 주소
    address private _SSFTokenContractAddress;
    // MFT 활용을 위한 ERC-721 토큰 컨트랙트 주소
    address private _MFTContractAddress;

    /**
    * constructor
    * Sale 컨트랙트를 관리하는 SaleFactory 생성
    * 
    * @ param address SSFTokenContractAddress SSAFY 토큰(ERC-20) 컨트랙트 주소
    * @ param address MFTContractAddress MFT(ERC-721) 컨트랙트 주소
    * @ return None
    * @ exception None
    */
    constructor(
        address SSFTokenContractAddress,
        address MFTConractAddress) {
        _SSFTokenContractAddress = SSFTokenContractAddress;
        _MFTContractAddress = MFTConractAddress;
    }

    /**
    * createSale
    * 새로운 Sale 컨트랙트를 생성하고 관리할 정보들을 갱신
    * 
    * @ param uint256 MFTId MFT ID
    * @ param address seller 판매자
    * @ param uint256 buyNowPrice 즉시 구매 금액
    * @ param uint256 startedAt 판매 시작 시간
    * @ param bool negoAble 제안 가능 여부 
    * @ return None
    * @ exception 즉시 구매 금액은 0 이상이어야 함
    * @ exception MFT가 판매자의 소유여야 함    
    * @ exception 해당 MFT가 판매중이어서는 안됨
    */
    function createSale(
        uint256 MFTId,
        address seller,
        uint256 buyNowPrice, 
        bool negoAble
        ) public {
        require((buyNowPrice * (10**18)) >= 0, "Price must be higher than 0.");
        require(MFT(_MFTContractAddress).ownerOf(MFTId) == seller, "Seller is not owner.");
        require(!_saleStatusOfMFT[MFTId], "This MFT is already on sale.");

        // 새로운 Sale의 ID 결정
        _saleIds.increment();
        uint256 newMFTSaleId = _saleIds.current();
        
        // 새로운 Sale 컨트랙트 생성
        MFTSale newMFTSale = new MFTSale(MFTId, seller, (buyNowPrice * (10**18)), block.timestamp, negoAble, _SSFTokenContractAddress, _MFTContractAddress);

        // 새로운 Sale 컨트랙트가 거래 대상인 MFT에 대한 접근 권한을 획득
        MFT(_MFTContractAddress).approve(address(newMFTSale), MFTId);

        // Sale 관리 정보 갱신
        _saleAddrs[newMFTSaleId] = address(newMFTSale);
        _saleSellers[newMFTSaleId] = seller;
        _sellSaleIdsByWallet[seller].push(newMFTSaleId);
        _saleIdsByWallet[seller].push(newMFTSaleId);
        _saleIdsOfMFT[MFTId].push(newMFTSaleId);
        _saleStatusOfMFT[MFTId] = true;
        _currentSaleOfMFT[MFTId] = newMFTSaleId;

        emit SaleCreated(newMFTSaleId, address(newMFTSale), MFTId);
    }
    
    /**
    * createNego
    * 새로운 Nego 컨트랙트를 생성하고 관리할 정보들을 갱신
    * 
    * @ param uint256 saleId 제안한 Sale ID
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
    function createNego(
        uint256 saleId,
        address negoer,
        uint256 negoPrice,
        bool isChoiced,
        bool isCanceled
    ) public {
        require((negoPrice * (10 ** 18)) >= 0, "Price must be higher than 0.");
        require(!MFTSale(_saleAddrs[saleId]).getIsEnded(), "This sale is already ended.");
        require(MFTSale(_saleAddrs[saleId]).getNegoAble(), "This sale prohibits a negotiation.");
        require(SSFToken(_SSFTokenContractAddress).balanceOf(negoer) >= (negoPrice * (10 ** 18)), "Negoer's balance is exhausted.");

        // 새로운 Nego의 ID 결정
        _negoIds.increment();
        uint256 newMFTNegoId = _negoIds.current();

        // 새로운 Nego 컨트랙트 생성
        MFTNego newMFTNego = new MFTNego(_saleAddrs[saleId], negoer, (negoPrice * (10 ** 18)), block.timestamp, isChoiced, isCanceled);

        // Nego 관리정보 갱신
        _negoAddrs[newMFTNegoId] = address(newMFTNego);
        _negoIdsByWallet[negoer].push(newMFTNegoId);
        _negoIdsOfSale[saleId].push(newMFTNegoId);

        // Sale 컨트랙트 내 Nego 관리 함수 호출
        MFTSale(_saleAddrs[saleId]).reportNego(newMFTNegoId, address(newMFTNego), negoer, (negoPrice * (10 ** 18)), block.timestamp, isChoiced, isCanceled);
    
        emit NegoCreated(newMFTNegoId, address(newMFTNego), saleId);
    }

    /**
    * cancelSale
    * 해당 Sale을 취소하는 함수를 호출한다.
    * 
    * @ param uint256 saleId 취소할 Sale ID
    * @ return None
    * @ exception 취소할 Sale이 진행중이어야 함
    * @ exception 취소할 Sale이 취소상태가 아니어야 함
    */
    function cancelSale(
        uint256 saleId
    ) public {
        MFTSale canceledSale = MFTSale(_saleAddrs[saleId]);
        require(!canceledSale.getIsEnded(), "This sale is already ended.");
        require(!canceledSale.getIsCanceled(), "This sale is already canceled.");

        canceledSale.cancel();

        _saleStatusOfMFT[canceledSale.getMFTId()] = false;
    }

    /**
    * cancelNego
    * 해당 Nego를 취소하는 MFTSale의 함수를 호출한다.
    * 
    * @ param uint256 negoId 취소할 Nego ID
    * @ return None
    * @ exception 취소할 Nego가 속한 Sale이 진행중이어야 함
    * @ exception 취소할 Nego가 취소상태가 아니어야 함
    */
    function cancelNego(
        uint256 negoId
    ) public {
        // 취소할 Nego와 해당 Sale
        MFTNego canceledNego = MFTNego(_negoAddrs[negoId]);
        MFTSale includeSale = MFTSale(canceledNego.getSaleAddr());

        require(!includeSale.getIsEnded(), "This sale is already ended.");
        require(!canceledNego.getIsCanceled(), "This negotiation is already canceled.");

        // Sale 컨트랙트의 취소 함수 호출
        includeSale.cancelNego(negoId);
    }

    /**
    * buyNow
    * Sale의 즉시 구매 금액으로 구매하는 함수를 호출한다.
    * 구매자 관련 정보를 갱신한다.
    * 
    * @ param uint256 saleId Sale ID
    * @ param address buyer 구매자 지갑 주소
    * @ return None
    * @ exception 거래가 종료상태가 아니어야 함
    * @ exception 판매자가 MFT의 소유자여야 함
    * @ exception 구매자가 즉시 구매 금액 이상의 금액을 가지고 있어야 함
    */
    function buyNow(
        uint256 saleId,
        address buyer
    ) public {
        MFTSale finishedSale = MFTSale(_saleAddrs[saleId]);
        require(!finishedSale.getIsEnded(), "This sale is already ended.");
        require(MFT(_MFTContractAddress).ownerOf(finishedSale.getMFTId()) == finishedSale.getSeller(), "Seller must equal owner of the token.");
        require(SSFToken(_SSFTokenContractAddress).balanceOf(buyer) >= finishedSale.getBuyNowPrice(), "Buyer's balance is exhausted.");

        // 해당 Sale의 즉시 구매 함수를 호출
        finishedSale.buyNow(buyer);

        // 구매자 관련 정보를 갱신
        reportBuyer(saleId, buyer);
        _saleStatusOfMFT[finishedSale.getMFTId()] = false;
    }

    /**
    * acceptNego
    * 해당 Sale의 Nego를 수락하는 함수를 호출한다.
    * 구매자 관련 정보를 갱신한다.
    * 
    * @ param uint256 saleId 채택된 Nego가 포함된 Sale ID
    * @ param uint256 negoId 채택된 Nego ID
    * @ return None
    * @ exception 거래가 종료상태가 아니어야 함
    * @ exception 판매자가 MFT의 소유자여야 함
    * @ exception 채택된 Nego가 취소상태가 아니어야 함
    * @ exception 채택된 Nego가 채택된 상태가 아니어야 함
    */
    function acceptNego(
        uint256 saleId,
        uint256 negoId
    ) public {
        MFTSale finishedSale = MFTSale(_saleAddrs[saleId]);
        require(!finishedSale.getIsEnded(), "This sale is already ended.");
        require(finishedSale.getSeller() == msg.sender, "Only Seller can accept negotiation.");
        require(MFT(_MFTContractAddress).ownerOf(finishedSale.getMFTId()) == finishedSale.getSeller(), "Seller must equal owner of the token.");
    
        MFTNego choicedNego = MFTNego(_negoAddrs[negoId]);
        require(!choicedNego.getIsCanceled(), "This negotiation is canceled.");
        require(!choicedNego.getIsChoiced(), "This negotiation is already choiced.");

        // Nego를 수락하는 함수 호출
        finishedSale.acceptNego(negoId);

        // 구매자 관련 정보를 갱신
        reportBuyer(saleId, choicedNego.getNegoer());
        _saleStatusOfMFT[finishedSale.getMFTId()] = false;
    }

    /**
    * refundNego
    * 해당 Nego를 환불 받는다.
    * 
    * @ param uint256 saleId 채택된 Nego가 포함된 Sale ID
    * @ param uint256 negoId 채택된 Nego ID
    * @ param address refunder 환불하는 사람의 지갑 주소
    * @ return None
    * @ exception 거래가 종료상태여야 함
    * @ exception negoer가 refunder여야 함
    */
    function refundNego(
        uint256 saleId,
        uint256 negoId,
        address refunder
    ) public {
        MFTSale finishedSale = MFTSale(_saleAddrs[saleId]);
        require(finishedSale.getIsEnded(), "This sale is not ended yet.");
        
        MFTNego refundedNego = MFTNego(_negoAddrs[negoId]);
        require(refundedNego.getNegoer() == refunder, "Refunder is not a negoer.");

        finishedSale.refundNego(negoId, refunder);
    }

    /** 
    * reportBuyer
    * Sale 종료 후 구매자 정보 기록
    * 
    * @ param uint256 endedMFTSaleId 종료된 Sale Id
    * @ param address saleBuyer 구매자
    * @ return None
    * @ exception None
    */
    function reportBuyer(
        uint256 endedMFTSaleId,
        address saleBuyer) private {
        _saleBuyers[endedMFTSaleId] = saleBuyer;
        _buySaleIdsByWallet[saleBuyer].push(endedMFTSaleId);
        _saleIdsByWallet[saleBuyer].push(endedMFTSaleId);
    }

    /**
    * getSale
    * Sale의 Contract 주소를 반환
    *
    * @ param uint256 saleId 거래 ID
    * @ return address 거래 Contract address
    * @ exception None
    */
    function getSale(uint256 saleId) public view returns(address) {
        return _saleAddrs[saleId];
    }

    /**
    * getSeller
    * Sale의 판매자를 반환
    *
    * @ param uint256 saleId 거래 ID
    * @ return address 판매자 지갑 주소
    * @ exception None
    */
    function getSeller(uint256 saleId) public view returns(address) {
        return _saleSellers[saleId];
    }

    /**
    * getBuyer
    * Sale의 구매자를 반환
    *
    * @ param uint256 saleId 거래 ID
    * @ return address 구매자 지갑 주소
    * @ exception Sale이 진행 중이거나 판매 취소를 하였을 경우는 존재하지 않음
    */
    function getBuyer(uint256 saleId) public view returns(address) {
        require(_saleBuyers[saleId] != address(0), "This sale is proceeding or canceled.");

        return _saleBuyers[saleId];
    }

    /**
    * getSellIdsByWallet
    * 해당 지갑 주소의 모든 판매 SaleId 목록 반환
    *
    * @ param address seller 판매자 지갑 주소
    * @ return uint256 Sale Id 목록
    * @ exception None
    */
    function getSellIdsByWallet(address seller) public view returns(uint256[] memory) {
        return _sellSaleIdsByWallet[seller];
    }

    /**
    * getBuyIdsByWallet
    * 해당 지갑 주소의 모든 구매 SaleId 목록 반환
    *
    * @ param address buyer 구매자 지갑 주소
    * @ return uint256 Sale Id 목록
    * @ exception None
    */
    function getBuyIdsByWallet(address buyer) public view returns(uint256[] memory) {
        return _buySaleIdsByWallet[buyer];
    }

    /**
    * getSaleIdsByWallet
    * 해당 지갑 주소의 모든 SaleId 목록 반환
    *
    * @ param address walletAddr 지갑 주소
    * @ return uint256 Sale Id 목록
    * @ exception None
    */
    function getSaleIdsByWallet(address walletAddr) public view returns(uint256[] memory) {
        return _saleIdsByWallet[walletAddr];
    }

    /**
    * getSaleIdsOfMFT
    * 해당 MFT의 모든 SaleId 목록 반환
    *
    * @ param uint256 MFTId MFT ID
    * @ return uint256[] Sale Id 목록
    * @ exception None
    */
    function getSaleIdsOfMFT(uint256 MFTId) public view returns(uint256[] memory) {
        return _saleIdsOfMFT[MFTId];
    }

    /**
    * getSaleStatusOfMFT
    * 해당 MFT의 거래 상태를 반환
    * 거래 중: true, 거래 중 X: false 
    *
    * @ param uint256 MFTId MFT ID
    * @ return bool 거래 상태
    * @ exception None
    */
    function getSaleStatusOfMFT(uint256 MFTId) public view returns(bool) {
        return _saleStatusOfMFT[MFTId];
    }

    /**
    * getCurrentSaleOfMFT
    * 해당 MFT의 Sale ID를 반환 
    *
    * @ param uint256 MFTId MFT ID
    * @ return uint256 현재 거래
    * @ exception MFT가 현재 판매중이어야함
    */
    function getCurrentSaleOfMFT(uint256 MFTId) public view returns(uint256) {
        require(_saleStatusOfMFT[MFTId], "This MFT is not on sale.");
        return _currentSaleOfMFT[MFTId];
    }
}