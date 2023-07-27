package com.skilldistillery.facebakawk.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.facebakawk.data.CommentDAO;
import com.skilldistillery.facebakawk.data.PostDAO;
import com.skilldistillery.facebakawk.data.UserDAO;
import com.skilldistillery.facebakawk.entities.Post;
import com.skilldistillery.facebakawk.entities.Post;
import com.skilldistillery.facebakawk.entities.PostComment;
import com.skilldistillery.facebakawk.entities.User;

@Controller
public class PostController {

	@Autowired
	private PostDAO postDAO;

	@Autowired
	private CommentDAO commentDAO;
	
	@Autowired
	private UserDAO userDAO;
	

//	@RequestMapping(path = { "goToForumMain.do" })
//	public String goToForumMain() {
//		return "forumMainPage";
//	}

	@RequestMapping(path = { "displayPost.do" })
	public String displayPost(Model model, Integer postId) {
		System.out.println("\n\n\n\n\n\n PostID in post controller" + postId);
		Post post = postDAO.findPostById(postId);
		if (post.getEnabled()) {
			model.addAttribute("post", post);

			System.out.println("\n\n\n\n\n\n\nPOST ID" + postId);

			List<PostComment> commentList = commentDAO.findAllCommentsForPost(postId);
			model.addAttribute("commentList", commentList);

			System.out.println("\n\n\n\n\n\n\ncomment list" + commentList);

			return "displayPost";
		} else {
			return "disabledPage";
		}
	}

	@RequestMapping(path = { "addPost.do" })
	public String addPosts(Model model, Post post, Integer postId) {
		Post postToBeAdded = postDAO.create(post);
		model.addAttribute("post", postToBeAdded);
		return "forumMainPage";
	}

	@RequestMapping(path = { "displayAllPosts.do" })
	public String displayAllPosts(Model model) {
		List<Post> postList = postDAO.findAll();
		model.addAttribute("postList", postList);
		return "forumMainPage";
	}

	@RequestMapping(path = { "addComment.do" })
	public String addComment(Model model, PostComment userComment) {

		commentDAO.addCommentToPost(userComment);

		return "redirect:displayPost.do?postId=" + userComment.getPost().getId();
	}

	
	@RequestMapping(path= {"updatePost.do"})
	public String updatePost(Model model, Post post, Integer postId, HttpSession session) {
	postDAO.updatePost(postId, post);
	refreshSessionData(session);
	model.addAttribute("updatedPost", post);
	return displayAllPosts(model);
	
}
	
	@RequestMapping(path = { "goToUpdatePost.do" })
	public String redirectToUpdatePost(Model model, Integer postId) {
		Post post = postDAO.findPostById(postId);
		model.addAttribute("post", post);
		return "updatePost";
	}
	
	public void refreshSessionData(HttpSession session) {
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		session.setAttribute("loggedInUser",
				userDAO.findByUserNameAndPassword(loggedInUser.getUsername(), loggedInUser.getPassword()));
	}

}
