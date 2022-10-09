package dreammungz.api.dto.trade;

import com.fasterxml.jackson.annotation.JsonFormat;
import dreammungz.enums.*;
import io.swagger.annotations.ApiModelProperty;
import lombok.Builder;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.List;
@Getter
@Setter
public class NftInfoResponse {
    @ApiModelProperty(value = "NFT", name = "nft")
    private Nft nft;
    @ApiModelProperty(value = "Trade", name = "trade")
    private List<Trade> trade;
    @ApiModelProperty(value = "Offer", name = "offer")
    private List<Offer> offer;
    @ApiModelProperty(value = "true", name = "sell")
    private boolean sell;
    @ApiModelProperty(value = "true", name = "nego")
    private boolean nego;
    @ApiModelProperty(value = "20", name = "price")
    private Long price;
    @ApiModelProperty(value = "1", name = "traceId")
    private Long traceId;
    @ApiModelProperty(value = "user1", name = "sellerNickname")
    private String sellerNickname;
    @ApiModelProperty(value = "0x1", name = "sellerAddress")
    private String sellerAddress;

    @Getter
    @Setter
    @RequiredArgsConstructor
    static public class Nft {
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
        @ApiModelProperty(value = "추가스탯", name = "status", example = "[{\"name\":\"STOUTNESS\",\"value\":1},{\"name\":\"VOICE\",\"value\":2}]", dataType = "StatusList")
        private List<Status> status;
        @Builder
        public Nft(Long id, String url, String metadata, JobName job, Hair hair, Tier tier, Color color, Gender gender, Face face, List<Status> status) {
            this.id = id;
            this.url = url;
            this.metadata = metadata;
            this.job = job;
            this.hair = hair;
            this.tier = tier;
            this.color = color;
            this.gender = gender;
            this.face = face;
            this.status = status;
        }

        @Getter
        @Setter
        @RequiredArgsConstructor
        static public class Status {
            @ApiModelProperty(value = "능력치 이름", name = "name", example = "VOICE", dataType = "String")
            StatusName name;
            @ApiModelProperty(value = "능력 수치", name = "value", example = "2", dataType = "Long")
            Long value;
            @Builder
            public Status(StatusName name, Long value) {
                this.name = name;
                this.value = value;
            }
        }
    }

    @Getter
    @Setter
    @RequiredArgsConstructor
    static public class Trade {
        @ApiModelProperty(value = "거래 컨트랙트 id", name = "tradeId", example = "1", dataType = "Long")
        private Long tradeId;
        @ApiModelProperty(value = "판매자 닉네임", name = "sellerNickname", example = "판매자닉넴", dataType = "String")
        private String sellerNickname;
        @ApiModelProperty(value = "판매자 지갑 주소", name = "sellerAddress", example = "0x1", dataType = "String")
        private String sellerAddress;
        @ApiModelProperty(value = "구매자 닉네임", name = "buyerNickname", example = "구매자닉넴", dataType = "String")
        private String buyerNickname;
        @ApiModelProperty(value = "구매자 지갑 주소", name = "buyerAddress", example = "0x2", dataType = "String")
        private String buyerAddress;
        @ApiModelProperty(value = "거래 완료 날짜", name = "tradeDate", example = "yyyy-mm-dd hh:mm:ss", dataType = "LocalDateTime")
        @JsonFormat(pattern ="yyyy-MM-dd HH:mm:ss")
        private LocalDateTime tradeDate;
        @ApiModelProperty(value = "판매된 가격", name = "tradePrice", example = "23", dataType = "Long")
        private Long tradePrice;

        @Builder
        public Trade(Long tradeId, String sellerNickname, String sellerAddress, String buyerNickname, String buyerAddress, LocalDateTime tradeDate, Long tradePrice) {
            this.tradeId = tradeId;
            this.sellerNickname = sellerNickname;
            this.sellerAddress = sellerAddress;
            this.buyerNickname = buyerNickname;
            this.buyerAddress = buyerAddress;
            this.tradeDate = tradeDate;
            this.tradePrice = tradePrice;
        }
    }

    @Getter
    @Setter
    @RequiredArgsConstructor
    static public class Offer {
        @ApiModelProperty(value = "제안 컨트랙트 id", name = "offerId", example = "1", dataType = "Long")
        private Long offerId;
        @ApiModelProperty(value = "제안자 닉네임", name = "offerNickname", example = "offerNickname", dataType = "String")
        private String offerNickname;
        @ApiModelProperty(value = "제안자 지갑주소", name = "offerAddress", example = "0x1", dataType = "String")
        private String offerAddress;
        @ApiModelProperty(value = "제안 날짜", name = "offerDate", example = "yyyy-mm-dd hh:mm:ss", dataType = "LocalDateTime")
        @JsonFormat(pattern ="yyyy-MM-dd HH:mm:ss")
        private LocalDateTime offerDate;
        @ApiModelProperty(value = "제안 가격", name = "offerPrice", example = "20", dataType = "Long")
        private Long offerPrice;
        @Builder
        public Offer(Long offerId, String offerNickname, String offerAddress, LocalDateTime offerDate, Long offerPrice) {
            this.offerId = offerId;
            this.offerNickname = offerNickname;
            this.offerAddress = offerAddress;
            this.offerDate = offerDate;
            this.offerPrice = offerPrice;
        }
    }

    }



