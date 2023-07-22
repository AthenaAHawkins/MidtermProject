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

class PostTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Post post;

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
		post = em.find(Post.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		post = null;
	}

	@Test
	void test_Post_entity_mapping() {
		assertNotNull(post);
		assertEquals("Why are chickens so cute?", post.getTitle());
		assertEquals("I love them", post.getContent());
	}

	@Test
	void test_postToUser_mapping() {
		assertNotNull(post);
		assertNotNull(post.getUser());
		assertEquals("chicken_lover", post.getUser().getUsername());
	}

	@Test
	void postToPostImage_mapping() {
		assertNotNull(post);
		assertNotNull(post.getImages());
		assertTrue(post.getImages().size() > 0);
	}

	@Test
	void post_ToPostComment_mapping() {
		assertNotNull(post);
		assertNotNull(post.getComments());
		assertTrue(post.getComments().size() > 0);
	}

	@Test
	void test_user_ToPostComment_mapping() {
		assertNotNull(post);
		assertNotNull(post.getComments());
		assertTrue(post.getComments().size() > 0);

	}

	@Test
	void test_post_like() {
		assertNotNull(post);
		assertNotNull(post.getPostLikers());
		assertTrue(post.getPostLikers().size() > 0);
		
	}

}
