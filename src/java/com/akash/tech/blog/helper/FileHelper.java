/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.akash.tech.blog.helper;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import javax.servlet.http.Part;

/**
 *
 * @author Admin
 */
public class FileHelper {

    public static boolean deleteFile(String filePath) {
        boolean f = false;
        File file = null;
        try {
            file = new File(filePath);
            f = file.delete();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public static boolean saveFile(String fileName, InputStream is) {

        boolean created = false;
        File file = null;
        FileOutputStream fs = null;
        try {
            file = new File(fileName);
            if (!file.exists()) {
                file.createNewFile();
            }

            byte b[] = new byte[is.available()];
            is.read(b);
            fs = new FileOutputStream(file, false);
            fs.write(b);
            fs.flush();

            fs = null;
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return created;
    }

    public static String getFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}
