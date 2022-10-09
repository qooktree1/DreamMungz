package dreammungz.api.dto.nft.end;

import dreammungz.enums.*;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;

import java.util.List;

    /*
    @author 신슬기
    @since 2022. 09. 15.
    */

@Getter
@Setter
@ApiModel(value = "엔딩 정보", description = "색상, 모질, 얼굴, 등급, 직업, 성별, 추가 스탯 정보")
public class GameEndResponse {
    @ApiModelProperty(value = "색상", name = "color", example = "RAINBOW", dataType = "String")
    private Color color;
    @ApiModelProperty(value = "모질", name = "hair", example = "CURLY", dataType = "String")
    private Hair hair;
    @ApiModelProperty(value = "얼굴", name = "face", example = "SCAR", dataType = "String")
    private Face face;
    @ApiModelProperty(value = "등급", name = "tier", example = "LEGENDARY", dataType = "String")
    private Tier tier;
    @ApiModelProperty(value = "직업명", name = "job", example = "KING", dataType = "String")
    private JobName job;
    @ApiModelProperty(value = "성별", name = "gender", example = "F", dataType = "String")
    private Gender gender;
    @ApiModelProperty(value = "추가스탯", name = "status", example = "[{\"name\":\"STOUTNESS\",\"value\":1},{\"name\":\"VOICE\",\"value\":2}]", dataType = "StatusList")
    private List<StatusList> status;

    @Getter
    @Setter
    @RequiredArgsConstructor
    static public class StatusList {
        @ApiModelProperty(value = "능력치 이름", name = "name", example = "VOICE", dataType = "String")
        StatusName name;
        @ApiModelProperty(value = "능력 수치", name = "value", example = "2", dataType = "Long")
        Long value;

        @Builder
        public StatusList(StatusName name, Long value) {
            this.name = name;
            this.value = value;
        }
    }
}
