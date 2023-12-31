package com.skilldistillery.facebakawk.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.facebakawk.data.ChickenDAO;
import com.skilldistillery.facebakawk.data.UserDAO;
import com.skilldistillery.facebakawk.entities.Chicken;
import com.skilldistillery.facebakawk.entities.User;

@Controller
public class LoginController {
	
	@Autowired
	private UserDAO userDAO;

	@Autowired
	ChickenDAO chickenDAO;
	
	@RequestMapping(path="login.do", method=RequestMethod.GET)
	public String goToLoginForm() {
		return "login";
	}
	@RequestMapping(path="login.do", method=RequestMethod.POST)
	public String login(User user, HttpSession session, Model model) {
		user = userDAO.findByUserNameAndPassword(user.getUsername(), user.getPassword());
		
		if(user != null) {
//			model.addAttribute("chickenList", user.getChickens());
//			model.addAttribute("eventList", user.getEvents());
			session.setAttribute("loggedInUser", user);
			return "account";
		} else {
			return "login";
		}
		
	}

	@RequestMapping(path="logout.do")
	public String logout(HttpSession session, Model model) {
		session.removeAttribute("loggedInUser");
		Chicken spotlight = chickenDAO.spotlightChicken();
		model.addAttribute("spotlight", spotlight);
		return "home";
	}
	public void refreshSessionData(HttpSession session) {
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		session.setAttribute("loggedInUser",
				userDAO.findByUserNameAndPassword(loggedInUser.getUsername(), loggedInUser.getPassword()));
	}

}
