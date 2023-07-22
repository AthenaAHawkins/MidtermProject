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

class CurrencyTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Currency currency;

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
		currency = em.find(Currency.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		currency = null;
	}

	@Test
	void test_User_entity_mapping() {
		assertNotNull(currency);
		assertEquals("egg", currency.getType());
		
	}
    @Test 
    void test_event_currecny_relationship(){
    	assertNotNull(currency);
    	assertNotNull(currency.getEvents());
    	assertTrue(currency.getEvents().size()>0);
    }
	
}
