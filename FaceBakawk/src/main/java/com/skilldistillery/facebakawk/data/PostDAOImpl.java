package com.skilldistillery.facebakawk.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.facebakawk.entities.Post;
import com.skilldistillery.facebakawk.entities.PostComment;

@Service
@Transactional
public class PostDAOImpl implements PostDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Post> findAll() {
		String jpql = "SELECT post FROM Post post WHERE enabled IS true";
		return em.createQuery(jpql, Post.class).getResultList();
	}



	@Override
	public List<Post> searchByKeyword(String searchTerm) {
		String jpql = "SELECT post FROM Post post WHERE post.name " + "LIKE :searchTerm OR post.description "
				+ "LIKE :searchTerm ";

		System.out.println("\n\n\nJPQL IN DAO " + jpql);
		TypedQuery<Post> query = em.createQuery(jpql, Post.class);
		query.setParameter("searchTerm", "%" + searchTerm + "%");
		return query.getResultList();
	}

	@Override
	public Post findPostById(int postId) {
		Post e = em.find(Post.class, postId);
		return e;
	}

	@Override
	public Post create(Post post) {
		post.setEnabled(true);
		em.persist(post);
		em.flush();
		return post;

	}

	@Override
	public Post updatePost(int postId, Post post) {
		Post e = em.find(Post.class, postId);
		e.setTitle(post.getTitle());
		e.setContent(post.getContent());
		em.merge(e);
		em.flush();
		return e;
	}

	@Override
	public boolean deleteById(int postId) {

		boolean success = false;
		Post e = em.find(Post.class, postId);

		if (e == null) {
			return false;
		}

		else {
			e.setEnabled(false);
			success = true;
		}

		

		return success;
	}
}
