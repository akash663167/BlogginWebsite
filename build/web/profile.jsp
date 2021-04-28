<%-- 
    Document   : profile
    Created on : Jan 3, 2021, 6:32:41 PM
    Author     : Admin
--%>

<%@page import="com.akash.tech.blog.entities.Category"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.akash.tech.blog.helper.HibernateUtil"%>
<%@page import="java.util.List"%>
<%@page import="com.akash.tech.blog.dao.PostDao"%>
<%@page import="com.akash.tech.blog.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp" %>

<%
    User user = (User) session.getAttribute("CurrentUser");
    if (user == null) {

        response.sendRedirect("Login.jsp");
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
    </head>
    <body>
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
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#exampleModalCenter"><span class="fa fa-user-circle"></span> <%= user.getName()%></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Logout"><span class="fa fa-user-plus"></span> Logout</a>
                    </li>
                </ul>
            </div>
        </nav>



        <!-- Modal -->
        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header primar-background text-white text-center">
                        <h5 class="modal-title"  id="exampleModalLongTitle" style="text-align: center;padding: 0em 5.04em;">Profile Details:</h5>
                        <a type="button" class="  close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </a>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="pics/<%= user.getProfile()%>" alt="profile" class="img-fluid rounded-circle"  style="max-width:150px;">
                            <br>
                            <p class="font-weight-bold"><%= user.getName()%></p>  
                        </div>

                        <div id="profile-table">

                            <table class="table">

                                <tbody>
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>Name</td>
                                        <td><%= user.getName()%></td> 
                                    </tr>
                                    <tr>
                                        <th scope="row">2</th>
                                        <td>Gender</td>
                                        <td><%= user.getGender()%></td> 
                                    </tr>
                                    <tr>
                                        <th scope="row">3</th>
                                        <td>About</td>
                                        <td><%= user.getAbout()%></td> 
                                    </tr>
                                    <tr>
                                        <th scope="row">4</th>
                                        <td>Registeration Date</td>
                                        <td><%= user.getTimestamp().toLocaleString()%></td> 
                                    </tr>
                                    <tr>
                                        <th scope="row">5</th>
                                        <td>Email </td>
                                        <td><%= user.getEmail()%></td> 
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <div id="profile-edit" style="display: none;">
                            <h3 class="mt-3 text-center">Please Edit Carefully</h3>
                            <form action="EditServlet" method="post" enctype="multipart/form-data">
                                <table class="table">
                                    <tbody>
                                        <tr>
                                            <th scope="row">1</th>
                                            <td>Name</td>
                                            <td><input type="text" class="form-control" name="name" value="<%= user.getName()%>"></td> 
                                        </tr>
                                        <tr>
                                            <th scope="row">2</th>
                                            <td>Gender</td>
                                            <td><%= user.getGender().toUpperCase()%></td> 
                                        </tr>
                                        <tr>
                                            <th scope="row">3</th>
                                            <td>About</td>
                                            <td><textarea type="text" class="form-control" name="about" rows="5"><%= user.getAbout()%></textarea></td> 
                                        </tr>
                                        <tr>
                                            <th scope="row">4</th>
                                            <td>Password </td>
                                            <td><input type="type" class="form-control"  name="password" value="<%= user.getPassword()%>"></td> 
                                        </tr>
                                        <tr>
                                            <th scope="row">5</th>
                                            <td>Email </td>
                                            <td><input type="text" class="form-control"  name="email" value="<%= user.getEmail()%>"></td> 
                                        </tr>
                                        <tr>
                                            <th scope="row">6</th>
                                            <td>New profile: </td>
                                            <td><input type="file" class="form-control"  name="user_profile" ></td> 
                                        </tr>
                                    </tbody>
                                </table>
                                <div class="container text-center">
                                    <button type="submit" class="btn btn-outline-primary">Save</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" id="edit-profile-btn" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>

        <!--Category Modal-->
        <!-- Button trigger modal -->


        <!-- Modal -->
        <div class="modal fade" id="add-cateogory-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Please Provide the post Detail </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="add-post-form" action="AddPostFormServlet" method="POST">

                            <div class="form-group">
                                <!--<label for="">Select Category</label>-->
                                <select class="form-control" id="cid" name="cid">
                                    <option selected disabled>---Select Categeory ---</option>
                                    <%
                                        PostDao postdao = new PostDao();
                                        SessionFactory factory = HibernateUtil.getSessionFactory();
                                        Session sess = factory.openSession();
                                        List<Category> list = postdao.getAllCategories(sess);
                                        for (Category category : list) {%>
                                    <option value="<%= category.getCid()%>">
                                        <%= category.getCname()%>
                                    </option>
                                    <%};
                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                <!--<label for="exampleFormControlInput1">Enter Post Title</label>-->
                                <input type="text" class="form-control" id="ptitle"  name="ptitle" placeholder="Enter Post Title">
                            </div>
                            <div class="form-group">
                                <!--<label for="pcontent">Enter Post Content</label>-->
                                <textarea class="form-control" id="pcontent" rows="5" name="pcontent"  placeholder="Enter Post Content"></textarea>
                            </div>
                            <div class="form-group">
                                <!--<label for="pcontent">Enter Your Program (If any)</label>-->
                                <textarea class="form-control" id="pcode" rows="5" name="pcode"  placeholder="Enter Your Program (If any)"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="pcontent">Enter Post Picture</label>
                                <input type="file" class="form-control" id="ppic" name="ppic" >
                            </div> 
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">post</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>

        <main>
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="list-group">
                            <a href="#"  onclick="getPost(0,this)"  class="list-group-item list-group-item-action active">
                                All Post
                            </a>
                            <%
                                for (Category category : list) {%>
                                <a href="#" onclick="getPost(<%= category.getCid()%>,this)" class="list-group-item list-group-item-action"> <%= category.getCname()%></a>
                            <%};
                                sess.close();
                            %>

                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="container text-center" id="loader">
                            <i class="fas fa-sync fa-3x fa-spin"></i>
                            <h3 class="mt-2">Loading...</h3>>
                        </div>
                        <div class="container" >
                            <div class="row" id="post-container">
                            </div>
                        </div>

                    </div>
                </div>

            </div>

        </main>




        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="resource/ckeditor/ckeditor.js"></script>
        <script src="js/main.js"></script> 
        <script src="js/app.js"></script>
    </body>
</html>
