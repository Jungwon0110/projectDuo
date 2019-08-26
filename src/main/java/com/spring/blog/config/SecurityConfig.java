package com.spring.blog.config;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;

@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	
	
	@Autowired UserDetailsService userDetailsService;
	
	
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		//auth.inMemoryAuthentication().withUser("admin").password("{noop}1234").roles("ADMIN");
		auth.userDetailsService(userDetailsService);
	} 
	
	protected void configure(HttpSecurity http) throws Exception {
		http
		.authorizeRequests() 
			.antMatchers("/admin/**").hasRole("ADMIN")
			.antMatchers("/user/**").hasAnyRole("USER","ADMIN")
			.antMatchers("/**").permitAll()
			.and()
			.formLogin()
			.loginPage("/login").permitAll();
	}
}
