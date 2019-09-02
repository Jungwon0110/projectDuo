package com.spring.blog.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.blog.domain.Account;
import com.spring.blog.service.EmailServiceImpl;
import com.spring.blog.service.MemberService;

@Controller
public class MemberController {
	
	@Resource(name="com.spring.blog.service.MemberService")
	@Autowired
    MemberService memberService;
	@Autowired
	JavaMailSender javaMailSender;
	
	@RequestMapping("/find/{email}")
	@ResponseBody
	private Account findMemberByEmail(@PathVariable String email) throws Exception {
		Account existmem = memberService.findMemberByEmail(email);
		return existmem;
	}
	
	@RequestMapping(value="mail", method = RequestMethod.POST)
	public String Mail(HttpServletResponse req) {
		EmailServiceImpl email = new EmailServiceImpl();
		email.setJavaMailSender(javaMailSender);
		email.sendSimpleMessage("메일주소", "제목", "내용");
		return "redirect:/";
	}
}
