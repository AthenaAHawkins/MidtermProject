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

@Entity
@Table(name="event_comment")
public class EventComment {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="comment_date")
	private LocalDateTime commentDate;
	
	@Column(name="post_content")
	private String postContent;
	
	@Column(name= "picture_url")
	private String pictureURL;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User commentor;
	
	@ManyToOne
	@JoinColumn(name="event_id")
	private Event event;
	
	@ManyToOne
	@JoinColumn(name = "in_reply_to_id")
	private EventComment comment;
	
	
	@OneToMany(mappedBy = "commentor")
	private List<EventComment> replys;
	
	public EventComment() {}

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

	public User getCommentor() {
		return commentor;
	}

	public void setCommentor(User commentor) {
		this.commentor = commentor;
	}

	public Event getEvent() {
		return event;
	}

	public void setEvent(Event event) {
		this.event = event;
	}

	@Override
	public String toString() {
		return "EventComment [id=" + id + ", commentDate=" + commentDate + ", postContent=" + postContent
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
		EventComment other = (EventComment) obj;
		return id == other.id;
	}

	public EventComment getComment() {
		return comment;
	}

	public void setComment(EventComment comment) {
		this.comment = comment;
	}

	public List<EventComment> getReplys() {
		return replys;
	}

	public void setReplys(List<EventComment> replys) {
		this.replys = replys;
	}
	
	

}
