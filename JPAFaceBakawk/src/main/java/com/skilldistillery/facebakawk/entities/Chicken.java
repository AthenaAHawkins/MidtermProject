package com.skilldistillery.facebakawk.entities;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Chicken {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;

	private LocalDateTime birthday;

	@Column(name = "inches")
	private Double height;

	private char gender;

	@Column(name = "music_taste")
	private String musicTaste;

	@Column(name = "wants_chicks")
	private boolean wantsChicks;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private User owner;

	@ManyToOne
	@JoinColumn(name = "breed_id")
	private Breed breed;

	private String description;

	@Column(name = "create_date")
	private LocalDateTime createDate;

	@Column(name = "picture_url")
	private String pictureURL;

	public Chicken() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public LocalDateTime getBirthday() {
		return birthday;
	}

	public void setBirthday(LocalDateTime birthday) {
		this.birthday = birthday;
	}

	public Double getHeight() {
		return height;
	}

	public void setHeight(Double height) {
		this.height = height;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

	public String getMusicTaste() {
		return musicTaste;
	}

	public void setMusicTaste(String musicTaste) {
		this.musicTaste = musicTaste;
	}

	public boolean isWantsChicks() {
		return wantsChicks;
	}

	public void setWantsChicks(boolean wantsChicks) {
		this.wantsChicks = wantsChicks;
	}

	public User getOwner() {
		return owner;
	}

	public void setOwner(User owner) {
		this.owner = owner;
	}

	public Breed getBreed() {
		return breed;
	}

	public void setBreed(Breed breed) {
		this.breed = breed;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public LocalDateTime getCreateDate() {
		return createDate;
	}

	public void setCreateDate(LocalDateTime createDate) {
		this.createDate = createDate;
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
		Chicken other = (Chicken) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Chicken [id=" + id + ", name=" + name + ", birthday=" + birthday + ", height=" + height + ", gender="
				+ gender + ", musicTaste=" + musicTaste + ", wantsChicks=" + wantsChicks + ", description="
				+ description + ", createDate=" + createDate + "]";
	}

}
