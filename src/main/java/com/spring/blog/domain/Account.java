package com.spring.blog.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Account {
	@Id
	@GeneratedValue
	private Long id;
	private String name;
	@Column(unique = true)
	private String email;
	private String password;
	private String birth;
	private String github_account;
	private String role;
	private String introduce;
	private String my_image;
	public Account() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Account(Long id, String name, String email, String password, String birth, String github_account, String role, String introduce, String my_image) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.birth = birth;
		this.github_account = github_account;
		this.role = role;
		this.introduce = introduce;
		this.my_image = my_image;
	}
	@Override
	public String toString() {
		return "Account [id=" + id + ", name=" + name + ", email=" + email + ", password=" + password + ", birth=" + birth + ", github_account=" + github_account + ", role=" + role + ", introduce=" + introduce + ", my_image=" + my_image + "]";
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getGithub_account() {
		return github_account;
	}
	public void setGithub_account(String github_account) {
		this.github_account = github_account;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getMy_image() {
		return my_image;
	}
	public void setMy_image(String my_image) {
		this.my_image = my_image;
	}
	
}