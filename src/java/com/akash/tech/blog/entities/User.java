
/*
* To change this license header, choose License Headers in Project Properties.
* To change this template file, choose Tools | Templates
* and open the template in the editor.
 */
package com.akash.tech.blog.entities;

import java.sql.Timestamp;

/**
 *
 * @author Admin
 */
public class User implements java.io.Serializable {
    private int       id;
    private String    name;
    private String    email;
    private String    password;
    private String    about;
    private String    gender;
    private Timestamp timestamp;
    private String    profile;

    public User() {}

    public User(String name, String email, String password, String about, String gender) {
        this.name     = name;
        this.email    = email;
        this.password = password;
        this.about    = about;
        this.gender   = gender;
    }

    @Override
    public String toString() {
        return "User{" + "id=" + id + ", name=" + name + ", email=" + email + ", password=" + password + ", about="
               + about + ", gender=" + gender + ", timestamp=" + timestamp + '}';
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }
}


//~ Formatted by Jindent --- http://www.jindent.com
