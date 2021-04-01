/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.akash.tech.blog.helper;

import com.akash.tech.blog.entities.Category;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Admin
 */
public class Main {
    public static void main(String[] args) {
        
        SessionFactory  factory= HibernateUtil.getSessionFactory();
        
        Session sess =  factory.openSession();
        
        
        System.out.println("session "+ sess);
        getAllCategories(sess);
        alCategory.forEach((category)->{System.out.println(category);});
    }
    
       
    static List<Category>  alCategory = null;
    
    
    public  static List<Category> getAllCategories(Session s){
    
    alCategory = s.createQuery(" FROM Category ", Category.class).getResultList();   
     return alCategory;
    }
}
