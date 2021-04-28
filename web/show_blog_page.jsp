<%-- 
    Document   : show_blog_page
    Created on : Apr 29, 2021, 1:59:20 AM
    Author     : Admin
--%>
<%@page import="com.akash.tech.blog.entities.User"%>
<%@page import="com.akash.tech.blog.entities.Category"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.akash.tech.blog.helper.HibernateUtil"%>
<%@page import="java.util.List"%>
<%@page import="com.akash.tech.blog.dao.PostDao"%>
<%@page import="com.akash.tech.blog.entities.Post"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp" %>
<%
    int postid = Integer.parseInt(request.getParameter("post_id"));
    PostDao postdao = new PostDao();
    SessionFactory factory = HibernateUtil.getSessionFactory();
    Session sess = factory.openSession();
    Post post = postdao.getPostByPostid(sess, postid);

    User user = (User) session.getAttribute("CurrentUser");
    if (user == null) {

        response.sendRedirect("Login.jsp");
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= post.getPtitle()%> || Techblog by Akash</title>
    </head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link rel="stylesheet" href="css/style.css"/>
    <style>
        .banner-background{
            clip-path: polygon(50% 0%, 100% 0, 100% 92%, 61% 100%, 26% 93%, 0 100%, 0 1%);
        }
        ul{
            list-style-type: none;

        }
    </style>
    <body class=" ">
        <nav class="navbar navbar-expand-lg navbar-dark bg-light primar-background">
            <a class="navbar-brand" href="index.jsp"><span class="fas fa-atom"></span>  Akash Tech Blog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.jsp"><span class="fas fa-book-open"></span>  Learn Code With Akash <span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-list-ul"></span>  Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Programming language</a>
                            <a class="dropdown-item" href="#">Project Implementation</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Data Structure</a>
                        </div>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#"><span class="fa fa-phone-square"></span> Contact</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-cateogory-modal"><span class="fa fa-aestrick"></span> Post Category</a>
                    </li>


                </ul>
                <ul class="navbar-nav mr-right text-white">
                    <li class="nav-item">
                        <a class="nav-link" href="profile.jsp" data-toggle="modal" data-target="#exampleModalCenter"><span class="fa fa-user-circle"></span> <%= user.getName()%></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Logout"><span class="fa fa-user-plus"></span> Logout</a>
                    </li>
                </ul>
            </div>
        </nav>

        <main>
            <div class="container">
                <div class="row text-center my-4" id="post-container">
                    <div class="col-md-8  offset-md-2">
                        <div class="card" >
                            <img class="card-img-top" src="pics/<%= post.getPpic()%>"" alt="<%= post.getPpic()%>" >
                            <div class="card-body">
                                <h5 class="card-title"><%= post.getPtitle()%></h5>
                                <p class="card-text"><%= post.getPcontent()%></p>
                                <pre ><%= post.getPcode()%></pre>

                            </div>
                            <div class="card-footer primar-background text-center">
                                <a href="" class="btn btn-outline-primary btn-sm bg-light"><i class="fas fa-thumbs-up"></i><span>10</span></a>
                                
                                <a href="" class="btn btn-outline-primary btn-sm bg-light"><i class="far fa-comments"></i><span>10</span></a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </main>

    </body>
</html>
