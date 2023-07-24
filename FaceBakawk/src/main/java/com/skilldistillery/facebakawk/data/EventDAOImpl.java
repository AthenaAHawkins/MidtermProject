package com.skilldistillery.facebakawk.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.facebakawk.entities.Event;

@Service
@Transactional
public class EventDAOImpl implements EventDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Event> findAll() {
		String jpql = "SELECT event FROM Event event";
		return em.createQuery(jpql, Event.class).getResultList();
	}

	@Override
	public List<Event> searchByKeyword(String searchTerm) {

		String jpql = "SELECT event FROM Event event WHERE event.name " + "LIKE :searchTerm OR event.description "
				+ "LIKE :searchTerm ";

		System.out.println("\n\n\nJPQL IN DAO " + jpql);
		TypedQuery<Event> query = em.createQuery(jpql, Event.class);
		query.setParameter("searchTerm", "%" + searchTerm + "%");
		return query.getResultList();
	}

	@Override
	public Event findEventById(int eventId) {
		Event e = em.find(Event.class, eventId);
		return e;
	}

	@Override
	public Event create(Event event) {
		em.persist(event);
		em.flush();
		return event;

	}

	@Override
	public Event updateEvent(int eventId, Event event) {
		Event e = em.find(Event.class, eventId);
		e.setTitle(event.getTitle());
		e.setCurrencies(event.getCurrencies());
		e.setStartTime(event.getStartTime());
		e.setEndTime(event.getEndTime());
		e.setEventDate(event.getEventDate());
		e.setCreateDate(event.getCreateDate());
		e.setDescription(event.getDescription());
		e.setPictureURL(event.getPictureURL());
		e.setCreator(event.getCreator());
		e.setAddress(event.getAddress());
		e.setEventComments(event.getEventComments());	
		e.setAttendees(event.getAttendees());
		e.setLastUpdate(event.getLastUpdate());
		e.setId(event.getId());	
		em.merge(e);
		em.flush();
		return e;
	}

	@Override
	public boolean deleteById(int userId) {

		boolean success = false;
		Event e = em.find(Event.class, userId);

		if (e == null) {
			return false;
		}

		if (!em.contains(e)) {
			success = true;
		}

		em.remove(e); // performs the delete on the managed entity
		em.flush();

		return success;
	}
}