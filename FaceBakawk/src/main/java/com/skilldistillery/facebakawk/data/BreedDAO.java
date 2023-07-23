package com.skilldistillery.facebakawk.data;

import java.util.List;

import com.skilldistillery.facebakawk.entities.Breed;

public interface BreedDAO {
	
	List<Breed> findAll();

	Breed findBreedById(int breedId);

	Breed create(Breed breed);

	Breed updateBreed(int breedId, Breed breed);

	boolean deleteById(int breedId);

}
