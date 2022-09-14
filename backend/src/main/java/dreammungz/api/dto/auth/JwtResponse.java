package dreammungz.api.dto.auth;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class JwtResponse {
    @ApiModelProperty(
            value = "엑세스 토큰",
            name = "token",
            dataType = "String")
    String token;

    @ApiModelProperty(
            value = "엑세스 토큰 만료기한",
            name = "expiration",
            dataType = "String")
    String expiration;
}
