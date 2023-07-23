package com.skilldistillery.facebakawk.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.skilldistillery.facebakawk.entities.Breed;

public class BreedDAOImpl implements BreedDAO{
	

	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Breed> findAll() {
		String jpql = "SELECT breed FROM Breed breed";
		return em.createQuery(jpql, Breed.class).getResultList();
	}

	@Override
	public Breed findBreedById(int breedId) {
		Breed b = em.find(Breed.class, breedId);
		return b;
	}

	@Override
	public Breed create(Breed breed) {
		em.persist(breed);
		em.flush();
		return breed;

	}

	@Override
	public Breed updateBreed(int breedId, Breed breed) {
		Breed b = em.find(Breed.class, breedId);
		b.setName(breed.getName());
		b.setCharacteristic(breed.getCharacteristic());
		b.setPictureURL(breed.getPictureURL());
		
		em.merge(b);
		em.flush();
		return b;
	}
	@Override
	public boolean deleteById(int breedId) {

		boolean success = false;
		Breed b = em.find(Breed.class, breedId);

		if (b == null) {
			return false;
		}

		if (!em.contains(b)) {
			success = true;
		}

		em.remove(b); // performs the delete on the managed entity
		em.flush();

		return success;
	}

}
