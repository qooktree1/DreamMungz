package dreammungz.api.dto.game;

import io.swagger.annotations.ApiModelProperty;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class GameEndingCreditDto {
    @ApiModelProperty(
            value = "스토리 순서",
            name = "sequence",
            dataType = "Long")
    Long sequence;

    @ApiModelProperty(
            value = "사진 파일명",
            name = "image",
            dataType = "String")
    String image;       //사진 이름

    @ApiModelProperty(
            value = "스토리 제목",
            name = "title",
            dataType = "String")
    String title;

}
