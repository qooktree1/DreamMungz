package dreammungz.api.dto.game;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GameSelectRequest {
    @ApiModelProperty(value="사용자 지갑 주소", name="address", example="0x1", dataType ="String")
    String address;
    @ApiModelProperty(value="선택지 id", name="selection", example="0", dataType ="Long")
    Long selection;
}