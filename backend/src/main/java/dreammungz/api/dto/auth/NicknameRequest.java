package dreammungz.api.dto.auth;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

/*
@author 황승주
@since 2022. 09. 11.
*/

@Getter
@Setter
public class NicknameRequest {
    @ApiModelProperty(
            value = "회원의 지갑 주소",
            name = "address",
            dataType = "String")
    String address;

    @ApiModelProperty(
            value = "닉네임",
            name = "nickname",
            dataType = "String")
    String nickname;
}
