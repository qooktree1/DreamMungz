package dreammungz.api.dto.trade;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TradeStopRequest {
    @ApiModelProperty(value="판매자 지갑 주소", name="address", example="0x1", dataType ="String")
    String address;
    @ApiModelProperty(value="NFT 토큰 ID", name="token_id", example="1", dataType ="Long")
    Long tokenId;
    @ApiModelProperty(value="trade 컨트랙트 식별 ID", name="contract_id", example="1", dataType ="Long")
    Long contractId;
}
