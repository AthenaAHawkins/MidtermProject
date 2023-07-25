package com.skilldistillery.facebakawk.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
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
			user = em.createQuery(jpql, User.class).setParameter("un", username).setParameter("pw", password)
					.getSingleResult();
			user.getChickens().size();
			user.getEventsAttended().size();
			user.getEventsCreated().size();

		} catch (Exception e) {
//			e.printStackTrace();
			System.err.println("Invalid username or password");
		}

		return user;
	}

	@Override
	public List<User> findAll() {
		String jpql = "SELECT user FROM User user";
		return em.createQuery(jpql, User.class).getResultList();
	}

	@Override
	public List<User> searchByKeyword(String searchTerm) {

		String jpql = "SELECT user FROM User user WHERE user.firstName " + "LIKE :searchTerm OR user.username "
				+ "LIKE :searchTerm OR user.description " + "LIKE :searchTerm";

		System.out.println("\n\n\nJPQL IN DAO " + jpql);
		TypedQuery<User> query = em.createQuery(jpql, User.class);
		query.setParameter("searchTerm", "%" + searchTerm + "%");
		return query.getResultList();
	}

	@Override
	public User findUserById(int userId) {
		User u = em.find(User.class, userId);
		return u;
	}

	@Override
	public User create(User user) {
		user.setEnabled(true);
		em.persist(user);
		em.flush();
		return user;

	}

	@Override
	public User updateUser(int userId, User user) {
		User u = em.find(User.class, userId);
		u.setAddress(user.getAddress());
		u.setChickens(user.getChickens());
		u.setComments(user.getComments());
		u.setCreateDate(user.getCreateDate());
		u.setDescription(user.getDescription());
		u.setEnabled(user.getEnabled());
		u.setEventsAttended(user.getEventsAttended());
		u.setFirstName(user.getFirstName());
		u.setLastName(user.getLastName()); 
		u.setLikedPosts(user.getLikedPosts());
		u.setPassword(user.getPassword());
		u.setPictureURL(user.getPictureURL());
		u.setPosts(user.getPosts());
		u.setRole(user.getRole());
		u.setUsername(user.getUsername());
		u.setId(user.getId());
		em.merge(u);
		em.flush();
		return u;
	}

	@Override
	public boolean deleteById(int userId) {

		boolean success = false;
		User u = em.find(User.class, userId);

		if (u == null) {
			return false;
		}

		if (!em.contains(u)) {
			success = true;
		}

		em.remove(u); // performs the delete on the managed entity
		em.flush();

		return success;
	}

}
