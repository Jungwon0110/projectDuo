package com.spring.blog.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.blog.dto.TestDTO;
import com.spring.blog.service.DbService;

@Controller
public class MainController {

	  
    @Autowired
    DbService dbService;
    
	
    @RequestMapping("/")
    public String index() {
        return "index";
    }
    
    @RequestMapping("/dbTest")
    public ModelAndView dbTest() throws Exception {
        
        List<TestDTO> list = new ArrayList<TestDTO>();
        list = dbService.getList();
        
        return new ModelAndView("dbTest", "list", list);
    }
    
    @RequestMapping("/admin")
    public void admin() {}
    
	
    @RequestMapping("/login")
    public void login() {}
    
    @RequestMapping("/user")
    public void user() {}
    
    
    
}

