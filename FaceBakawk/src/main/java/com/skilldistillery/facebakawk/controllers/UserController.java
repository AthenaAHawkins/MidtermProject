package com.skilldistillery.facebakawk.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.facebakawk.data.AddressDAO;
import com.skilldistillery.facebakawk.data.UserDAO;
import com.skilldistillery.facebakawk.entities.Address;
import com.skilldistillery.facebakawk.entities.User;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private AddressDAO addressDAO;

	@RequestMapping(path = { "/", "home.do" })
	public String home(Model model, User user) {
		model.addAttribute("DELETEME", userDAO.findByUserNameAndPassword(user.getUsername(), user.getPassword()));

		return "home";
	}

	@RequestMapping(path = { "getUser.do" })
	public String displayUser(Model model, Integer userId) {
		User user = userDAO.findUserById(userId);
		model.addAttribute("user", user);
		return "User/show";
	}

	@RequestMapping(path = { "deleteUser.do" })
	public String deleteUser(Model model, Integer userId) {

		userDAO.deleteById(userId);

		return "home";
	}

	@RequestMapping(path = { "editUser.do" })
	public String updateUser(Model model, User user, Integer userId) {
		System.out.println("in controller FISHID " + userId);
		System.out.println("in controller " + user);
		userDAO.updateUser(userId, user);
		model.addAttribute("user", user);
		return "home";
	}

	@RequestMapping(path = { "addUser.do" })
	public String addUser(Model model, User user, Address address) {
		System.out.println("\n\n\n\n\n\n\n\nUSER: " + user);
		addressDAO.create(address);
		user.setAddress(address);
		userDAO.create(user);
//		model.addAttribute("address", address);
		model.addAttribute("user", user);
		return "home";
	}

	@RequestMapping(path = { "goToAddUser.do" })
	public String redirectToAddUser() {
		return "addUser";
	}

	@RequestMapping(path = { "searchUser.do" })
	public String searchUser(Model model, String searchTerm) {
		List<User> userList = userDAO.searchByKeyword(searchTerm);
		model.addAttribute("userList", userList);
		return "showSearched";
	}

}
