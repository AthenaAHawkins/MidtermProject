package com.skilldistillery.facebakawk.controllers;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.facebakawk.data.BreedDAO;
import com.skilldistillery.facebakawk.data.ChickenDAO;
import com.skilldistillery.facebakawk.data.MatchmakerDAO;
import com.skilldistillery.facebakawk.data.UserDAO;
import com.skilldistillery.facebakawk.entities.Chicken;
import com.skilldistillery.facebakawk.entities.User; 

@Controller
public class ChickenController {
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private BreedDAO breedDAO;

	@Autowired
	private ChickenDAO chickenDAO;

	@Autowired
	private MatchmakerDAO matchDAO;

	@RequestMapping(path = { "getChicken.do" })
	public String displayChicken(Model model, Integer chickenId) {
		Chicken chicken = chickenDAO.findChickenById(chickenId);
		if (chicken.getEnabled()) {
			model.addAttribute("chicken", chicken);

			return "displayChicken";
		} else {
			return "disabledPage";
		}
	}

	@RequestMapping(path = { "disbaleChicken.do" }, method=RequestMethod.POST)
	public String deleteChicken(Model model, Integer chickenId,HttpSession session) {
		chickenDAO.deleteById(chickenId);
		refreshSessionData(session);
		return "chickendisabled";
	}

	public void refreshSessionData(HttpSession session) {
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		session.setAttribute("loggedInUser",
				userDAO.findByUserNameAndPassword(loggedInUser.getUsername(), loggedInUser.getPassword()));
	}

	@RequestMapping(path = { "updateChickenInfo.do" }, method = RequestMethod.POST)
	public String updateChicken(HttpSession session, Chicken chicken, Integer chickenId) {
		User userInSession = (User) session.getAttribute("loggedInUser");

		if (userInSession != null) {
//			addressDAO.updateAddress(addressId, address);
//			User loggedInUser = userDAO.findUserById(userInSession.getId());

//			loggedInUser.setAddress(address);

			chickenDAO.updateChicken(userInSession, chicken);

			refreshSessionData(session);
			return "account";
		}
		return "account";
	}

	@RequestMapping(path = "addChicken.do", method = RequestMethod.GET)
	public String goToLoginForm() {
		return "home";
	}

	@RequestMapping(path = "addChicken.do", method = RequestMethod.POST)
	public String addChicken(Model model, Chicken chicken, HttpSession session, String birthday) {
		
		LocalDate birthdayOfChicken = LocalDate.parse(birthday);
		chicken.setBirthday(birthdayOfChicken);
		User user = (User) session.getAttribute("loggedInUser");
		if (user != null) {
//			chicken.setBreed(breed);
//			user.addChicken(chicken);
			chicken.setOwner(user);
			chickenDAO.create(chicken);
//			userDAO.updateUser(user.getId(), user);
			model.addAttribute("chicken", chicken);
			model.addAttribute("userId", user.getId());
			model.addAttribute("chickenList", chickenDAO.findAll());
			return "chickenAddedMessage";

		} else {
			return "chickenAddErrorMessage";
		}
	}

	@RequestMapping(path = { "goToAddChicken.do" })
	public String redirectToAddChicken(Model model) {
		model.addAttribute("breedList", breedDAO.findAll());
		return "addChicken";
	}

	@RequestMapping(path = { "goToUpdateChicken.do" })
	public String redirectToUpdateChicken(Model model, Integer chickenId) {
		Chicken chicken = chickenDAO.findChickenById(chickenId);
		model.addAttribute("breedList", breedDAO.findAll());
		model.addAttribute("chicken", chicken);
		return "updateChickenForm";
	}

	@RequestMapping(path = { "searchChicken.do" })
	public String searchChicken(Model model, String searchTerm) {
		List<Chicken> chickenList = chickenDAO.searchByKeyword(searchTerm);
		model.addAttribute("chickenList", chickenList);
		return "showSearched";
	}

	@RequestMapping(path = { "matchmaker.do" })
	public String matchmakeChicken(Model model, HttpSession session) {
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		List<Chicken> chickenList = loggedInUser.getChickens();
		List<List<Chicken>> matchedPairs = matchDAO.findMatches(chickenList);
		model.addAttribute("matchedPairs", matchedPairs);
		return "matchmaker";
	}
	@RequestMapping(path= {"spotlight.do"})
	public String spotlightChicken(Model model, Chicken chicken) {
		Chicken spotlight = chickenDAO.spotlightChicken();
		model.addAttribute("spotlight", spotlight);
		return "home";
		
	}

}
