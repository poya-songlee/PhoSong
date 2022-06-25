package kr.ac.kopo.phosong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {
	String path = "user/";
	
	@RequestMapping("/{unique}")
	public String user(@PathVariable int unique) {
		return path+"user"; 
	}


}
