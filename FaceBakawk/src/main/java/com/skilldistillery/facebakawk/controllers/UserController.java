package com.skilldistillery.facebakawk.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.skilldistillery.facebakawk.data.UserDAO;

@Controller
public class UserController {
	
	@Autowired
	private UserDAO userDAO;

}