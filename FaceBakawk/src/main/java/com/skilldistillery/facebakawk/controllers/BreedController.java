package com.skilldistillery.facebakawk.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.facebakawk.data.BreedDAO;
import com.skilldistillery.facebakawk.data.ChickenDAO;
import com.skilldistillery.facebakawk.entities.Breed;

@Controller
public class BreedController {

	@Autowired
	private BreedDAO breedDAO;

	@Autowired
	private ChickenDAO chickenDAO;

	@RequestMapping(path = { "getBreed.do" })
	public String displayBreed(Model model, Integer breedId) {
		Breed breed = breedDAO.findBreedById(breedId);
		model.addAttribute("breed", breed);
		return "displayBreed";

	}

	@RequestMapping(path = { "getAllBreeds.do" })
	public String displayAllBreeds(Model model) {
		List<Breed> breedList = breedDAO.findAll();
		model.addAttribute("breedList", breedList);
		return "breedDatabase";

	}

}
