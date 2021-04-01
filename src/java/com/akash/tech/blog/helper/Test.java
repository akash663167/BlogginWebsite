
/*
* To change this license header, choose License Headers in Project Properties.
* To change this template file, choose Tools | Templates
* and open the template in the editor.
 */
package com.akash.tech.blog.helper;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

/**
 *
 * @author Admin
 */
public class Test {
    public static void main(String[] args) throws IOException {
        String          path = "E:\\Project\\AkashBlog\\BloggingWebsite\\build\\web\\pics\\akash.png";
        File            f    = new File(path);
        FileInputStream fis  = new FileInputStream("C:\\Users\\Admin\\Downloads\\akash.jpg");
        boolean         b    = FileHelper.saveFile(path, fis);

        System.out.println("" + b);
    }
}


//~ Formatted by Jindent --- http://www.jindent.com
