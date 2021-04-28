/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.akash.tech.blog.dao;

import com.akash.tech.blog.entities.Category;
import com.akash.tech.blog.entities.Post;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author Admin
 */
public class PostDao {

    List<Category> alCategory = null;

    public List<Category> getAllCategories(Session s) {

        alCategory = s.createQuery(" FROM Category ", Category.class).getResultList();
        return alCategory;
    }

    public int savePost(Session s, Post post) {

        Transaction tx = s.beginTransaction();

        Integer i = (Integer) s.save(post);

        tx.commit();

        return i;
    }

    public List<Post> getAllpPosts(Session s) {
        String hql = " FROM Post post LEFT JOIN FETCH  post.category cat";
        Query<Post> q = s.createQuery(hql, Post.class);
        List<Post> p = q.getResultList();
        p.forEach(System.out::println);
        return p;
    }

    public List<Post> getPostByCatid(Session s, int catid) {
        String hql = " FROM Post post LEFT JOIN FETCH  post.category cat where cat.cid = :catd";
        Query<Post> q = s.createQuery(hql, Post.class);
        q.setParameter("catd", catid);
        List<Post> p = q.list();
        return p;

    }

    public Post getPostByPostid(Session s, int postid) {
        String hql = " FROM Post post LEFT JOIN FETCH  post.category cat where post.pdi = :postid";
        Query<Post> q = s.createQuery(hql, Post.class);
        q.setParameter("postid", postid);
        Post p = q.uniqueResult();
        return p;

    }

}
