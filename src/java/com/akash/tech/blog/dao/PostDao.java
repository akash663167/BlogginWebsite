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

}
