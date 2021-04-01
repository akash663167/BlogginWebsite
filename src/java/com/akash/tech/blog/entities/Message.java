
/*
* To change this license header, choose License Headers in Project Properties.
* To change this template file, choose Tools | Templates
* and open the template in the editor.
 */
package com.akash.tech.blog.entities;

/**
 *
 * @author Admin
 */
public class Message implements java.io.Serializable {
    private String content;
    private String type;
    private String cssClass;

    public Message(String content, String type, String cssClass) {
        this.content  = content;
        this.type     = type;
        this.cssClass = cssClass;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCssClass() {
        return cssClass;
    }

    public void setCssClass(String cssClass) {
        this.cssClass = cssClass;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}


//~ Formatted by Jindent --- http://www.jindent.com
