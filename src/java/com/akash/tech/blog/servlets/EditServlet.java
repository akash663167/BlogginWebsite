
/*
* To change this license header, choose License Headers in Project Properties.
* To change this template file, choose Tools | Templates
* and open the template in the editor.
 */
package com.akash.tech.blog.servlets;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import java.sql.Connection;
import java.sql.SQLException;

import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.akash.tech.blog.dao.UserDao;
import com.akash.tech.blog.entities.User;
import com.akash.tech.blog.helper.ConnectionProvider;
import com.akash.tech.blog.helper.FileHelper;

/**
 *
 * @author Admin
 */
@MultipartConfig
public class EditServlet extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        Connection con = null;

        try (PrintWriter out = response.getWriter()) {

            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();

            System.out.println("Inside edit");

            User             olduser     = (User) session.getAttribute("CurrentUser");
            String           name        = request.getParameter("name");
            String           email       = request.getParameter("email");
            String           password    = request.getParameter("password");
            String           about       = request.getParameter("about");
            String           profilename = "";
            FileOutputStream fs;
            Part             part = request.getPart("user_profile");

//          try {  
//              System.out.println("Inside edit");
//
//              
//
//              InputStream is = part.getInputStream();
//              profilename = "" + part.getName();
//               System.out.println("path :"+request.getServletContext().getContextPath()+File.separator+"pic"+File.separator+ profilename);
//              File file = new File("d:"+File.separator+File.separator+ profilename);
//              if (!file.exists()) {
//                  file.createNewFile();
//              }
//
//              fs = new FileOutputStream(file);
//              byte arr[] = new byte[2048];
//              while (is.read(arr) != -1) {
//                  fs.write(arr);
//              }
//
//          } catch (FileNotFoundException ex) {
//              ex.printStackTrace();
//          }
            User        user = new User();
            InputStream is   = part.getInputStream();

            user.setId(olduser.getId());
            user.setAbout(about);
            user.setEmail(email);
            user.setPassword(password);
            user.setName(name);
            user.setProfile(olduser.getProfile());

            try {
                System.out.println("Inside connection");
                con = ConnectionProvider.getConnection();

                UserDao userdao = new UserDao(con);
                int     i       = userdao.updateUser(user);

                if (i == 0) {
                    System.out.println("no of records " + i);
                } else {
                    System.out.println("no of records updated " + i);

                    String path = "E:\\Project\\AkashBlog\\BloggingWebsite\\build\\web\\" + "pics" + File.separator
                                  + user.getProfile();

                    System.out.println("" + path);
                    FileHelper.deleteFile(path);

                    if (FileHelper.saveFile(path, is)) {
                        System.out.println("Updated");
                    }

                    request.getRequestDispatcher("profile.jsp").forward(request, response);
                }
            } catch (ClassNotFoundException ex) {
                ex.printStackTrace();
            } catch (SQLException ex) {
                ex.printStackTrace();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }    // </editor-fold>
}


//~ Formatted by Jindent --- http://www.jindent.com
