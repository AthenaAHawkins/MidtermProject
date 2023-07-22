package com.skilldistillery.facebakawk.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class EventTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Event event;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPAFaceBakawk");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		event = em.find(Event.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		event = null;
	}

	@Test
	void test_Event_entity_mapping() {
		assertNotNull(event);
		assertEquals("Eggercise In the park", event.getTitle());
		assertEquals(2023, event.getEventDate().getYear());
	}

	@Test
	void test_Event_to_eventComment_mapping() {
		assertNotNull(event);
		assertNotNull(event.getComments());
		assertTrue(event.getComments().size() > 0);

	}
	@Test
	void test_Event_to_User_Mapping() {
		assertNotNull(event);
		assertNotNull(event.getCreator());
		assertEquals("chicken_lover", event.getCreator().getUsername());
	}
	
	@Test
	void test_Event_to_address_Mapping() {
		assertNotNull(event);
		assertNotNull(event.getAddress());
		assertEquals("Denver", event.getAddress().getCity());
	}

}
