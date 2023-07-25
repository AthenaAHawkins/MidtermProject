package com.skilldistillery.facebakawk.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.facebakawk.data.AddressDAO;
import com.skilldistillery.facebakawk.data.ChickenDAO;
import com.skilldistillery.facebakawk.data.EventDAO;
import com.skilldistillery.facebakawk.data.UserDAO;
import com.skilldistillery.facebakawk.entities.Address;
import com.skilldistillery.facebakawk.entities.User;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private AddressDAO addressDAO;
	
	@Autowired
	private ChickenDAO chickenDAO;
	
	@Autowired
	private EventDAO eventDAO;

	@RequestMapping(path = { "/", "home.do" })
	public String home(Model model) {
		model.addAttribute("chickenList", chickenDAO.findAll());
		model.addAttribute("eventList", eventDAO.findAll());
		return "home";
	}

	public void refreshSessionData(HttpSession session) {
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		session.setAttribute("loggedInUser", userDAO.findByUserNameAndPassword(loggedInUser.getUsername(), loggedInUser.getPassword()));
	}
	
	@RequestMapping(path = { "getUser.do" })
	public String displayUser(Model model, Integer userId) {
		User user = userDAO.findUserById(userId);
		model.addAttribute("user", user);
		model.addAttribute("eventsAttended", user.getEventsAttended());
		return "displayUser";
	}

	@RequestMapping(path = { "deleteUser.do" })
	public String deleteUser(Model model, Integer userId) {

		userDAO.deleteById(userId);

		return "home";
	}

	@RequestMapping(path = { "editUser.do" })
	public String updateUser(Model model, User user, Integer userId) {
		System.out.println("in controller USERID " + userId);
		System.out.println("in controller " + user);
		userDAO.updateUser(userId, user);
		model.addAttribute("user", user);
		return "home";
	}
	
	@RequestMapping(path="register.do" , method=RequestMethod.POST)
	public String addUser(Model model, User user, Address address) {
		System.out.println("\n\n\n\n\n\n\n\nUSER: " + user);
		System.out.println("\n\n\n\n\n\n\n\nADDRESS: " + address);
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
