package com.skilldistillery.facebakawk.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.facebakawk.data.AddressDAO;
import com.skilldistillery.facebakawk.data.EventDAO;
import com.skilldistillery.facebakawk.data.UserDAO;
import com.skilldistillery.facebakawk.entities.Address;
import com.skilldistillery.facebakawk.entities.Event;
import com.skilldistillery.facebakawk.entities.User;

@Controller
public class EventController {

	@Autowired
	private AddressDAO addressDAO;

	@Autowired
	private EventDAO eventDAO;

	@Autowired
	private UserDAO userDAO;

	@RequestMapping(path = { "displayEvent.do" })
	public String displayEvent(Model model, Integer eventId) {
		Event event = eventDAO.findEventById(eventId);

		model.addAttribute("event", event);
		return "displayEvent";
	}

	@RequestMapping(path = { "updateEvent.do" })
	public String updateEvent(Model model, Event event, HttpSession session) {
		Event eventGettingUpdated = (Event) model.getAttribute("event");
		System.out.println("\n\n\n\n\n\n\nEVENT PASSED IN" + event);
		System.out.println("\n\n\n\n\n\n\nEVENT GETTING UPDATED" + eventGettingUpdated);
		if (eventGettingUpdated != null) {
			event.setId(eventGettingUpdated.getId());
			eventDAO.updateEvent(event, event.getAddress());
			
			refreshSessionData(session);
		}

		return "displayEvent";
	}

	@RequestMapping(path = { "deleteEvent.do" })
	public String deleteEvent(Model model, Integer eventId) {
		eventDAO.deleteById(eventId);
		return "home";
	}

	@RequestMapping(path = "addEvent.do", method = RequestMethod.GET)
	public String goToLoginForm() {
		return "eventAddedMessage";
	}

	@RequestMapping(path = "updateEventButton.do")
	public String goToUpdateForm(Model model, Integer eventId) {
		System.out.println("EVENT ID IN UPDATE BUTTON "+eventId);
		Event event = eventDAO.findEventById(eventId);

		model.addAttribute("event", event);
		return "updateEvent";
	}

	public void refreshSessionData(HttpSession session) {
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		session.setAttribute("loggedInUser",
				userDAO.findByUserNameAndPassword(loggedInUser.getUsername(), loggedInUser.getPassword()));
	}

	@RequestMapping(path = "addEvent.do", method = RequestMethod.POST)
	public String addEvent(Model model, Event event, Address address, HttpSession session) {
		System.out.println("\n\n\n\n\n\n\n\nEVENT: " + event);
		System.out.println("\n\n\n\n\n\n\n\nADDRESS: " + address);
		User user = (User) session.getAttribute("loggedInUser");
		if (user != null) {
			addressDAO.create(address);
			event.setAddress(address);
			event.setCreator(user);
			eventDAO.create(event);
			System.out.println("\n\n\n\n\n\n\n\nUSER: " + user);
			refreshSessionData(session);
//				model.addAttribute("event", event);
			return "eventAddedMessage";
		} else {
			return "login";
		}
	}

	@RequestMapping(path = { "goToAddEvent.do" })
	public String redirectToAddEvent() {
		return "addEvent";
	}

	@RequestMapping(path = { "searchEvent.do" })
	public String searchEvent(Model model, String searchTerm) {
		List<Event> eventList = eventDAO.searchByKeyword(searchTerm);
		model.addAttribute("eventList", eventList);
		return "showSearched";
	}

	@RequestMapping(path = { "displayAllEvents.do" })
	public String displayAllEvents(Model model) {
		List<Event> eventList = eventDAO.findAll();
		model.addAttribute("eventList", eventList);
		return "displayAllEvents";
	}

}