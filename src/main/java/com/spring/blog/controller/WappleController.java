package com.spring.blog.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.blog.service.BoardService;
import com.spring.blog.service.PortfolioService;

@Controller
public class WappleController {

	@Resource(name = "com.spring.blog.service.BoardService")
	@Autowired
	BoardService boardService;

	@Resource(name = "com.spring.blog.service.PortfolioService")
	@Autowired
	PortfolioService portfolioService;

	@RequestMapping("/wapple")
	public void wapple() {
	}

	@RequestMapping("/wappleCompleted")
	private String boardDelete(HttpServletRequest request,Model model) throws Exception {
		String search = request.getParameter("search");
		model.addAttribute("notice", boardService.wappleBoardService(search));
		model.addAttribute("portfolio", portfolioService.wapplePortfolioService(search));
		model.addAttribute("exSearch",search);
		System.out.println(search+" 검색완료");
		return "wappleCompleted";
	}

	
}
