package dreammungz.config.jwt;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

/*
@author 황승주
@since 2022. 09. 11.
*/

@ToString
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Getter
public class Jwt {
    private String accessToken;

    public Jwt(String accessToken) {
        this.accessToken = accessToken;
    }
}

