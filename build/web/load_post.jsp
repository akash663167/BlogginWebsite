<%@page import="com.akash.tech.blog.entities.Category"%>
<%@page import="com.akash.tech.blog.entities.Post"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.akash.tech.blog.helper.HibernateUtil"%>
<%@page import="java.util.List"%>
<%@page import="com.akash.tech.blog.dao.PostDao"%>
<%@page import="com.akash.tech.blog.entities.User"%>

<%
    PostDao postdao = new PostDao();
    SessionFactory factory = HibernateUtil.getSessionFactory();
    Session sess = factory.openSession();
    int cid = Integer.parseInt(request.getParameter("cid"));
    List<Post> list = null;
    if (cid == 0) {
        list = postdao.getAllpPosts(sess);
    } else {
        list = postdao.getPostByCatid(sess, cid);
    }

    if (list.size() == 0) {
        out.println("<h3 class='display-3 text-center'>No Post Present For this category</h3>");
        return;
    }

    for (Post post : list) {%>


<div class="col-md-6 mt-2">
    <div class="card" style="width: 18rem;">
        <img class="card-img-top" src="pics/<%= post.getPpic()%>"" alt="<%= post.getPpic()%>" >
        <div class="card-body">
            <h5 class="card-title"><%= post.getPtitle()%></h5>
            <p class="card-text"><%= post.getPcontent()%></p>
            <pre ><%= post.getPcode()%></pre>

        </div>
        <div class="card-footer primar-background text-center">
            <a href="" class="btn btn-outline-primary btn-sm bg-light"><i class="fas fa-thumbs-up"></i><span>10</span></a>
            <a href="show_blog_page.jsp?post_id=<%= post.getPdi()%>" class="btn btn-outline-primary btn-sm bg-light">Read More...</a>

            <a href="" class="btn btn-outline-primary btn-sm bg-light"><i class="far fa-comments"></i><span>10</span></a>
        </div>
    </div>
</div>

<%   }
    sess.close();
%>