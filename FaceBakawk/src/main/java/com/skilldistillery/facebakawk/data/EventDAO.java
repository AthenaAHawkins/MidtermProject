package com.skilldistillery.facebakawk.data;

import java.util.List;

import com.skilldistillery.facebakawk.entities.Event;

public interface EventDAO {
	List<Event> findAll();

	List<Event> searchByKeyword(String searchTerm);

	Event findEventById(int eventId);

	Event create(Event event);

	Event updateEvent(int eventId, Event event);

	boolean deleteById(int eventId);

}
