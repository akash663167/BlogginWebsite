
/*
* To change this license header, choose License Headers in Project Properties.
* To change this template file, choose Tools | Templates
* and open the template in the editor.
 */
package com.akash.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.akash.tech.blog.entities.User;
import com.akash.tech.blog.helper.ConnectionProvider;

/**
 *
 * @author Admin
 */
public class UserDao {
    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    public int SaveUser(User user) {
        PreparedStatement ps = null;

        try {
            String query = "insert into user(name,email,password,gender,about) values (?,?,?,?,?)";

            ps = con.prepareStatement(query);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getGender());
            ps.setString(5, user.getAbout());

            int i = ps.executeUpdate();

            return i;
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            ConnectionProvider.closeConnection(con, ps, null);
        }

        return 0;
    }

    public int updateUser(User user) {
        String            query = "update user set name=?,email=?,password=?,about=? ,profile =? where id=?";
        PreparedStatement ps    = null;

        System.out.println("Inside update");

        try {
            ps = con.prepareStatement(query);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getAbout());
            ps.setString(5, user.getProfile());
            ps.setInt(6, user.getId());

            int i = ps.executeUpdate();

            return i;
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {

//          ConnectionProvider.closeConnection(null, ps, null);
        }

        return 0;
    }

    public User getUserDetails(String mail, String password) throws SQLException {
        User              user  = null;
        String            query = "select  *  from user where email=? and password=? ";
        PreparedStatement ps    = con.prepareStatement(query);

        System.out.println("password " + password);
        ps.setString(1, mail);
        ps.setString(2, password);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            user = new User();
            user.setName(rs.getString("name"));
            user.setEmail(rs.getString("email"));
            user.setPassword(rs.getString("password"));
            user.setAbout(rs.getString("about"));
            user.setGender(rs.getString("gender"));
            user.setId(rs.getInt("id"));
            user.setTimestamp(rs.getTimestamp("rdate"));
            user.setProfile(rs.getString("profile"));
            System.out.println("profile " + rs.getString("profile"));
        }

        // ConnectionProvider.closeConnection(con, ps, rs);
        return user;
    }
}


//~ Formatted by Jindent --- http://www.jindent.com
