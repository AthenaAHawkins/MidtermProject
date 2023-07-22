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

class EventCommentTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private EventComment eventComment;

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
		
		eventComment = em.find(EventComment.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		eventComment = null;
	}
	
	@Test
	void test_eventComment_basic_mapping() {
		assertNotNull(eventComment);
		assertEquals(2019, eventComment.getCommentDate().getYear());
	}
	
	
	@Test
	void user_list_and_event_list_tests() {
		assertNotNull(eventComment);
		assertNotNull(eventComment.getCommentor());
		assertNotNull(eventComment.getEvent());
		assertEquals("chicken_lover", eventComment.getCommentor().getUsername());
		assertEquals( 2023, eventComment.getEvent().getEventDate().getYear());
	}

	@Test
	void test_self_join_comment_and_replys() {
		assertNotNull(eventComment.getReplys());
		assertTrue(eventComment.getReplys().size() > 0);
		assertEquals("chicken_lover", eventComment.getCommentor().getUsername());
	}

}
