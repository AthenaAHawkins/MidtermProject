package com.skilldistillery.facebakawk.data;

import java.util.List;

import com.skilldistillery.facebakawk.entities.Chicken;
import com.skilldistillery.facebakawk.entities.User;

public interface ChickenDAO {

	List<Chicken> findAll();

	List<Chicken> searchByKeyword(String searchTerm);

	Chicken findChickenById(int chickenId);

	Chicken create(Chicken chicken);

	void updateChicken(User user, Chicken chicken);

	boolean deleteById(int chickenId);
	
	Chicken spotlightChicken();

}
