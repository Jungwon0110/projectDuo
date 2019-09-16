package com.spring.blog.dto;

public class AccountKeyDto {
	private String email;
	private String authkey;

	@Override
	public String toString() {
		return "AccountKeyDto [email=" + email + ", authkey=" + authkey + "]";
	}

	public AccountKeyDto() {
		super();
	}

	public AccountKeyDto(String email, String authkey) {
		super();
		this.email = email;
		this.authkey = authkey;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAuthkey() {
		return authkey;
	}

	public void setAuthkey(String authkey) {
		this.authkey = authkey;
	}
}