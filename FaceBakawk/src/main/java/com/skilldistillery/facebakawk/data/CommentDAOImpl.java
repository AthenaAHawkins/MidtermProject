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
public class CommentDAOImpl implements CommentDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public PostComment findCommentById(int commentId) {
		PostComment c = em.find(PostComment.class, commentId);
		return c;
	}
	@Override
	public PostComment addCommentToPost(String userComment, Post post) {
		post.setContent(userComment);
        em.persist(post);
		return null;
	}
	public List<PostComment> findAllCommentsForPost(int postId){
		
		String jpql = "SELECT comment FROM PostComment comment where id = :postId";
		TypedQuery<PostComment> query = em.createQuery(jpql, PostComment.class);
		query.setParameter("postId", postId);
		return query.getResultList();
	}

}
