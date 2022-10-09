package dreammungz.api.dto.nft;

import dreammungz.enums.Gender;
import dreammungz.enums.StatusName;
import dreammungz.enums.Tier;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;

import java.util.List;

/*
@author 신슬기
@since 2022. 09. 23.
*/

@Getter
@Setter
@ApiModel(value = "가지고 있는 NFT", description = "플레이어가 가지고 있는 NFT")
public class MyNftResponse {
    @ApiModelProperty(value = "NFT 리스트", name = "items")
    private List<NftInfo> items;

    @Getter
    @Setter
    @NoArgsConstructor
    static public class NftInfo {
        @ApiModelProperty(value = "토큰 식별자", name = "id", example = "0", dataType = "Long")
        private Long id;
        @ApiModelProperty(value = "이미지 url", name = "url", example = "image_url", dataType = "String")
        private String url;
        @ApiModelProperty(value = "등급", name = "tier", example = "LEGENDARY", dataType = "String")
        private Tier tier;
        @ApiModelProperty(value = "성별", name = "gender", example = "F", dataType = "String")
        private Gender gender;
        @ApiModelProperty(value = "추가스탯", name = "status", example = "[{\"name\":\"STOUTNESS\",\"value\":1},{\"name\":\"VOICE\",\"value\":2}]", dataType = "StatusList")
        private List<StatusList> status;

        @Builder
        public NftInfo(Long id, String url, Tier tier, Gender gender, List<StatusList> status) {
            this.id = id;
            this.url = url;
            this.tier = tier;
            this.gender = gender;
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
