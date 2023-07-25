package com.skilldistillery.facebakawk.data;

import java.util.List;

import com.skilldistillery.facebakawk.entities.Post;
import com.skilldistillery.facebakawk.entities.PostComment;

public interface PostDAO {
	
	List<Post> findAll();

	List<Post> searchByKeyword(String searchTerm);

	Post findPostById(int postId);

	Post create(Post post);

	Post updatePost(int postId, Post post);

	boolean deleteById(int postId);
	
	

}
