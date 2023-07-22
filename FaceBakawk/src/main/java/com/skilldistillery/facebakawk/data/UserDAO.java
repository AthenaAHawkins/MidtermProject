package com.skilldistillery.facebakawk.data;

import java.util.List;

import com.skilldistillery.facebakawk.entities.User;

public interface UserDAO {

	User findByUserNameAndPassword(String username, String password);

	List<User> findAll();

	List<User> searchByKeyword(String searchTerm);

	User findUserById(int userId);

	User create(User user);

	User updateUser(int userId, User user);

	boolean deleteById(int userId);
}
