package com.spring.blog.service;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spring.blog.domain.Account;
import com.spring.blog.mapper.MemberMapper;
 
@Service("com.spring.blog.service.MemberService")
public class MemberService {
 
    @Resource(name="com.spring.blog.mapper.MemberMapper")
    MemberMapper memberMapper;
    
    public Account idCheck(String email) throws Exception {
    	return memberMapper.idCheck(email);
    }
	
}

