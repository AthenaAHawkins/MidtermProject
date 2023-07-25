package com.skilldistillery.facebakawk.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.facebakawk.data.BreedDAO;
import com.skilldistillery.facebakawk.data.ChickenDAO;
import com.skilldistillery.facebakawk.data.UserDAO;
import com.skilldistillery.facebakawk.entities.Breed;
import com.skilldistillery.facebakawk.entities.Chicken;
import com.skilldistillery.facebakawk.entities.User;

@Controller
public class ChickenController {

	@Autowired
	private BreedDAO breedDAO;

	@Autowired
	private ChickenDAO chickenDAO;

	@Autowired
	private UserDAO userDAO;

	@RequestMapping(path = { "getChicken.do" })
	public String displayChicken(Model model, Integer chickenId) {
		Chicken chicken = chickenDAO.findChickenById(chickenId);
		model.addAttribute("chicken", chicken);
		return "displayChicken";
	}

	@RequestMapping(path = { "deleteChicken.do" })
	public String deleteChicken(Model model, Integer chickenId) {

		chickenDAO.deleteById(chickenId);

		return "home";
	}

	@RequestMapping(path = { "editChicken.do" })
	public String updateChicken(Model model, Chicken chicken, Integer chickenId) {
		System.out.println("in controller USERID " + chickenId);
		System.out.println("in controller " + chicken);
		chickenDAO.updateChicken(chickenId, chicken);
		model.addAttribute("chicken", chicken);
		return "home";
	}

	@RequestMapping(path = "addChicken.do", method = RequestMethod.GET)
	public String goToLoginForm() {
		return "home";
	}

	@RequestMapping(path = "addChicken.do", method = RequestMethod.POST)
	public String addChicken(Model model, Chicken chicken, Breed breed, HttpSession session) {

		User user = (User) session.getAttribute("loggedInUser");
		if (user != null) {
			breedDAO.create(breed);
			chicken.setBreed(breed);
			user.addChicken(chicken);
			chickenDAO.create(chicken);
			userDAO.updateUser(user.getId(), user);
			model.addAttribute("chicken", chicken);
			model.addAttribute("userId", user.getId());
			model.addAttribute("chickenList", chickenDAO.findAll());
			return "chickenAddedMessage";

		} else {
			return "chickenAddErrorMessage";
		}
	}

	@RequestMapping(path = { "goToAddChicken.do" })
	public String redirectToAddChicken() {
		return "addChicken";
	}

	@RequestMapping(path = { "searchChicken.do" })
	public String searchChicken(Model model, String searchTerm) {
		List<Chicken> chickenList = chickenDAO.searchByKeyword(searchTerm);
		model.addAttribute("chickenList", chickenList);
		return "showSearched";
	}

}
