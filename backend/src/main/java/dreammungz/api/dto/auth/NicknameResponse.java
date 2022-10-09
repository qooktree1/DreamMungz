package dreammungz.api.dto.auth;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@ApiModel(value = "닉네임", description = "닉네임 정보")
public class NicknameResponse {
    @ApiModelProperty(value = "닉네임", name = "nickname", example = "UTQrGyEMhkt2sEx", dataType = "String")
    private String nickname;
}
