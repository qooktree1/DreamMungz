package dreammungz.api.dto.trade;

import com.fasterxml.jackson.annotation.JsonFormat;
import dreammungz.enums.TradeType;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;

import java.time.LocalDateTime;
import java.util.List;

/*
@author 신슬기
@since 2022. 09. 24.
*/

@Getter
@Setter
@ApiModel(value = "거래 이력", description = "플레이어의 거래 이력")
public class TradeHistoryResponse {
    @ApiModelProperty(value = "거래 리스트", name = "items")
    private List<TradeItem> items;
    @ApiModelProperty(value = "현재 페이지", name = "currentPage", example = "0", dataType = "int")
    private int currentPage;
    @ApiModelProperty(value = "전체 페이지", name = "totalPage", example = "10", dataType = "int")
    private int totalPage;

    @Getter
    @Setter
    @RequiredArgsConstructor
    static public class TradeItem {
        @ApiModelProperty(value = "토큰 식별자", name = "id", example = "1", dataType = "Long")
        private Long id;
        @ApiModelProperty(value = "이미지 url", name = "url", example = "image_url", dataType = "String")
        private String url;
        @ApiModelProperty(value = "메타 데이터", name = "metadata", example = "image_url", dataType = "String")
        private String metadata;
        @ApiModelProperty(value = "구매/판매", name = "type", example = "BUY", dataType = "String")
        private TradeType type;
        @ApiModelProperty(value = "판매자 닉네임", name = "sellerNickname", example = "판매자닉네임", dataType = "String")
        private String sellerNickname;
        @ApiModelProperty(value = "판매자 지갑 주소", name = "sellerAddress", example = "0x1", dataType = "String")
        private String sellerAddress;
        @ApiModelProperty(value = "구매자 닉네임", name = "buyerNickname", example = "구매자닉네임", dataType = "String")
        private String buyerNickname;
        @ApiModelProperty(value = "구매자 지갑 주소", name = "buyerAddress", example = "0x2", dataType = "String")
        private String buyerAddress;
        @ApiModelProperty(value = "거래 완료 날짜", name = "date", example = "yyyy-mm-dd hh:mm:ss", dataType = "LocalDateTime")
        @JsonFormat(pattern ="yyyy-MM-dd HH:mm:ss")
        private LocalDateTime date;
        @ApiModelProperty(value = "판매된 가격", name = "price", example = "23", dataType = "Long")
        private Long price;

        @Builder
        public TradeItem(Long id, String url, String metadata, TradeType type, String sellerNickname, String sellerAddress, String buyerNickname, String buyerAddress, LocalDateTime date, Long price) {
            this.id = id;
            this.url = url;
            this.metadata = metadata;
            this.type = type;
            this.sellerNickname = sellerNickname;
            this.sellerAddress = sellerAddress;
            this.buyerNickname = buyerNickname;
            this.buyerAddress = buyerAddress;
            this.date = date;
            this.price = price;
        }
    }

}
