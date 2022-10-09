package dreammungz.api.controller;

import dreammungz.api.dto.nft.MyMuseumResponse;
import dreammungz.api.dto.nft.MyNftResponse;
import dreammungz.api.dto.nft.end.GameEndRequest;
import dreammungz.api.dto.nft.end.GameEndResponse;
import dreammungz.api.dto.nft.list.NftListRequest;
import dreammungz.api.dto.nft.list.NftListResponse;
import dreammungz.api.service.NftService;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

    /*
    @author 신슬기
    @since 2022. 09. 15.
    */

@RestController
@RequestMapping("/nft")
@RequiredArgsConstructor
public class NftController {
    private final NftService nftService;

    @ApiOperation(value = "NFT 리스트 조회", notes = "NFT 리스트를 조회한다.")
    @PostMapping("/list")
    public ResponseEntity<NftListResponse> searchNft(@ApiParam(value = "NFT 필터 정보") @RequestBody NftListRequest nftListRequest) {
        NftListResponse response = nftService.searchNft(nftListRequest);
        return new ResponseEntity<>(response, HttpStatus.OK);

    }

    @ApiOperation(value = "소유하고 있는 NFT 조회", notes = "판매중인 NFT를 제외한 소유한 NFT 정보를 제공한다.", response = MyNftResponse.class)
    @GetMapping("/address/{address}")
    public ResponseEntity<MyNftResponse> myNftList(@ApiParam(value = "지갑 주소", required = true) @PathVariable String address) {
        MyNftResponse response = nftService.myNftList(address);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @ApiOperation(value = "박물관에서 보여줄 NFT 조회", notes = "각 직업별 가장 높은 등급의 NFT 정보를 제공한다.", response = MyMuseumResponse.class)
    @GetMapping("/museum/address/{address}")
    public ResponseEntity<MyMuseumResponse> myMuseumList(@ApiParam(value = "지갑 주소", required = true) @PathVariable String address) {
        MyMuseumResponse response = nftService.myMuseumList(address);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @ApiOperation(value = "엔딩 결과 조회", notes = "지갑 주소에 있는 게임 데이터를 조회해 엔딩 결과를 생성한다.", response = GameEndResponse.class)
    @GetMapping("/result/address/{address}")
    public ResponseEntity<GameEndResponse> makeEnd(@ApiParam(value = "지갑 주소", required = true) @PathVariable String address) {
        GameEndResponse response = nftService.makeEnd(address);
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    @ApiOperation(value = "NFT 정보 저장", notes = "NFT 정보를 저장한다.")
    @PostMapping("/result/address/{address}")
    public ResponseEntity<GameEndRequest> saveNft(@ApiParam(value = "NFT 정보", required = true) @RequestBody GameEndRequest gameEndRequest, @ApiParam(value = "지갑 주소", required = true) @PathVariable String address) {
        nftService.saveNft(address, gameEndRequest);
        nftService.deleteGame(address);
        return new ResponseEntity<>(HttpStatus.OK);
    }

}
