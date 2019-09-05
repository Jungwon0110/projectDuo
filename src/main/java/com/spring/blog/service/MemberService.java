package com.spring.blog.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spring.blog.domain.Account;
import com.spring.blog.dto.AccountKeyDto;
import com.spring.blog.mapper.MemberMapper;
 
@Service("com.spring.blog.service.MemberService")
public class MemberService {
 
    @Resource(name="com.spring.blog.mapper.MemberMapper")
    MemberMapper membermapper;
    
    public Account findMemberByEmail(String email) throws Exception {
       return membermapper.findMemberByEmail(email);
    }
    
    public void insertKey(AccountKeyDto actkey) {
       membermapper.insertKey(actkey);
    }
    
    public String findKey(String email) {
       return membermapper.findKey(email);
    }
    
    public void changeRole(String email) {
       membermapper.changeRole(email);
    }
    
    public void updateKey(AccountKeyDto updatekey) {
    	membermapper.updateKey(updatekey);
    }

	public void memberUpdateService(Account account) {
		System.out.println(account.toString());
		membermapper.updateMember(account);
	}
}
