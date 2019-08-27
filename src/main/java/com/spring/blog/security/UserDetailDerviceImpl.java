package com.spring.blog.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.spring.blog.domain.Account;
import com.spring.blog.repository.AccountRepository;

public class UserDetailDerviceImpl implements UserDetailsService{
	@Autowired AccountRepository accountReposotory;
	
	
	@Override
	public UserDetails loadUserByUsername(String userid) throws UsernameNotFoundException {
		Account account =accountReposotory.findByUserid(userid);
		if(account == null) {
			throw new UsernameNotFoundException(userid);
		}
		return new UserDetailsImpl(account);
	}
	

}
