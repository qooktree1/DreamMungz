package dreammungz.api.dto.trade;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class OfferRegisterRequest {
    @ApiModelProperty(value="구매자 지갑 주소", name="address", example="0x1", dataType ="String")
    String address;
    @ApiModelProperty(value="NFT 토큰 ID", name="token_id", example="1", dataType ="Long")
    Long tokenId;
    @ApiModelProperty(value="제안 가격", name="price", example="10", dataType ="Long")
    Long price;
    @ApiModelProperty(value="trade 컨트랙트 식별 ID", name="trade_contract_id", example="1", dataType ="Long")
    Long tradeContractId;
    @ApiModelProperty(value="negotiation 컨트랙트 식별 ID", name="nego_contract_id", example="1", dataType ="Long")
    Long negoContractId;
}
