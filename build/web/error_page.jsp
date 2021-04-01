
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry ! Something went wrong... </title>
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
       
        <div class="container text-center">
            <img src="img/browser.png" alt="error" class="img-fluid">
            <h3 class="display-3">Sorry ! Something went wrong...</h3>
           
            <p> <%= exception %></p>  
            <a href="index.jsp" class="mt-4 primar-background btn btn-lg text-white">Home</a>
        </div>
    </body>
</html>
