package dreammungz.exception;

import lombok.Getter;

/*
@author 황승주
@since 2022. 09. 08.
*/

@Getter
public class CustomException extends RuntimeException {
    private final CustomExceptionList exception;

    public CustomException(CustomExceptionList e) {
        super(e.getMessage());
        this.exception = e;
    }
}
