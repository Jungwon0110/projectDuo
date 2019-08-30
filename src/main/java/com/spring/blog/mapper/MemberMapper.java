package com.spring.blog.mapper;

import org.springframework.stereotype.Repository;

import com.spring.blog.domain.Account;

@Repository("com.spring.blog.mapper.MemberMapper")
public interface MemberMapper {
	// 중복체크
	public Account idCheck(String email) throws Exception;

}
