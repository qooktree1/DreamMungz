package dreammungz.api.dto.game;

import dreammungz.enums.StatusName;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class GameStatusDto {
    @ApiModelProperty(
            value = "스탯명",
            name = "name",
            dataType = "StatusName")
    StatusName name;

    @ApiModelProperty(
            value = "스탯값",
            name = "value",
            dataType = "Long")
    Long value;

}