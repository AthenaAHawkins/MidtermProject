package com.skilldistillery.facebakawk.entities;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name="post_comment")
public class PostComment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name="comment_date")
	@CreationTimestamp
	private LocalDateTime commentDate;
	
	@Column(name="post_content")
	private String postContent;
	
	@Column(name= "picture_url")
	private String pictureURL;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;
	
	@ManyToOne
	@JoinColumn(name = "post_id")
	private Post post;
	
	
	@ManyToOne
	@JoinColumn(name = "in_reply_to_id")
	private PostComment commentor;
	
	
	@OneToMany(mappedBy = "commentor")
	private List<PostComment> replys;
	
	
	public PostComment() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public LocalDateTime getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(LocalDateTime commentDate) {
		this.commentDate = commentDate;
	}

	public String getPostContent() {
		return postContent;
	}

	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}

	public String getPictureURL() {
		return pictureURL;
	}

	public void setPictureURL(String pictureURL) {
		this.pictureURL = pictureURL;
	}
	

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	@Override
	public String toString() {
		return "PostComment [id=" + id + ", commentDate=" + commentDate + ", postContent=" + postContent
				+ ", pictureURL=" + pictureURL + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PostComment other = (PostComment) obj;
		return id == other.id;
	}

	public PostComment getCommentor() {
		return commentor;
	}

	public void setCommentor(PostComment commentor) {
		this.commentor = commentor;
	}

	public List<PostComment> getReplys() {
		return replys;
	}

	public void setReplys(List<PostComment> replys) {
		this.replys = replys;
	}

	

}
