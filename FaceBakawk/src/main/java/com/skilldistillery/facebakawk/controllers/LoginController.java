package com.skilldistillery.facebakawk.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.facebakawk.data.UserDAO;
import com.skilldistillery.facebakawk.entities.User;

@Controller
public class LoginController {
	
	@Autowired
	private UserDAO userDAO;
	
	@RequestMapping(path="login.do", method=RequestMethod.GET)
	public String goToLoginForm() {
		return "login";
	}
	@RequestMapping(path="login.do", method=RequestMethod.POST)
	public String login(User user, HttpSession session) {
		user = userDAO.findByUserNameAndPassword(user.getUsername(), user.getPassword());
		if(user != null) {
			session.setAttribute("loggedInUser", user);
			return "account";
		} else {
			return "login";
		}
		
	}

	@RequestMapping(path="logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("loggedInUser");
		return "home";
	}
}
