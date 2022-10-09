package dreammungz.api.dto.trade;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TradeRegisterRequest {
    @ApiModelProperty(value="판매자 지갑 주소", name="address", example="0x1", dataType ="String")
    String address;
    @ApiModelProperty(value="NFT 토큰 ID", name="token_id", example="1", dataType ="Long")
    Long tokenId;
    @ApiModelProperty(value="즉시 구매 가격", name="price", example="10", dataType ="Long")
    Long price;
    @ApiModelProperty(value="오퍼 여부", name="nego_able", example="true", dataType ="boolean")
    boolean negoAble;
    @ApiModelProperty(value="trade 컨트랙트 식별 ID", name="contract_id", example="1", dataType ="Long")
    Long contractId;
}
