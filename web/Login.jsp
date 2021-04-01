<%-- 
    Document   : Login
    Created on : Jan 2, 2021, 10:45:08 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <link rel="stylesheet" href="css/style.css"/>
        <style>
            .banner-background{
                clip-path: polygon(50% 0%, 100% 0, 100% 92%, 61% 100%, 26% 93%, 0 100%, 0 1%);
            }
        </style>
    </head>
    <body>
        <%@include file="navbar.html" %>
        <main class="d-flex align-items-center primar-background banner-background" style="height:80vh;">
            <div class="container ">
                <div class="row ">
                    <div class="col-md-4  offset-md-4">
                        <div class="card">
                            <div class="card-header primar-background text-white text-center">
                                <span class="fa fa-user-plus fa-3x"></span>
                                <p>   Login Here</p>
                            </div>
                            <div class="card-body">
                                <form id="login-form">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input type="email" required class="form-control" name="user_email" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input type="password" required="" name="user_password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                    </div>
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">Remember my login</label>
                                    </div>
                                    <div class="container text-center "  id="loader" style="display:none;">
                                        <span class="fas fa-sync fa-spin fa-3x"></span>
                                        <p>Please Wait...</p>
                                    </div>   
                                    <div class="container text-center mt-4 " >
                                        <button type="submit" class="btn btn-primary " id="submit">Submit</button>
                                    </div>
                                    <div class="container mt-4 text-center text-white   rounded"  id="msg-container" style="display:none;">
                                        <p class="msg" id="msg"></p>
                                    </div>

                                </form>
                            </div>
                            <div class="card-body"></div>
                        </div>
                    </div>
                </div>
            </div>
        </main>



        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/main.js"></script> 

        <script>

            $('#login-form').submit(function (e) {
                e.preventDefault();
                let   form = new FormData(this);
                console.log('formdata ' + form);
                $('#loader').show();
                $('#submit').hide();
                $.ajax({
                    method: 'POST',
                    data: form,
                    url: 'Login',
                    processData: false,
                    contentType: false,
                    success: function (data, textStatus, jqXHR) {
                        console.log("respoonse" + data)
                        if (data.trim() == 'notdone') {
                            $('#msg-container').show();
                            $('#msg').html('Login Failed... Please try again!!');
                            $('#msg').addClass('alert alert-danger');
                            $('#loader').hide();
                            $('#submit').show();
                        } else {
                            window.location.href = "profile.jsp";
                        }

                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        $('#msg-container').show();
                        $('#msg-container').html('Login Failed ☺!!');
                        $('#msg-container').addClass('bg-danger');
                        $('#loader').hide();
                        $('#submit').show();
                    }
                });
            });
        </script>
    </body>
</html>
