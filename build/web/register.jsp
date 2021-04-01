<%-- 
    Document   : register
    Created on : Jan 2, 2021, 11:20:01 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registeration</title>
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
        <main class="d-flex align-items-center primar-background pt-5" style="height:90vh;overflow: auto;">
            <div class="container  pt-5" > 
                <div class="row pt-2 ">
                    <div class="col-md-6  offset-md-3">
                        <div class="card">
                            <div class="card-header primar-background text-white text-center">
                                <span class="fa fa-user-plus fa-3x"></span>
                                <p>   Registeration </p>
                            </div>
                            <div class="card-body">
                                <form id="registeration-form">
                                    <div class="form-group">
                                        <label for="user_name">User Name</label>
                                        <input type="text" class="form-control" name="user_name" id="user_name" aria-describedby="userName" placeholder="Enter User Name">
                                    </div>
                                    <div class="form-group">
                                        <label for="user_email">Email address</label>
                                        <input type="email" class="form-control"  name="user_email" id="user_email" aria-describedby="emailHelp" placeholder="Enter email">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="user_password">Password</label>
                                        <input type="password" class="form-control" name="user_password" id="user_password" placeholder="Password">
                                    </div>

                                    <label for="inlineRadioOptions">Gender</label>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="user_gender" id="inlineRadio1" value="male">
                                        <label class="form-check-label" for="inlineRadio1">Male</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="user_gender" id="inlineRadio2" value="female">
                                        <label class="form-check-label" for="inlineRadio2">Female</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="user_gender" id="inlineRadio3" value="other" >
                                        <label class="form-check-label" for="inlineRadio3">Others</label>
                                    </div>
                                    <div class="form-group">
                                        <!--<label for="exampleFormControlTextarea1">Exa</label>-->
                                        <textarea class="form-control" name="user_about" id="exampleFormControlTextarea1" rows="3"  placeholder="Enter about yourself..."></textarea>
                                    </div>
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="user_check" name="user_check">
                                        <label class="form-check-label" for="exampleCheck1">I agree terms and Conditon</label>
                                    </div>
                                    <br>
                                    <div class="container text-center "  id="loader" style="display:none;">
                                        <span class="fas fa-sync fa-spin fa-3x"></span>
                                        <p>Please Wait...</p>
                                    </div>   
                                    <div class="container text-center " >
                                        <button type="submit" class="btn btn-primary " id="submit">Submit</button>
                                    </div>
                                    <div class="container mt-4 text-center text-white   rounded"  id="msg-container" style="display:none;">
                                        <p class="msg"></p>
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

            $('#registeration-form').submit(function (e) {
                e.preventDefault();
                let   form = new FormData(this);
                console.log('formdata ' + form);
                $('#loader').show();
                $('#submit').hide();
                $.ajax({
                    method: 'POST',
                    data: form,
                    url: 'Registeration',
                    processData: false,
                    contentType: false,
                    success: function (data, textStatus, jqXHR) {
                        console.log("respoonse" + data)
                        if (data.trim() == "done") {
                            $('#msg-container').show();
                            $('#msg-container').html('Registeration Done Succesfully ☺!!');
                            $('#msg-container').addClass('bg-success')
                            $('#loader').hide();
                            $('#submit').show();
                        } else {
                            $('#msg-container').show();
                            $('#msg-container').html('Registeration Failed ☺!!');
                            $('#msg-container').addClass('bg-danger');
                            $('#loader').hide();
                            $('#submit').show();
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        $('#msg-container').show();
                        $('#msg-container').html('Registeration Failed ☺!!');
                        $('#msg-container').addClass('bg-danger');
                        $('#loader').hide();
                        $('#submit').show();
                    }
                });
                console.log("form submit");
            });

        </script>
    </body>
</html>
