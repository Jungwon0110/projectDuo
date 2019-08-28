package com.spring.blog.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.spring.blog.domain.Account;

public interface AccountRepository extends JpaRepository<Account, Long>{
	Account findByEmail(String email);

	@Query("select a from Account a where a.email = ?#{ principal.Username }")
	Account findMe();

}
