package com.spring.blog;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class testController {
	@RequestMapping("/")
	public String main() {
		return "templates/test";
	}
}
