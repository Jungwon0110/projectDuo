package com.spring.blog.controller;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.blog.service.BoardService;

@Controller
public class JiraController {

	@Resource(name = "com.spring.blog.service.BoardService")
	@Autowired
	BoardService boardService;

	@RequestMapping("/jira")
	public void jira() {}
	
	@RequestMapping(value ="/jiraInsert", method = RequestMethod.GET)
	public void jiraInsert() {}


}
