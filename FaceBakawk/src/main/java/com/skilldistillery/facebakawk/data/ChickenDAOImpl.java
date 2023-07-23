package com.skilldistillery.facebakawk.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import com.skilldistillery.facebakawk.entities.Chicken;

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

		String jpql = "SELECT chicken FROM Chicken chicken WHERE chicken.name "
				+ "LIKE :searchTerm OR chicken.breed " + "LIKE :searchTerm OR chicken.description "
				+ "LIKE :searchTerm OR chicken.gender " + "LIKE :searchTerm";

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
	public Chicken updateChicken(int chickenId, Chicken chicken) {
		Chicken u = em.find(Chicken.class, chickenId);
		u.setCreateDate(chicken.getCreateDate());
		u.setDescription(chicken.getDescription());
		u.setId(chicken.getId());
		em.merge(u);
		em.flush();
		return u;
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
