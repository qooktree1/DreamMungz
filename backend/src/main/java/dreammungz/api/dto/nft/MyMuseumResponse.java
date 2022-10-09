package dreammungz.api.dto.nft;

import dreammungz.enums.*;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;

import java.util.List;

/*
@author 신슬기
@since 2022. 09. 30.
*/

@Getter
@Setter
@ApiModel(value = "박물관에 전시될 NFT", description = "직업별 가장 높은 등급의 NFT")
public class MyMuseumResponse {
    @ApiModelProperty(value = "NFT 리스트", name = "items")
    private List<NftInfo> items;

    @Getter
    @Setter
    @NoArgsConstructor
    static public class NftInfo {
        @ApiModelProperty(value = "토큰 식별자", name = "id", example = "0", dataType = "Long")
        private Long id;
        @ApiModelProperty(value = "메타데이터 url", name = "metadata", example = "metadata_url", dataType = "String")
        private String metadata;
        @ApiModelProperty(value = "이미지 url", name = "url", example = "image_url", dataType = "String")
        private String url;
        @ApiModelProperty(value = "모질", name = "hair", example = "ORIGINAL", dataType = "String")
        private Hair hair;
        @ApiModelProperty(value = "얼굴", name = "face", example = "BEAN", dataType = "String")
        private Face face;
        @ApiModelProperty(value = "등급", name = "tier", example = "LEGENDARY", dataType = "String")
        private Tier tier;
        @ApiModelProperty(value = "색상", name = "color", example = "GOLD", dataType = "String")
        private Color color;
        @ApiModelProperty(value = "성별", name = "gender", example = "F", dataType = "String")
        private Gender gender;
        @ApiModelProperty(value = "직업", name = "job", example = "KING", dataType = "String")
        private JobName job;
        @ApiModelProperty(value = "추가스탯", name = "status", example = "[{\"name\":\"STOUTNESS\",\"value\":1},{\"name\":\"VOICE\",\"value\":2}]", dataType = "StatusList")
        private List<StatusList> status;

        @Builder
        public NftInfo(Long id, String metadata, String url, Hair hair, Face face, Tier tier, Color color, Gender gender, JobName job, List<StatusList> status) {
            this.id = id;
            this.metadata = metadata;
            this.url = url;
            this.hair = hair;
            this.face = face;
            this.tier = tier;
            this.color = color;
            this.gender = gender;
            this.job = job;
            this.status = status;
        }

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
}
