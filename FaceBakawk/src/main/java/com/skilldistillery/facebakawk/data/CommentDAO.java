package com.skilldistillery.facebakawk.data;

import java.util.List;

import com.skilldistillery.facebakawk.entities.PostComment;

public interface CommentDAO {
	
	PostComment findCommentById(int commentId);
	List<PostComment> findAllCommentsForPost(int postId);
	public PostComment addCommentToPost(PostComment userComment) ;
}
