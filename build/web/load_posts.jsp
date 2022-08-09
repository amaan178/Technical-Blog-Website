<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<div class="row">
<%
    User uuu=(User)session.getAttribute("currentUser");  
    Thread.sleep(1000);
    PostDao d = new PostDao(ConnectionProvider.getConnection());
    int cid = Integer.parseInt(request.getParameter("cid"));
    List<Post> posts = null;
    if (cid == 0) {
        posts = d.getAllPosts();
    } else {
        posts = d.getPostByCatId(cid);
    }
    for (Post p : posts) {
%>
        <div class="col-md-6 mt-2 mb-3">
            <div class="card">
                <img class="card-img-top" src="images/<%= p.getpPic()%>" alt="Card image cap">
                <div class="card-body">
                    <h4 class = "card-title"><%= p.getpTitle() %></h4>
                    <h6 class="card-subtitle mb-2 text-muted"><%= p.getpDate() %></h6>
                    <p class = "card-text"><%= p.getpContent() %></p>
                </div>
                <div class="card-footer primary-background text-center">
                    <a href="show_blog_page.jsp?post_id=<%= p.getPid()%>" class="btn btn-outline-light btn-sm">Read More...</a>
                    <a href="#!" class="btn btn-outline-light btn-sm"> <i class="fa fa-commenting-o"></i> <span>20</span>  </a>
                </div>
            </div>
        </div>
<%
    }

%>

</div>