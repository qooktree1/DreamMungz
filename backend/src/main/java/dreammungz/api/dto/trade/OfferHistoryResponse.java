package dreammungz.api.dto.trade;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Builder;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.List;

/*
@author 신슬기
@since 2022. 09. 26.
*/

@Getter
@Setter
@ApiModel(value = "네고 이력", description = "플레이어의 네고 이력")
public class OfferHistoryResponse {
    @ApiModelProperty(value = "거래 리스트", name = "items")
    private List<Offer> offer;
    @ApiModelProperty(value = "현재 페이지", name = "currentPage", example = "0", dataType = "int")
    private int currentPage;
    @ApiModelProperty(value = "전체 페이지", name = "totalPage", example = "10", dataType = "int")
    private int totalPage;

    @Getter
    @Setter
    @RequiredArgsConstructor
    static public class Offer {
        @ApiModelProperty(value = "토큰 식별자", name = "tokenId", example = "1", dataType = "Long")
        private Long tokenId;
        @ApiModelProperty(value = "이미지 url", name = "url", example = "image_url", dataType = "String")
        private String url;
        @ApiModelProperty(value = "메타데이터", name = "metadata", example = "metadata", dataType = "String")
        private String metadata;
        @ApiModelProperty(value = "제안 컨트랙트 id", name = "offerId", example = "1", dataType = "Long")
        private Long offerId;
        @ApiModelProperty(value = "거래 컨트랙트 id", name = "tradeId", example = "1", dataType = "Long")
        private Long tradeId;
        @ApiModelProperty(value = "제안자 닉네임", name = "offerNickname", example = "제안자닉네임", dataType = "String")
        private String offerNickname;
        @ApiModelProperty(value = "제안자 지갑주소", name = "offerAddress", example = "0x1", dataType = "String")
        private String offerAddress;
        @ApiModelProperty(value = "제안 날짜", name = "offerDate", example = "yyyy-mm-dd hh:mm:ss", dataType = "LocalDateTime")
        @JsonFormat(pattern ="yyyy-MM-dd HH:mm:ss")
        private LocalDateTime offerDate;
        @ApiModelProperty(value = "제안 가격", name = "offerPrice", example = "20", dataType = "Long")
        private Long offerPrice;
        @ApiModelProperty(value = "선택 여부", name = "choice", example = "true", dataType = "boolean")
        private boolean choice;
        @ApiModelProperty(value = "취소 여부", name = "cancel", example = "true", dataType = "boolean")
        private boolean cancel;
        @ApiModelProperty(value = "환불 여부", name = "refund", example = "true", dataType = "boolean")
        private boolean refund;
        @Builder
        public Offer(Long tokenId, String url, String metadata, Long offerId, Long tradeId, String offerNickname, String offerAddress, LocalDateTime offerDate, Long offerPrice, boolean choice, boolean cancel, boolean refund) {
            this.tokenId = tokenId;
            this.url = url;
            this.metadata = metadata;
            this.offerId = offerId;
            this.tradeId = tradeId;
            this.offerNickname = offerNickname;
            this.offerAddress = offerAddress;
            this.offerDate = offerDate;
            this.offerPrice = offerPrice;
            this.choice = choice;
            this.cancel = cancel;
            this.refund = refund;

        }
    }
}
