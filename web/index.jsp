<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <!--bootstrap css cdn-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <!--custom css-->
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <!-- navbar -->
        <%@include file="navbar.jsp" %>
        <!--banner-->
        <div class="container-fluid p-0 m-0">
            <div class="jumbotron primary-background text-white banner-background">
                <div class="container">
                    <h3 class="display-3">Welcome to TechBlog </h3>
                    <p>Welcome to technical blog, world of technology
                        A programming language is a formal language, which comprises a set of instructions that produce various kinds of output. Programming languages are used in computer programming to implement algorithms.
                    </p>
                    <p>
                        Most programming languages consist of instructions for computers. There are programmable machines that use a set of specific instructions, rather than general programming languages. 
                    </p>
                    <button class="btn btn-outline-light btn-lg" dir="register_page.jsp"> <span class="fa fa-user-plus"></span> Start! its Free</button>
                    <a href="login_page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle fa-spin"></span>  Login</a>
                </div>
            </div>        
        </div>
        <!--cards-->
        <div class="container">
            <div class="row mb-2">
                <%
                    User uuu=(User)session.getAttribute("currentUser");  
                    Thread.sleep(1000);
                    PostDao d = new PostDao(ConnectionProvider.getConnection());
                    List<Post> posts = d.getAllPosts();
                    for (Post p : posts) {
                %>
                        <div class="col-md-4 mt-2 mb-3">
                            <div class="card">
                                <img class="card-img-top" src="images/<%= p.getpPic()%>" alt="Card image cap">
                                <div class="card-body">
                                    <h4 class = "card-title"><%= p.getpTitle() %></h4>
                                    <% UserDao ud = new UserDao(ConnectionProvider.getConnection());%>
                                    <h6 class="card-subtitle mb-2 text-muted"><%= ud.getUserByUserId(p.getUserId()).getName()%></h6>
                                    <p class = "card-text fifty-chars"><%= p.getpContent() %></p>
                                </div>
                                <div class="card-footer text-center">
                                   <% 
                                        LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                                    %>
                                    <a href="#!" class="btn btn-outline-primary btn-sm"> <i class="fa fa-thumbs-o-up"></i> <span class="like-counter"><%= ld.countLikeOnPost(p.getPid())%></span>  </a>
                                    <a href="show_blog_page.jsp?post_id=<%= p.getPid()%>" class="btn btn-primary btn-sm">Read More...</a>
                                    <a href="#!" class="btn btn-outline-primary btn-sm"> <i class="fa fa-commenting-o"></i> <span>20</span>  </a>
                                </div>
                            </div>
                        </div>
                <%
                    }

                %>
            </div>
        </div>        
        <!--javascript cdn-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="javascript/script.js" type="text/javascript"></script>
    </body>
</html>
