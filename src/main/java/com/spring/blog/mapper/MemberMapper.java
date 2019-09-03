package com.spring.blog.mapper;

import java.util.HashMap;

import org.springframework.stereotype.Repository;

import com.spring.blog.domain.Account;

@Repository("com.spring.blog.mapper.MemberMapper")
public interface MemberMapper {

	//이메일로 유저찾기
    public Account findMemberByEmail(String email) throws Exception;
    
    //key값 넣어주기
    public void insertKey(HashMap<String, String> parameters);
}
