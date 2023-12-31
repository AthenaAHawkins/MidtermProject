package com.skilldistillery.facebakawk.entities;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "post_like")
public class PostLike {
	
	@EmbeddedId
	private PostLikeId id;
	
	private boolean love;

	public PostLike() {

	}

	public boolean isLove() {
		return love;
	}

	public void setLove(boolean love) {
		this.love = love;
	}

	@Override
	public String toString() {
		return "PostLike [love=" + love + "]";
	}

}
