package com.skilldistillery.facebakawk.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.facebakawk.entities.Address;
import com.skilldistillery.facebakawk.entities.Event;
import com.skilldistillery.facebakawk.entities.User;

@Service
@Transactional
public class EventDAOImpl implements EventDAO {

	@PersistenceContext
	private EntityManager em;

	
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
	public void updateEvent(Event event,Address address) {
		Event managedEvent = em.find(Event.class, event.getId());
		System.out.println("\n\n\n\nEvent in eventDAO "+event);
		System.out.println("\n\n\n\nEvent address in eventDAO "+event.getAddress());
		
		if(managedEvent != null) {
		managedEvent.getAddress().setStreet(address.getStreet());
		managedEvent.getAddress().setCity(address.getCity());
		managedEvent.getAddress().setState(address.getState());
		managedEvent.getAddress().setCountry(address.getCountry());
		managedEvent.getAddress().setZipCode(address.getZipCode());
		managedEvent.setTitle(event.getTitle());
		managedEvent.setCurrencies(event.getCurrencies());
		managedEvent.setStartTime(event.getStartTime());
		managedEvent.setEndTime(event.getEndTime());
		managedEvent.setEventDate(event.getEventDate());
		managedEvent.setDescription(event.getDescription());
		managedEvent.setPictureURL(event.getPictureURL());
		managedEvent.setAddress(event.getAddress());
		managedEvent.setId(event.getId());	
		}else {
			System.out.println("event was null");
		}
	}

	
	@Override
	public Event rsvpUserToEvent(int eventId, int userId) {
		Event managedEvent= em.find(Event.class, eventId );
		User managedUser = em.find(User.class, userId );
		managedEvent.addAttendee(managedUser);
		return managedEvent;
		
	} 
	@Override
	public boolean deleteById(int eventId) {

		boolean success = false;
		Event e = em.find(Event.class, eventId);

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