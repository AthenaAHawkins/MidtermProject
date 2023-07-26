package com.skilldistillery.facebakawk.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.facebakawk.data.CommentDAO;
import com.skilldistillery.facebakawk.data.PostDAO;
import com.skilldistillery.facebakawk.entities.Post;
import com.skilldistillery.facebakawk.entities.PostComment;

@Controller
public class PostController {
	
	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private CommentDAO commentDAO;
	
//	@RequestMapping(path = { "goToForumMain.do" })
//	public String goToForumMain() {
//		return "forumMainPage";
//	}
	
	@RequestMapping(path = { "displayPost.do" })
	public String displayPost(Model model, Integer postId) {
		System.out.println("\n\n\n\n\n\n PostID in post controller"+postId);
		Post post = postDAO.findPostById(postId);
		model.addAttribute("post", post);
		
		System.out.println("\n\n\n\n\n\n\nPOST ID"+ postId);
		
		List<PostComment> commentList = commentDAO.findAllCommentsForPost(postId); 
		model.addAttribute("commentList", commentList);
		
		System.out.println("\n\n\n\n\n\n\ncomment list"+commentList);
		
		return "displayPost";
	}

	@RequestMapping(path= {"displayAllPosts.do"})
	public String displayAllPosts(Model model) {
		List<Post> postList = postDAO.findAll(); 
		model.addAttribute("postList", postList);
		return "forumMainPage";
	}
	
	@RequestMapping(path= {"addComment.do"})
	public String addComment(Model model, PostComment userComment) {
		
		commentDAO.addCommentToPost(userComment);
		
		
		return "redirect:displayPost.do?postId="+userComment.getPost().getId();
	}
	

	
	
	
}
