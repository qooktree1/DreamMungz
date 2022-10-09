package dreammungz.api.dto.game;

import dreammungz.enums.StatusName;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class GameSelectionDto {
    @ApiModelProperty(
            value = "선택번호",
            name = "id",
            dataType = "Long")
    Long id;

    @ApiModelProperty(
            value = "선택내용",
            name = "content",
            dataType = "String")
    String content;

}
