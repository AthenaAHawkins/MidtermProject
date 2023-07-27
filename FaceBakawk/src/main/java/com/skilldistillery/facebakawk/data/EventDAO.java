package com.skilldistillery.facebakawk.data;

import java.util.List;

import com.skilldistillery.facebakawk.entities.Address;
import com.skilldistillery.facebakawk.entities.Event;

public interface EventDAO {
	List<Event> findAll();

	List<Event> searchByKeyword(String searchTerm);

	Event findEventById(int eventId);

	Event create(Event event);

	void updateEvent(Event event, Address address);

	boolean deleteById(int eventId);
	
	Event rsvpUserToEvent(int eventId, int userId);
}
