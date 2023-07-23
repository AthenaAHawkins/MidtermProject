package com.skilldistillery.facebakawk.data;

import java.util.List;

import com.skilldistillery.facebakawk.entities.Chicken;

public interface ChickenDAO  {
	
	List<Chicken> findAll();

	List<Chicken> searchByKeyword(String searchTerm);

	Chicken findChickenById(int chickenId);

	Chicken create(Chicken chicken);

	Chicken updateChicken(int chickenId, Chicken chicken);

	boolean deleteById(int chickenId);

}
