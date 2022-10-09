package dreammungz.interceptor;

import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.*;

/*
@author 황승주
@since 2022. 09. 30.
*/

@Configuration
@RequiredArgsConstructor
public class WebConfig extends WebMvcConfigurationSupport {

    private final AuthInterceptor authInterceptor;
    private final WalletInterceptor walletInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry interceptorRegistry) {

        interceptorRegistry.addInterceptor(walletInterceptor)
                .addPathPatterns("/auth/info/nickname/change/{address}");

    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/swagger-ui.html").addResourceLocations("classpath:/META-INF/resources/");
        registry.addResourceHandler("/webjars/**").addResourceLocations("classpath:/META-INF/resources/webjars/");
        super.addResourceHandlers(registry);
    }
}

