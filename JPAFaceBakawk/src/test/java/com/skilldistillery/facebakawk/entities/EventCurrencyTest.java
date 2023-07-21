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

class EventCurrencyTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private EventCurrency eventCurrency;

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
		eventCurrency = em.find(EventCurrency.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		eventCurrency = null;
	}

	@Test
	void test_Post_entity_mapping() {
		assertNotNull(eventCurrency);
		assertEquals(1, eventCurrency.getAmount());
	}

}
