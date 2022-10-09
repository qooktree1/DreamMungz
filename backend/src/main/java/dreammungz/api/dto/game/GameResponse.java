package dreammungz.api.dto.game;

/*
@author 박희조
@since 2022. 09. 13.
 */


import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class GameResponse{
    @ApiModelProperty(
            value = "스토리 제목",
            name = "title",
            dataType = "String")
    private String title;

    @ApiModelProperty(
            value = "씬 내용",
            name = "content",
            dataType = "String")
    private String content;

    @ApiModelProperty(
            value = "선택지 내용들",
            name = "selection",
            dataType = "GameSelectionDto(id, content)")
    private List<GameSelectionDto> selection;

    @ApiModelProperty(
            value = "사진 파일명",
            name = "image",
            dataType = "String")
    private String image;       //사진 이름

    @ApiModelProperty(
            value = "배경음악 파일명",
            name = "bgm",
            dataType = "String")
    private String bgm;

    @ApiModelProperty(
            value = "현재 강아지의 스탯 중 대부분",
            name = "status",
            dataType = "GameStatusDto(name, value)")
    private List<GameStatusDto> status;

    @ApiModelProperty(
            value = "현재 강아지의 스탯 중 정의로움",
            name = "justice",
            dataType = "Long")
    private Long justice;

    public GameResponse(String title, String content, String image, String bgm){
        this.title = title;
        this.content = content;
        this.image = image;
        this.bgm = bgm;
    }

    public GameResponse(){

    }
}