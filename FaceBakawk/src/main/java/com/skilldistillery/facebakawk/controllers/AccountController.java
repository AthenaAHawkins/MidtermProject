package com.skilldistillery.facebakawk.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.facebakawk.entities.User;

@Controller
public class AccountController {
	
	
	@RequestMapping(path="account.do")
	public String goToAccount(Model model,HttpSession session) {
		User inSession = (User) session.getAttribute("loggedInUser");
		if(inSession != null) {
			model.addAttribute("chickenList", inSession.getChickens());
			
			return "account";
		}else {
			
			return "login";
		}
	}
	
}
