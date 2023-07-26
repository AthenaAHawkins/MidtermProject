package com.skilldistillery.facebakawk.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.facebakawk.entities.Breed;
import com.skilldistillery.facebakawk.entities.Chicken;
import com.skilldistillery.facebakawk.entities.User;

@Service
@Transactional
public class ChickenDAOImpl implements ChickenDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Chicken> findAll() {
		String jpql = "SELECT chicken FROM Chicken chicken";
		return em.createQuery(jpql, Chicken.class).getResultList();
	}

	@Override
	public List<Chicken> searchByKeyword(String searchTerm) {

		String jpql = "SELECT chicken FROM Chicken chicken WHERE chicken.name " + "LIKE :searchTerm OR chicken.breed "
				+ "LIKE :searchTerm OR chicken.description " + "LIKE :searchTerm OR chicken.gender "
				+ "LIKE :searchTerm";

		System.out.println("\n\n\nJPQL IN DAO " + jpql);
		TypedQuery<Chicken> query = em.createQuery(jpql, Chicken.class);
		query.setParameter("searchTerm", "%" + searchTerm + "%");
		return query.getResultList();
	}

	@Override
	public Chicken findChickenById(int chickenId) {
		Chicken u = em.find(Chicken.class, chickenId);
		return u;
	}

	@Override
	public Chicken create(Chicken chicken) {
		em.persist(chicken);
		em.flush();
		return chicken;

	}

	@Override
	public void updateChicken(User user, Chicken chicken) {
		Chicken manageChicken = em.find(Chicken.class, chicken.getId());
		if (manageChicken != null) {
			manageChicken.setName(chicken.getName());
			manageChicken.setWantsChicks(chicken.isWantsChicks());
			manageChicken.setDescription(chicken.getDescription());
			manageChicken.setPictureURL(chicken.getPictureURL());
		}


	}

	@Override
	public boolean deleteById(int userId) {

		boolean success = false;
		Chicken u = em.find(Chicken.class, userId);

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
