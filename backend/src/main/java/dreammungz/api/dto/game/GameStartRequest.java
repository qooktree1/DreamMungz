package dreammungz.api.dto.game;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GameStartRequest {
    @ApiModelProperty(value="사용자 지갑 주소", name="address", example="0x1", dataType ="String")
    String address;
    @ApiModelProperty(value="교배 여부", name="mating", example="false", dataType ="boolean")
    boolean mating;
    @ApiModelProperty(value="아빠 강아지 NFT 번호", name="father", example="2", dataType ="Long")
    Long father;
    @ApiModelProperty(value="엄마 강아지 NFT 번호", name="mother", example="1", dataType ="Long")
    Long mother;
}
