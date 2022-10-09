package dreammungz.api.dto.trade;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OfferCancelRequest {
    @ApiModelProperty(value="구매자 지갑 주소", name="address", example="0x1", dataType ="String")
    String address;
    @ApiModelProperty(value="NFT 토큰 ID", name="token_id", example="1", dataType ="Long")
    Long tokenId;
    @ApiModelProperty(value="negotiation 컨트랙트 식별 ID", name="contract_id", example="1", dataType ="Long")
    Long contractId;
}
