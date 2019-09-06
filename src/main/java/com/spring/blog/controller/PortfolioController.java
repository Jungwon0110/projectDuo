package com.spring.blog.controller;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.blog.service.PortfolioService;

@Controller
public class PortfolioController {

	@Resource(name = "com.spring.blog.service.PortfolioService")
	@Autowired
	PortfolioService portfolioService;

	
	@RequestMapping("/portfolio")
	public String portfolioList(Model model) throws Exception {
		model.addAttribute("list", portfolioService.portfolioListService());
		model.addAttribute("count",portfolioService.portfolioCount());
		System.out.println(portfolioService.portfolioCount());
		return "portfolio";
	}
	
	
	@RequestMapping("/portfolioInsert")
	public void portfolioInsert(){
		
	}

	

}
