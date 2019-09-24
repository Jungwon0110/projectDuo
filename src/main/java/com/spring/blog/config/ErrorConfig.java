package com.spring.blog.config;

import org.springframework.context.annotation.Configuration;

@Configuration
public class ErrorConfig {

	/**
	@Bean
	public ConfigurableServletWebServerFactory webServerFactory() {
		TomcatServletWebServerFactory factory = new TomcatServletWebServerFactory();
		factory.addErrorPages(new ErrorPage(HttpStatus.NOT_FOUND, "/error"));
		return factory;
	}
	 **/
}