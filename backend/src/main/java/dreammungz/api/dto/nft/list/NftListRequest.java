package dreammungz.api.dto.nft.list;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

    /*
    @author 신슬기
    @since 2022. 09. 21.
    */


@Getter
@Setter
@ApiModel(value = "NFT 필터링 정보", description ="NFT 필터링에 필요한 정보들" )
public class NftListRequest {
    @ApiModelProperty(value = "지갑 주소", name = "address", example = "0x1", dataType = "String")
    private String address;
    @ApiModelProperty(value = "직업명", name = "job", example = "VOCALIST", dataType = "String")
    private String job;
    @ApiModelProperty(value = "모질", name = "hair", example = "CURLY", dataType = "String")
    private String hair;
    @ApiModelProperty(value = "등급", name = "tier", example = "RARE", dataType = "String")
    private String tier;
    @ApiModelProperty(value = "색상", name = "color", example = "RAINBOW", dataType = "String")
    private String color;
    @ApiModelProperty(value = "성별", name = "gender", example = "F", dataType = "String")
    private String gender;
    @ApiModelProperty(value = "얼굴", name = "face", example = "SCAR", dataType = "String")
    private String face;
    @ApiModelProperty(value = "페이지", name = "page", example = "1", dataType = "int")
    private int page;
    @ApiModelProperty(value = "판매 여부", name = "sell", example = "true", dataType = "boolean")
    private boolean sell;
    @ApiModelProperty(value = "스탯 목록", name = "status", example = "[\"STOUTNESS\",\"VOICE\",]", dataType = "List")
    private List<String> status;


}
