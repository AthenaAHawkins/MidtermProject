package com.skilldistillery.facebakawk.entities;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
public class Event {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String title;
	
	@ManyToMany(mappedBy = "events")
	private List<Currency> currencies;

	@Column(name = "start_time")
	private LocalTime startTime;

	@Column(name = "end_time")
	private LocalTime endTime;

	@Column(name = "event_date")
	private LocalDate eventDate;

	private String description;

	@Column(name = "picture_url")
	private String pictureURL;

	@Column(name = "create_date")
	@CreationTimestamp
	private LocalDateTime createDate;

	@Column(name = "last_update")
	@UpdateTimestamp
	private LocalDateTime lastUpdate;

	@ManyToOne
	@JoinColumn(name = "creator_id")
	private User creator;

	@ManyToOne
	@JoinColumn(name = "address_id")
	private Address address;
	
	@OneToMany(mappedBy = "event")
	private List <EventComment> eventComments;
	
	@ManyToMany(mappedBy = "events")
	private List<User> attendees;
	
	public List<EventComment> getEventComments() {
		return eventComments;
	}

	public void setEventComments(List<EventComment> eventComments) {
		this.eventComments = eventComments;
	}

	public List<User> getAttendees() {
		return attendees;
	}

	public void setAttendees(List<User> attendees) {
		this.attendees = attendees;
	}


	public Event() {

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public LocalTime getStartTime() {
		return startTime;
	}

	public void setStartTime(LocalTime startTime) {
		this.startTime = startTime;
	}
	
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPictureURL() {
		return pictureURL;
	}

	public void setPictureURL(String pictureURL) {
		this.pictureURL = pictureURL;
	}

	public LocalDateTime getCreateDate() {
		return createDate;
	}

	public void setCreateDate(LocalDateTime createDate) {
		this.createDate = createDate;
	}

	public LocalDateTime getLastUpdate() {
		return lastUpdate;
	}

	public void setLastUpdate(LocalDateTime lastUpdate) {
		this.lastUpdate = lastUpdate;
	}

	public User getCreator() {
		return creator;
	}

	public void setCreator(User creator) {
		this.creator = creator;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public List<EventComment> getComments() {
		return eventComments;
	}

	public void setComments(List<EventComment> eventComments) {
		this.eventComments = eventComments;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}
	
	
	public void addAttendee(User user) {
		if(attendees == null) {
			attendees = new ArrayList<>();
		}
		if (!attendees.contains(user)) {
			attendees.add(user);
			user.addEvent(this);
		}
		
	}
	public void removeAttendee(User user) {
		if(attendees != null && attendees.contains(user)) {
			attendees.remove(user);
			user.addEvent(null);
		}
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Event other = (Event) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Event [id=" + id + ", title=" + title + ", currencies=" + currencies + ", startTime=" + startTime
				+ ", endTime=" + endTime + ", eventDate=" + eventDate + ", description=" + description + ", pictureURL="
				+ pictureURL + ", createDate=" + createDate + ", lastUpdate=" + lastUpdate + ", creator=" + creator
				+ ", address=" + address + ", eventComments=" + eventComments + ", attendees=" + attendees + "]";
	}

	public List<Currency> getCurrencies() {
		return currencies;
	}

	public void setCurrencies(List<Currency> currencies) {
		this.currencies = currencies;
	}

	public LocalDate getEventDate() {
		return eventDate;
	}

	public void setEventDate(LocalDate eventDate) {
		this.eventDate = eventDate;
	}

	public void setEndTime(LocalTime endTime) {
		this.endTime = endTime;
	}

	public LocalTime getEndTime() {
		return endTime;
	}

}
