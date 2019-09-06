package com.spring.blog.controller;

import java.io.UnsupportedEncodingException;
import java.lang.ProcessBuilder.Redirect;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.blog.domain.Account;
import com.spring.blog.dto.AccountKeyDto;
import com.spring.blog.dto.BoardDto;
import com.spring.blog.dto.FileDto;
import com.spring.blog.dto.TempKey;
import com.spring.blog.repository.AccountRepository;
import com.spring.blog.service.MailServiceImpl;
import com.spring.blog.service.MemberService;

@Controller
public class MemberController {

	@Resource(name = "com.spring.blog.service.MemberService")
	
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

	@RequestMapping(value = "/emailConfirm/{email}", method = RequestMethod.POST)
	@ResponseBody
	public String sendMailAuth(@PathVariable String email) throws MessagingException, UnsupportedEncodingException {
		MailServiceImpl sendmail = new MailServiceImpl(javaMailSender);

		String key = new TempKey().getKey(50, false);

		AccountKeyDto actkey = new AccountKeyDto();
		actkey.setEmail(email);
		actkey.setAuthkey(key);

		String existkey = memberService.findKey(email);
		if (existkey != null) {
			memberService.updateKey(actkey);
		} else {
			memberService.insertKey(actkey);
		}

		sendmail.setSubject("[이메일 인증]");
		sendmail.setText(new StringBuffer().append("<h1>메일인증</h1>").append("<a href='http://localhost:8080/joinConfirm?email=").append(email).append("&authkey=").append(key).append("' target='_blank'>이메일 인증 확인</a>").toString());
		sendmail.setFrom("fffff4324@gmail.com", "projectDuo");
		sendmail.setTo(email);
		sendmail.send();
		return "/";
	}

	@RequestMapping(value = "/joinConfirm", method = RequestMethod.GET)
	public String confirmMember(@RequestParam(value = "email") String email, @RequestParam(value = "authkey") String authkey) throws Exception {

		String userkey = memberService.findKey(email);
		if (userkey.equals(authkey)) {
			memberService.changeRole(email);
			return "redirect:/";
		} else {
			return "notconfirm";
		}
	}

	@Autowired
	AccountRepository accountRepository;

	@RequestMapping("/myPage")
	public void myPage(Model model) {
		model.addAttribute("user", accountRepository.findMe());
	}
	
	@RequestMapping(value = "/updateMyPageProc/{email}",method = RequestMethod.POST)
	public String updateMyPageProc(HttpServletRequest request,@PathVariable String email) {
		Account account = new Account();
		
		account.setName(request.getParameter("name"));
		account.setIntroduce(request.getParameter("introduce"));
		account.setMy_image(request.getParameter("my_image"));
		account.setGithub_account(request.getParameter("github_account"));
		account.setBirth(request.getParameter("birth"));
		account.setEmail(email);
		System.out.println(email);
		memberService.memberUpdateService(account);
		return "redirect:/myPage";
	}
	

}