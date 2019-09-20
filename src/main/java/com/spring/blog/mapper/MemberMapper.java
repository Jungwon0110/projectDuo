package com.spring.blog.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring.blog.domain.Account;
import com.spring.blog.dto.AccountKeyDto;

@Repository("com.spring.blog.mapper.MemberMapper")
public interface MemberMapper {

   //이메일로 유저찾기
    public Account findMemberByEmail(String email) throws Exception;
    
    //key값 넣어주기
    public void insertKey(AccountKeyDto actkey);
    
    //key값 비교 
    public String findKey(String email);
    
    //role 변경
    public void changeRole(String email);
    
    //key가 있는 유저는 update
    public void updateKey(AccountKeyDto updatekey);

    //유저 수정
	public void updateMember(Account account);

	//권한변경
	public void updateRole2Admin(String email);

	//이름으로 멤버찾기
	public List<Account> findMemberByName(String name);
}