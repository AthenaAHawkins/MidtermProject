package com.skilldistillery.facebakawk.data;

import java.util.List;

import com.skilldistillery.facebakawk.entities.Chicken;

public interface ChickenDAO  {
	
	List<Chicken> findAll();

	List<Chicken> searchByKeyword(String searchTerm);

	Chicken findUserById(int userId);

	Chicken create(Chicken chicken);

	Chicken updateChicken(int userId, Chicken chicken);

	boolean deleteById(int userId);

}
