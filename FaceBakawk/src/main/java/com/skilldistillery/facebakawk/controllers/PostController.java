package com.skilldistillery.facebakawk.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.facebakawk.data.PostDAO;
import com.skilldistillery.facebakawk.entities.Post;

@Controller
public class PostController {
	
	@Autowired
	private PostDAO postDAO;
	
//	@RequestMapping(path = { "goToForumMain.do" })
//	public String goToForumMain() {
//		return "forumMainPage";
//	}
	
	@RequestMapping(path = { "displayPost.do" })
	public String displayPost(Model model, Integer postId) {
		Post post = postDAO.findPostById(postId);
		
		model.addAttribute("postList", post);
		return "displayPost";
	}

	@RequestMapping(path= {"displayAllPosts.do"})
	public String displayAllPosts(Model model) {
		List<Post> postList = postDAO.findAll(); 
		model.addAttribute("postList", postList);
		return "forumMainPage";
	}
	
}
