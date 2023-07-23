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

class ChickenTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Chicken chicken;

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
		chicken = em.find(Chicken.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		chicken = null;
	}

	@Test
	void test_Chicken_entity_mapping() {
		assertNotNull(chicken);
		assertEquals("Bernice", chicken.getName());
		assertEquals(72, chicken.getHeight());
	}
	
	@Test
	void test_Chicken_to_User_mapping() {
		assertNotNull(chicken);
		assertNotNull(chicken.getOwner());
		assertEquals("chicken_lover", chicken.getOwner().getUsername());
		
	}
	@Test
	void test_Chicken_to_Breed_mapping() {
		assertNotNull(chicken);
		assertNotNull(chicken.getBreed());
		assertEquals("Silkie", chicken.getBreed().getName());
	}
	
	@Test
	void test_chicken_birthday() {
		assertNotNull(chicken);
		assertNotNull(chicken.getBirthday());
		assertEquals(1990, chicken.getBirthday().getYear());
	}


}
