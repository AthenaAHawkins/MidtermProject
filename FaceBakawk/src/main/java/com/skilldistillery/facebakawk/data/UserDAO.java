package com.skilldistillery.facebakawk.data;

import com.skilldistillery.facebakawk.entities.User;

public interface UserDAO {

	User findByUserNameAndPassword(String username, String password);
	
}
