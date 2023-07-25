package com.skilldistillery.facebakawk.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class UserTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private User user;

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

		user = em.find(User.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		user = null;
	}

	@Test
	void test_User_entity_mapping() {
		user = em.find(User.class, 3);
		assertNotNull(user);
		assertEquals("admin", user.getUsername());
		assertEquals("admin", user.getPassword());
	}

	@Test
	void test_userToPost_mapping() {
		assertNotNull(user);
		assertNotNull(user.getPosts());
		assertTrue(user.getPosts().size() > 0);
	}

	@Test
	void user_ToPostComment_mapping() {
		assertNotNull(user);
		assertNotNull(user.getComments());
		assertTrue(user.getComments().size() > 0);
	}

	@Test
	void user_To_Address_Mapping() {
		assertNotNull(user);
		assertNotNull(user.getAddress());
		assertEquals("Denver", user.getAddress().getCity());

	}

	@Test
	void user_To_Chicken_mapping() {
		assertNotNull(user);
		assertNotNull(user.getChickens());
		assertTrue(user.getChickens().size() > 0);
	}

	@Test
	void user_to_event_mapping() {
		assertNotNull(user);
		assertNotNull(user.getEventsAttended());
		assertTrue(user.getEventsAttended().size() > 0);

	}

	@Test
	void test_post_like() {
		assertNotNull(user);
		assertNotNull(user.getLikedPosts());
		assertTrue(user.getLikedPosts().size() > 0);
		
	}

}
