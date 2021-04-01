
/*
* To change this license header, choose License Headers in Project Properties.
* To change this template file, choose Tools | Templates
* and open the template in the editor.
 */
package com.akash.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import com.akash.tech.blog.dao.UserDao;
import com.akash.tech.blog.entities.Message;
import com.akash.tech.blog.entities.User;
import com.akash.tech.blog.helper.ConnectionProvider;
import com.akash.tech.blog.helper.HibernateUtil;

/**
 *
 * @author Admin
 */
@MultipartConfig
public class LoginServlet extends HttpServlet {

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

        Connection  con     = null;
        HttpSession session = null;

        try (PrintWriter out = response.getWriter()) {
            String email    = request.getParameter("user_email");
            String password = request.getParameter("user_password");

            try {
                Session hibersession = HibernateUtil.getSession();

                System.out.println("hibernate session " + hibersession);
                con = ConnectionProvider.getConnection();

                UserDao userdao = new UserDao(con);
                User    user    = userdao.getUserDetails(email, password);

                if (user == null) {

//                  Message ms = new Message("Invalid Details","error","alert alert-danger");
//                  session = request.getSession(true);
//                  session.setAttribute("msg", ms);
//                  response.sendRedirect("Login.jsp");
                    out.println("notdone");
                } else {
                    session = request.getSession(true);
                    session.setAttribute("CurrentUser", user);
                    response.sendRedirect("profile.jsp");
                }
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
