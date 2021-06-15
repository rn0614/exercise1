package com.multi.management;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AiController {
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	
}
