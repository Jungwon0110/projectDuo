package com.spring.blog.service;


import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spring.blog.domain.Account;
import com.spring.blog.mapper.MemberMapper;
 
@Service("com.spring.blog.service.MemberService")
public class MemberService {
 
    @Resource(name="com.spring.blog.mapper.MemberMapper")
    MemberMapper membermapper;
    
    public Account findMemberByEmail(String email) throws Exception {
    	return membermapper.findMemberByEmail(email);
    }
    
    public void insertKey(HashMap<String, String> parameters) {
    	membermapper.insertKey(parameters);
    }
}

