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
public class AuthResponse {
    @ApiModelProperty(
            value = "회원의 지갑 주소",
            name = "address",
            dataType = "String")
    private String address;

    @ApiModelProperty(
            value = "회원의 임시 암호화 값",
            name = "nonce",
            dataType = "String")
    private String nonce;
}
