package com.skilldistillery.facebakawk.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.facebakawk.data.UserDAO;
import com.skilldistillery.facebakawk.entities.User;

@Controller
public class AccountController {

	@Autowired
	private UserDAO userDAO;

	@RequestMapping(path = "account.do")
	public String goToAccount(Model model, HttpSession session) {
		refreshSessionData(session);
		User inSession = (User) session.getAttribute("loggedInUser");
		if (inSession != null) {
			refreshSessionData(session);
			model.addAttribute("chickenList", inSession.getChickens());

			return "account";
		} else {
			System.out.println("\n\n\n\n\nERROR IN ACCOUNTCONTROLLER");
			return "login";
		}
	}

	public void refreshSessionData(HttpSession session) {
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		session.setAttribute("loggedInUser",
				userDAO.findByUserNameAndPassword(loggedInUser.getUsername(), loggedInUser.getPassword()));
	}

}
