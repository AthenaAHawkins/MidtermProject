package com.skilldistillery.facebakawk.entities;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class PostLikeId implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Column(name="post_id")
	private int postId;
	
	@Column(name="user_id")
	private int userId;
	
	public PostLikeId() {}

	public int getPostId() {
		return postId;
	}

	public void setPostId(int postId) {
		this.postId = postId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		return Objects.hash(postId, userId);
	}
	
	

	public PostLikeId(int postId, int userId) {
		super();
		this.postId = postId;
		this.userId = userId;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PostLikeId other = (PostLikeId) obj;
		return postId == other.postId && userId == other.userId;
	}
	
	

}
