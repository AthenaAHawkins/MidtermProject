package com.skilldistillery.facebakawk.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.facebakawk.entities.User;

@Controller
public class AccountController {

	@RequestMapping(path="account.do")
	public String goToAccount(HttpSession session) {
		User inSession = (User) session.getAttribute("loggedInUser");
		if(inSession != null) {
			return "account";
		}else {
			
			return "login";
		}
			
	}
	
}
