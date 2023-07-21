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

class PostImageTest {



	private static EntityManagerFactory emf;
	private EntityManager em;
	private PostImage postImage;

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
		postImage = em.find(PostImage.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		postImage = null;
	}

	@Test
	void test_PostImage_entity_mapping() {
		assertNotNull(postImage);
		assertEquals("test pic", postImage.getCaption());
	}
}
