/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.akash.tech.blog.entities;

import java.sql.Timestamp;
import java.time.LocalDateTime;

/**
 *
 * @author Admin
 */
public class Post implements java.io.Serializable{
//    					
    private int pdi;
    private String ptitle;
    private String pcontent;
    private String ppic;
    private String pcode;
    private Timestamp pdate;
    private Category category;
    private User user;

    public Post( String ptitle, String pcontent, String ppic, String pcode,Category category,User user) {
      
        this.ptitle = ptitle;
        this.pcontent = pcontent;
        this.ppic = ppic;
        this.pcode = pcode;
        this.category = category;
        this.user = user;
//        this.pdate = Timestamp.valueOf(LocalDateTime.MIN);
    }

    public Post() {
    }

    public int getPdi() {
        return pdi;
    }

    public void setPdi(int pdi) {
        this.pdi = pdi;
    }

    public String getPtitle() {
        return ptitle;
    }

    public void setPtitle(String ptitle) {
        this.ptitle = ptitle;
    }

    public String getPcontent() {
        return pcontent;
    }

    public void setPcontent(String pcontent) {
        this.pcontent = pcontent;
    }

    public String getPpic() {
        return ppic;
    }

    public void setPpic(String ppic) {
        this.ppic = ppic;
    }

    public String getPcode() {
        return pcode;
    }

    public void setPcode(String pcode) {
        this.pcode = pcode;
    }

    public Timestamp getPdate() {
        return pdate;
    }

    public void setPdate(Timestamp pdate) {
        this.pdate = pdate;
    }

  

    @Override
    public String toString() {
        return "Post{" + "pdi=" + pdi + ", ptitle=" + ptitle + ", pcontent=" + pcontent + ", ppic=" + ppic + ", pcode=" + pcode + ", pdate=" + pdate + ", cid=" + category.getCid() + '}';
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
    
    
    
    
}
