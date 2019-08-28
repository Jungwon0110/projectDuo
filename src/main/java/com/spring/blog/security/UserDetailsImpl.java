package com.spring.blog.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.spring.blog.domain.Account;

// 기선님의 아무고나 소스 참조함.
public class UserDetailsImpl extends User {
	
	private String name;
	public String getName() { return name;}
	public void setNick(String nick) {this.name = name; }
	
	public UserDetailsImpl(Account account) {
		super(account.getEmail(), account.getPassword(), authorities(account));
		this.name = account.getName(); 
	}

	private static Collection<? extends GrantedAuthority> authorities(Account account) {
		List<GrantedAuthority> authorities = new ArrayList<>();
		//change To "1:N enun"
		authorities.add(new SimpleGrantedAuthority(account.getRole()));
		return authorities;
	}

	
	
	
}
