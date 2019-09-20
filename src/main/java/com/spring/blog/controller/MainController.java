package com.spring.blog.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.blog.domain.Account;
import com.spring.blog.repository.AccountRepository;
import com.spring.blog.security.UserDetailsImpl;
import com.spring.blog.service.BoardService;
import com.spring.blog.service.HelloMessageService;
import com.spring.blog.service.MemberService;

@Controller
public class MainController {

	@Resource(name = "com.spring.blog.service.BoardService")
	BoardService boardService;

	@Resource(name = "com.spring.blog.service.MemberService")
	MemberService memberService;

	@RequestMapping(value = "/")
	public String index() throws Exception {
		// System.out.println(boardService.boardCount());
		return "index";
	}

	@RequestMapping("/admin")
	public void admin() {
	}

	@RequestMapping("/jira")
	public void jira() {
	}

	@RequestMapping("/user")
	public void user() {
	}

	@RequestMapping("/login")
	public void login() {
	}

	@RequestMapping("/registerForm")
	public void registerForm() {
	}

	// 필요한 부분은 Serivce계층으로 옮겨줘야 합니다.
	@Autowired
	AccountRepository accountRepository;
	@Autowired
	PasswordEncoder passwordEncoder;

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(Account account) {
		// 회원정보 데이터베이스에 저장
		account.setPassword(passwordEncoder.encode(account.getPassword()));
		accountRepository.save(account);

		// SecurityContextHolder에서 Context를 받아 인증 설정
		UserDetailsImpl userDetails = new UserDetailsImpl(account);
		Authentication authentication = new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
		SecurityContextHolder.getContext().setAuthentication(authentication);
		return "redirect:/";
	}

	@RequestMapping("/getPrivateMessage")
	@PreAuthorize("(#account.userid == principal.Username) or hasRole('ROLE_ADMIN')")
	public String authstring(Account account, Model model) {
		model.addAttribute("msg", "당신은 관리자거나 요청 파라미터랑 아이디가 같습니다?");
		return "authorizedMessage";
	}

	@RequestMapping("/getUserMessage")
	@PreAuthorize("hasRole('ROLE_USER')")
	public String userMesasge(Account account, Model model) {
		model.addAttribute("msg", "당신은 한낱 유저입니다. ㅠ");
		return "authorizedMessage";
	}

	@RequestMapping("/403")
	public void accessdeniedPage() {
	}

	@RequestMapping("/userinformation")
	public void userinformation(Model model) {
		model.addAttribute("user", accountRepository.findMe());
	}

	@Autowired
	HelloMessageService helloMessageService;

	@RequestMapping("/message")
	@ResponseBody
	public String getMessage() {
		return helloMessageService.getMessage();
	}

	
	private static final int RESULT_EXCEED_SIZE = -2;
	private static final int RESULT_UNACCEPTED_EXTENSION = -1;
	private static final int RESULT_SUCCESS = 1;
	private static final long LIMIT_SIZE = 10 * 1024 * 1024;

	// 로직은 언제나 Service에서 짜도록 하자.
	// 중간실패시 rollback은 고려하지 않았음.
	@ResponseBody
	@RequestMapping(value = "/imageupload", method = RequestMethod.POST)
	public int multiImageUpload(@RequestParam("files") List<MultipartFile> images) {
		long sizeSum = 0;
		for (MultipartFile image : images) {
			String originalName = image.getOriginalFilename();
			// 확장자 검사
			if (!isValidExtension(originalName)) {
				return RESULT_UNACCEPTED_EXTENSION;
			}

			// 용량 검사
			sizeSum += image.getSize();
			if (sizeSum >= LIMIT_SIZE) {
				return RESULT_EXCEED_SIZE;
			}

			// TODO 저장..
		}

		// 실제로는 저장 후 이미지를 불러올 위치를 콜백반환하거나,
		// 특정 행위를 유도하는 값을 주는 것이 옳은 것 같다.
		return RESULT_SUCCESS;
	}

	// required above jdk 1.7 - switch(String)
	private boolean isValidExtension(String originalName) {
		String originalNameExtension = originalName.substring(originalName.lastIndexOf(".") + 1);
		switch (originalNameExtension) {
		case "jpg":
		case "png":
		case "gif":
			return true;
		}
		return false;
	}

}
