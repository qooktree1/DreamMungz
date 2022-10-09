package dreammungz.config.swagger;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/*
@author 신슬기
@since 2022. 09. 14.
*/

@Configuration
@EnableSwagger2
public class SwaggerConfig {

    /*
    패키지 경로
    */
    @Bean
    public Docket api() {
        return new Docket(DocumentationType.SWAGGER_2).select()
                .apis(RequestHandlerSelectors.basePackage("dreammungz.api.controller"))
                .paths(PathSelectors.ant("/**"))
                .build().apiInfo(apiInfoMetaData());
    }

    /*
    Swagger UI에서 보여줄 정보 입력
    */
    private ApiInfo apiInfoMetaData() {
        return new ApiInfoBuilder().title("드림멍즈")
                .description("드림멍즈 API")
                .contact(new Contact("드림멍즈", "https://j7a605.p.ssafy.io/api", "dreammungz@gmail.com"))
                .version("1.0.0")
                .build();
    }
}