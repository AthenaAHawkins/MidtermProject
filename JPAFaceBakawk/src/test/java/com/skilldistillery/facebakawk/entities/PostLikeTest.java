package com.skilldistillery.facebakawk.entities;

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

class PostLikeTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private PostLike postLike;

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
		PostLikeId id = new PostLikeId(1,1);
		postLike = em.find(PostLike.class, id);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		postLike = null;
	}

	@Test
	void test_Post_entity_mapping() {
		assertNotNull(postLike);
		assertTrue(postLike.isLove());
	}
}
