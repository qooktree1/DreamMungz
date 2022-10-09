package dreammungz.interceptor;

import dreammungz.config.jwt.JwtService;
import dreammungz.exception.CustomException;
import dreammungz.exception.CustomExceptionList;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.HandlerMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

/*
@author 황승주
@since 2022. 09. 30.
*/

@Component
@RequiredArgsConstructor
@Slf4j
public class WalletInterceptor implements HandlerInterceptor {
    private final JwtService jwtService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String url = request.getRequestURI();
        if (url.contains("swagger") || url.contains("api-docs") || url.contains("webjars")) {
            return true;
        }

        String token = request.getHeader("token");
        if (!jwtService.verifyToken(token)) {
            throw new CustomException(CustomExceptionList.TOKEN_EXPIRED);
        }

        Map<String, String> pathVariables = (Map) request.getAttribute(HandlerMapping.URI_TEMPLATE_VARIABLES_ATTRIBUTE);
        String value = (String) pathVariables.get("address");
        String address = jwtService.getAddress(token);
        if (!value.equals(address)) {
            throw new CustomException(CustomExceptionList.ADDRESS_NOT_MATCH);
        }
        return true;
    }
}