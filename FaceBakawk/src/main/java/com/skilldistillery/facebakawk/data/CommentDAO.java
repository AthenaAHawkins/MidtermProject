package com.skilldistillery.facebakawk.data;

import java.util.List;

import com.skilldistillery.facebakawk.entities.Post;
import com.skilldistillery.facebakawk.entities.PostComment;

public interface CommentDAO {
	
	PostComment findCommentById(int commentId);
	List<PostComment> findAllCommentsForPost(int postId);
	PostComment addCommentToPost(String userComment, Post post) ;
}
