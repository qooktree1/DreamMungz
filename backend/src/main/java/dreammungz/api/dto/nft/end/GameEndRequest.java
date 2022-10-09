package dreammungz.api.dto.nft.end;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;

import java.util.List;

    /*
    @author 신슬기
    @since 2022. 09. 19.
    */

@Getter
@Setter
@ApiModel(value = "NFT 정보", description = "색상, 모질, 얼굴, 등급, 직업, 성별, 추가 스탯 정보, 토큰 식별자, 메타데이터")
public class GameEndRequest {
    @ApiModelProperty(value = "색상", name = "color", example = "RAINBOW", dataType = "String")
    private String color;
    @ApiModelProperty(value = "모질", name = "hair", example = "CURLY", dataType = "String")
    private String hair;
    @ApiModelProperty(value = "얼굴", name = "face", example = "SCAR", dataType = "String")
    private String face;
    @ApiModelProperty(value = "등급", name = "tier", example = "RARE", dataType = "String")
    private String tier;
    @ApiModelProperty(value = "직업명", name = "job", example = "VOCALIST", dataType = "String")
    private String job;
    @ApiModelProperty(value = "성별", name = "gender", example = "F", dataType = "String")
    private String gender;
    @ApiModelProperty(value = "추가스탯", name = "status", example = "[{\"name\":\"STOUTNESS\",\"value\":3},{\"name\":\"VOICE\",\"value\":6}]", dataType = "StatusList")
    private List<StatusList> status;
    @ApiModelProperty(value = "토큰 식별자", name = "id", example = "0", dataType = "Long")
    private Long id;
    @ApiModelProperty(value = "이미지 url", name = "url", example = "image_url", dataType = "String")
    private String url;
    @ApiModelProperty(value = "메타데이터", name = "metadata", example = "url", dataType = "String")
    private String metadata;

    @Getter
    @Setter
    @RequiredArgsConstructor
    static public class StatusList {
        @ApiModelProperty(value = "능력치 이름", name = "name", example = "VOICE", dataType = "String")
        String name;
        @ApiModelProperty(value = "능력 수치", name = "value", example = "2", dataType = "Long")
        Long value;

        @Builder
        public StatusList(String name, Long value) {
            this.name = name;
            this.value = value;
        }
    }
}
