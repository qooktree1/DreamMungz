package dreammungz.api.dto.nft.list;

import dreammungz.enums.*;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;

import java.util.List;

    /*
    @author 신슬기
    @since 2022. 09. 21.
    */

@Getter
@Setter
@ApiModel(value = "NFT 결과 반환", description = "NFT 필터링을 진행한 정보들")
public class NftListResponse {

    @ApiModelProperty(value = "NFT 리스트", name = "items")
    private List<NftInfo> items;
    @ApiModelProperty(value = "현재 페이지", name = "currentPage", example = "0", dataType = "int")
    private int currentPage;
    @ApiModelProperty(value = "전체 페이지", name = "totalPage", example = "10", dataType = "int")
    private int totalPage;

    @Getter
    @Setter
    @RequiredArgsConstructor
    static public class NftInfo {
        @ApiModelProperty(value = "토큰 식별자", name = "id", example = "0", dataType = "Long")
        private Long id;
        @ApiModelProperty(value = "이미지 url", name = "url", example = "image_url", dataType = "String")
        private String url;
        @ApiModelProperty(value = "메타데이터", name = "metadata", example = "url", dataType = "String")
        private String metadata;
        @ApiModelProperty(value = "직업명", name = "job", example = "KING", dataType = "String")
        private JobName job;
        @ApiModelProperty(value = "모질", name = "hair", example = "CURLY", dataType = "String")
        private Hair hair;
        @ApiModelProperty(value = "등급", name = "tier", example = "LEGENDARY", dataType = "String")
        private Tier tier;
        @ApiModelProperty(value = "색상", name = "color", example = "RAINBOW", dataType = "String")
        private Color color;
        @ApiModelProperty(value = "성별", name = "gender", example = "F", dataType = "String")
        private Gender gender;
        @ApiModelProperty(value = "얼굴", name = "face", example = "SCAR", dataType = "String")
        private Face face;
        @ApiModelProperty(value = "판매 여부", name = "sell", example = "true", dataType = "boolean")
        private boolean sell;

        @ApiModelProperty(value = "판매된 가격", name = "price", example = "23", dataType = "Long")
        private Long price;

        @ApiModelProperty(value = "추가스탯", name = "status", example = "[{\"name\":\"STOUTNESS\",\"value\":1},{\"name\":\"VOICE\",\"value\":2}]", dataType = "StatusList")
        private List<StatusList> status;

        @Builder
        public NftInfo(Long id, String url, String metadata, JobName job, Hair hair, Tier tier, Color color, Gender gender, Face face, boolean sell, Long price, List<StatusList> status) {
            this.id = id;
            this.url = url;
            this.metadata = metadata;
            this.job = job;
            this.hair = hair;
            this.tier = tier;
            this.color = color;
            this.gender = gender;
            this.face = face;
            this.sell = sell;
            this.price = price;
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
