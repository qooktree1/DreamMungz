pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

import "./SSFToken.sol";
import "./MFT.sol";
import "./MFTSale.sol";
import "./MFTNego.sol";

/**
* MFT 거래정보를 관리하는 컨트랙트
* 
* @author 황승주
* @since 2022. 09. 16.
*/

contract MFTSaleFactory is Ownable {
    using Counters for Counters.Counter;

    // Sale ID(1씩 자동 증가)
    Counters.Counter private _saleIds;
    // 제안 ID(1씩 자동 증가)
    Counters.Counter private _negoIds;
    // Sale 컨트랙트 주소
    mapping(uint256 => address) private _saleAddrs;
    // 제안 컨트랙트 주소
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
    mapping(uint256 => uint256[]) private _negoIdsByWallet;
    // 해당 Sale ID의 모든 Nego ID 목록
    mapping(uint256 => uint256[]) private _negoIdsOfSale;

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
    * @ param uint256 endedAt 판매 종료 시간
    * @ param bool negoAble 제안 가능 여부 
    * @ return None
    * @ exception 즉시 구매 금액은 0 이상이어야 함
    * @ exception 판매 종료 시간이 판매 시작 시간보다 늦어야 함
    */
    function createSale(
        uint256 MFTId,
        address seller,
        uint256 buyNowPrice, 
        uint256 startedAt, 
        uint256 endedAt, 
        bool negoAble
        ) public {
        require(buyNowPrice >= 0, "Price must be higher than 0.");
        require(startedAt < endedAt, "Endtime must be later than starttime.");

        // 새로운 Sale의 ID 결정
        _saleIds.increment();
        uint256 newMFTSaleId = _saleIds.current();
        
        // 새로운 Sale 컨트랙트 생성
        MFTSale newMFTSale = new MFTSale(MFTId, seller, buyNowPrice, startedAt, endedAt, negoAble, _SSFTokenContractAddress, _MFTContractAddress);

        // 새로운 Sale 컨트랙트가 거래 대상인 MFT에 대한 접근 권한을 획득
        MFT(_MFTContractAddress).approve(address(newMFTSale), MFTId);

        // Sale 관리 정보 갱신
        _saleAddrs[newMFTSaleId] = address(newMFTSale);
        _saleSellers[newMFTSaleId] = seller;
        _sellSaleIdsByWallet[seller].push(newMFTSaleId);
        _saleIdsByWallet[seller].push(newMFTSaleId);
        _saleIdsOfMFT[MFTId].push(newMFTSaleId);

        // Sale이 생성되었다는 event emit 필요
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
    */
    function createNego(
        uint256 saleId,
        address negoer,
        uint256 negoPrice,
        uint256 negoAt,
        bool isChoiced,
        bool isCanceled
    ) public {
        require(buyNowPrice >= 0, "Price must be higher than 0.");
        require(negoAt < Sale(_saleAddrs[saleId]).getEndedAt, "This sale is already ended.");

        // 새로운 Nego의 ID 결정
        _negoIds.increment();
        uint256 newMFTNegoId = _negoIds.current();

        // 새로운 Nego 컨트랙트 생성
        MFTNego newMFTNego = new MFTNego()


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
    function reportBuyer(address saleBuyer) public {
        _saleBuyers[endedMFTSaleId] = saleBuyer;
        _buySaleIdsByWallet[saleBuyer].push(endedMFTSaleId);
        _saleIds[saleBuyer].push(endedMFTSaleId);
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
        require(_saleBuyers[saleId] != 0, "This sale is proceeding or canceled.");

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
        return _saleIdsByWallet[seller];
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
        return _buyIdsByWallet[buyer];
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
}