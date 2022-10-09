package dreammungz.api.controller;

import dreammungz.api.dto.trade.*;
import dreammungz.api.service.TradeService;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

/*
@author 박희조
@since 22. 09. 22.
 */

@RestController
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/trade")
public class TradeController {
    final TradeService tradeService;

    @ApiOperation(value = "NFT 판매 등록", notes = "판매페이지에 NFT를 등록한다.")
    @PostMapping("/nftRegister")
    public ResponseEntity<TradeRegisterRequest> registerNft(
            @RequestBody @ApiParam(value = "판매 등록을 위한 판매자, NFT 정보", required = true) TradeRegisterRequest tradeRegisterRequest){
        tradeService.registerNft(tradeRegisterRequest);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @ApiOperation(value = "NFT 판매 중단", notes = "판매페이지에 있던 NFT를 판매 중단한다.")
    @PutMapping("/nftStop")
    public ResponseEntity<TradeRegisterRequest> stopNft(
            @RequestBody @ApiParam(value = "판매 취소를 위한 판매자, NFT 정보", required = true) TradeStopRequest tradeStopRequest){
        tradeService.stopNft(tradeStopRequest);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @ApiOperation(value = "NFT 즉시 구매", notes = "판매페이지에 있던 NFT를 올린 가격으로 즉시 구매한다.")
    @PostMapping("/nftPurchase")
    public ResponseEntity<TradePurchaseRequest> purchaseNft(
            @RequestBody @ApiParam(value = "NFT 구매자, NFT 정보", required = true) TradePurchaseRequest tradePurchaseRequest){
        tradeService.purchaseNft(tradePurchaseRequest);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @ApiOperation(value = "NFT 네고 제안", notes = "판매페이지에 있던 NFT의 가격 네고를 제안한다.")
    @PostMapping("/offerRegister")
    public ResponseEntity<OfferRegisterRequest> registerOffer(
            @RequestBody @ApiParam(value = "오퍼 제안을 위한 구매자, NFT 정보", required = true) OfferRegisterRequest offerRegisterRequest){
        tradeService.registerOffer(offerRegisterRequest);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @ApiOperation(value = "NFT 네고 제안 취소", notes = "신청했던 NFT 네고 제안을 취소한다.")
    @PutMapping("/offerCancel")
    public ResponseEntity<OfferCancelRequest> cancelOffer(
            @RequestBody @ApiParam(value = "오퍼 제안을 위한 구매자, NFT 정보", required = true) OfferCancelRequest offerCancelRequest){
        tradeService.cancelOffer(offerCancelRequest);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @ApiOperation(value = "NFT 네고 제안 환불", notes = "네고 제안을 환불한다.")
    @PutMapping("/refund/{id}")
    public ResponseEntity<String> refundOffer(@ApiParam(value = "nego 컨트랙트 id", required = true) @PathVariable Long id){
        tradeService.refundOffer(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @ApiOperation(value = "NFT 네고 제안 수락", notes = "신청받은 NFT 네고 제안을 수락한다.")
    @PostMapping("/offerAccept")
    public ResponseEntity<OfferAcceptRequest> acceptOffer(
            @RequestBody @ApiParam(value = "오퍼 제안을 위한 구매자, NFT 정보", required = true) OfferAcceptRequest offerAcceptRequest){
        tradeService.acceptOffer(offerAcceptRequest);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @ApiOperation(value = "거래 이력 조회", notes = "회원의 거래 이력을 조회", response = TradeHistoryResponse.class)
    @GetMapping("/address/{address}/page/{page}")
    public ResponseEntity<TradeHistoryResponse> tradeHistory(@ApiParam(value = "지갑 주소", required = true) @PathVariable String address,@ApiParam(value = "현재 페이지", required = true) @PathVariable int page){
        TradeHistoryResponse response = tradeService.tradeHistory(address, page);
        return new ResponseEntity<>(response,HttpStatus.OK);
    }

    @ApiOperation(value = "NFT 상세 정보 조회", notes = "NFT의 판매정보, 상세정보, 가격 제안 내역을 제공한다.", response = NftInfoResponse.class)
    @GetMapping("/nft/{id}")
    public ResponseEntity<NftInfoResponse> nftInfo(@ApiParam(value = "NFT 토큰 id", required = true) @PathVariable Long id) {
        NftInfoResponse response = tradeService.nftInfo(id);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @ApiOperation(value = "네고 이력 조회", notes = "플레이어의 네고 이력을 조회한다.", response = OfferHistoryResponse.class)
    @GetMapping("/nego/address/{address}/page/{page}")
    public ResponseEntity<OfferHistoryResponse> offerHistory(@ApiParam(value = "지갑 주소", required = true) @PathVariable String address, @ApiParam(value = "현재 페이지", required = true) @PathVariable int page) {
        OfferHistoryResponse response = tradeService.offerHistory(address,page);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

}
