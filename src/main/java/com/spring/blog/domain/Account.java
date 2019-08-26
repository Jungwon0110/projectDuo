package com.spring.blog.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Account {
	@Id
	@GeneratedValue
	private Long id;
	private String userId;
	private String password;
	private String role;
	private String nick;
	public Long getId() {
		return id;
	}
	public Account(Long id, String userId, String password, String role, String nick) {
		super();
		this.id = id;
		this.userId = userId;
		this.password = password;
		this.role = role;
		this.nick = nick;
	}
	@Override
	public String toString() {
		return "Account [id=" + id + ", userId=" + userId + ", password=" + password + ", role=" + role + ", nick="
				+ nick + "]";
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
}
