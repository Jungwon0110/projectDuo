package com.spring.blog.mapper;

import org.springframework.stereotype.Repository;

import com.spring.blog.domain.Account;

@Repository("com.spring.blog.mapper.MemberMapper")
public interface MemberMapper {
	//이메일로 유저찾기
    public Account findMemberByEmail(String email) throws Exception;
    
}


