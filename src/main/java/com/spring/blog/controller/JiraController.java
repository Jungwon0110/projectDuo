package com.spring.blog.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.blog.dto.AgileBoardStartDto;
import com.spring.blog.service.JiraService;

@Controller
public class JiraController {

	@Resource(name = "com.spring.blog.service.JiraService")
	@Autowired
	JiraService jiraService;

	@RequestMapping(value = "/jira", method = RequestMethod.GET)
	public String jira(Model model) throws Exception {
		model.addAttribute("jiraList", jiraService.jiraListService());
		return "jira"; // 생성할 jsp
	}
	
	@RequestMapping(value = "/makeJiraBoardProc", method = RequestMethod.POST)
	public String makeJiraBoardProc(HttpServletRequest request) throws Exception {
		AgileBoardStartDto agileBoardStartDto = new AgileBoardStartDto();
		
		agileBoardStartDto.setAgileTitle(request.getParameter("agileTitle"));
		agileBoardStartDto.setAgileAuthor(request.getParameter("agileAuthor"));
		
		jiraService.jiraMakeService(agileBoardStartDto);
		System.out.println(request.getParameter("agileTitle"));
		return "redirect:/jira";
	}

	@RequestMapping("/agileBoard/{agileNum}")
	private String agileBoarde(@PathVariable int agileNum, Model model) throws Exception {
		model.addAttribute("jiraList", jiraService.jiraDetailService(agileNum));
		System.out.println(agileNum);
		return "jiraInsert";
	}
	

}