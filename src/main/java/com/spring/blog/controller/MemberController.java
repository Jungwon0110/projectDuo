package com.spring.blog.controller;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.blog.domain.Account;
import com.spring.blog.service.MemberService;

@Controller
public class MemberController {
	
	@Resource(name="com.spring.blog.service.MemberService")
	@Autowired
    MemberService memberService;
	
	@RequestMapping("/find/{email}")
	@ResponseBody
	private Account findMemberByEmail(@PathVariable String email) throws Exception {
		Account existmem = memberService.findMemberByEmail(email);
		return existmem;
	}
}
