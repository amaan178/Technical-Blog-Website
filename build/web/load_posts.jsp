<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.dao.UserDao"%>
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
                    <% UserDao ud = new UserDao(ConnectionProvider.getConnection());%>
                    <h6 class="card-subtitle mb-2 text-muted"><%= ud.getUserByUserId(p.getUserId()).getName()%></h6>
                    <p class = "card-text fifty-chars"><%= p.getpContent() %></p>
                </div>
                <div class="card-footer text-center">
                    <% 
                        LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                    %>
                    <a href="#!" onclick="doLike(<%= p.getPid()%>,<%= uuu.getId()%>)" class="btn btn-outline-primary btn-sm"> <i class="fa fa-thumbs-o-up"></i> <span class="like-counter"><%= ld.countLikeOnPost(p.getPid())%></span>  </a>
                    <a href="show_blog_page.jsp?post_id=<%= p.getPid()%>" class="btn btn-primary btn-sm">Read More...</a>
                    <a href="#!" class="btn btn-outline-primary btn-sm"> <i class="fa fa-commenting-o"></i> <span class="disqus-comment-count" data-disqus-identifier="<%= p.getPid() %>"> </span></a>
                </div>
            </div>
        </div>
<%
    }

%>
</div>
<script id="dsq-count-scr" src="//techblog-ksyqxcerja.disqus.com/count.js" async></script>