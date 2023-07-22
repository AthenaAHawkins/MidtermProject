package com.skilldistillery.facebakawk.data;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.facebakawk.entities.User;

@Service
@Transactional
public class UserDAOImpl implements UserDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public User findByUserNameAndPassword(String username, String password) {
		String jpql = "SELECT u FROM User u WHERE u.username = :un AND u.password = :pw AND u.enabled = true";
		
		User user = null;
		
		
		try {
			user = em.createQuery(jpql, User.class)
					.setParameter("un", username)
					.setParameter("pw", password)
					.getSingleResult();
		} catch (Exception e) {
//			e.printStackTrace();
			System.err.println("Invalid username or password");
		}
		
		return user;
	}

	  @Override
	  public User findUserById(int userId) {
	    User u = em.find(User.class, userId);
	    return u;
	  }


	@Override
	public User updateUser(int userId, User user) {
		// TODO Auto-generated method stub
		return null;
	}

}
