package com.spring.blog.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.spring.blog.domain.Account;

public interface AccountRepository extends JpaRepository<Account, Long> {

	Account findByUserId(String userId);
	
}
