package com.spring.blog.config;
 
import java.util.ArrayList;
import java.util.Collections;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.bind.annotation.RequestMethod;

import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.builders.ResponseMessageBuilder;
import springfox.documentation.schema.ModelRef;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.service.ResponseMessage;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;
 
@Configuration
@EnableSwagger2
public class SwaggerConfig {                                   
    @Bean
     
    public Docket api() {
        return new Docket(DocumentationType.SWAGGER_2) 
          .select()                                 
          .apis(RequestHandlerSelectors.basePackage("com.spring.blog.controller") )             
          .paths(PathSelectors.any())
          .build()
          .apiInfo(apiInfo())
          .useDefaultResponseMessages(false)                                  
          .globalResponseMessage(RequestMethod.GET, getArrayList());
         
    }
     
    private ArrayList<ResponseMessage> getArrayList(){
        ArrayList<ResponseMessage> lists = new ArrayList<ResponseMessage>();
         
        lists.add(new ResponseMessageBuilder().code(500).message("서버에러").responseModel(new ModelRef("Error")).build());
        lists.add(new ResponseMessageBuilder().code(403).message("권한없음").responseModel(new ModelRef("Forbbiden")).build());
         
        return lists;
    }
     
    private ApiInfo apiInfo() {
        return new ApiInfo(
          "ProjectDuo REST API",
          "Some custom description of API.",
          "API",
          "Terms of service",
          new Contact("Enter Wap", "www.example.com", "fffff0110@naver.com"),
          "License of API", "API license URL", Collections.emptyList());
   }
}