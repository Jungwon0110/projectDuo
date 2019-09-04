package com.spring.blog;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.spring.blog.domain.Account;
import com.spring.blog.repository.AccountRepository;

@SpringBootApplication
public class ProjectDuoApplication {

	
	
    public static void main(String[] args) {
        SpringApplication.run(ProjectDuoApplication.class, args);
    }

    @Autowired
    AccountRepository accountRepository;

    // 초기 시작시 데이터 초기화 (JPA : CREATE-DROP )
    // InitializingBean 참고 : 토비의 봄 - (1.5) 커맨드 라인 스프링 앱 만들기
    // https://www.youtube.com/watch?v=dnCf2-XYXL8

    @Autowired
    PasswordEncoder passwordEncoder;
    @Bean
    InitializingBean insertFixtureUsers(){
        return ()->{
            Account admin = new Account();
            admin.setEmail("admin@admin.com");;
            admin.setPassword(passwordEncoder.encode("1234"));
            admin.setRole("ROLE_ADMIN");
            admin.setName("관리자");
            admin.setBirth("none");
            admin.setGithubAccount("none");
            accountRepository.save(admin);

            Account user = new Account();
            user.setEmail("user@user.com");
            user.setPassword(passwordEncoder.encode("1234"));
            user.setRole("ROLE_USER");
            user.setName("일반유저");
            user.setBirth("none");
            user.setGithubAccount("none");
            accountRepository.save(user);

        };
    }
}
