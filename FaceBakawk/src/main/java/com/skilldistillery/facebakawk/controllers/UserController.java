package com.skilldistillery.facebakawk.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.facebakawk.data.UserDAO;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDAO;

	@RequestMapping(path = { "/", "home.do" })
	public String home(Model model) {
		model.addAttribute("DELETEME", userDAO.findByUserNameAndPassword("admin", "1234"));

		return "home";
	}

}
