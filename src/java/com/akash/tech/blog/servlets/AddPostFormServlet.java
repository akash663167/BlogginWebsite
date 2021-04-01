/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.akash.tech.blog.servlets;

import com.akash.tech.blog.dao.PostDao;
import com.akash.tech.blog.entities.Category;
import com.akash.tech.blog.entities.Post;
import com.akash.tech.blog.entities.User;
import com.akash.tech.blog.helper.FileHelper;
import com.akash.tech.blog.helper.HibernateUtil;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AddPostFormServlet", urlPatterns = {"/AddPostFormServlet"})
@MultipartConfig
public class AddPostFormServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            String cid = request.getParameter("cid");
            String ptitle = request.getParameter("ptitle");
            String pcontent = request.getParameter("pcontent");
            String pcode = request.getParameter("pcode");
            String ppic = request.getParameter("ppic");
            FileOutputStream fs;
            Part part = request.getPart("ppic");
            InputStream is = part.getInputStream();
            ppic = FileHelper.getFileName(part);

            Category cat = new Category();
            cat.setCid(Integer.parseInt(cid));
            HttpSession session = request.getSession(false);
            User user = (User) session.getAttribute("CurrentUser");
            Post post = new Post(ptitle, pcontent, ppic, pcode, cat,user);
            System.out.println("post" + post);
            PostDao dao = new PostDao();
            SessionFactory factory = HibernateUtil.getSessionFactory();

            Session sess = factory.openSession();
            int i = 0;
            i = dao.savePost(sess, post);
            System.out.println("i " + i);
            if (i == 0) {
                System.out.println("no of records " + i);
                out.println("error");
            } else {
                System.out.println("no of records updated " + i);
                if(ppic != null && !ppic.equals("")){
                String path = "E:\\Project\\AkashBlog\\BloggingWebsite\\build\\web\\" + "pics" + File.separator
                        + ppic;

                System.out.println("" + path);
                FileHelper.deleteFile(path);

                if (FileHelper.saveFile(path, is)) {
                    System.out.println("Updated");
                }
                }
                out.println("submitted");
                //request.getRequestDispatcher("profile.jsp").forward(request, response);
            }

            sess.close();
            
        }
    }

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
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
