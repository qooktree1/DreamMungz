package dreammungz.exception;

import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

/*
@author 황승주
@since 2022. 09. 08.
*/

@Getter
@ToString
public class ExceptionResponse {
    private final String code;
    private final String message;

    @Builder
    public ExceptionResponse( String code, String message) {
        this.code = code;
        this.message = message;
    }
}
