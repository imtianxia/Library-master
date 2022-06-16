<%--
  Created by IntelliJ IDEA.
  User: GAO
  Date: 2022/6/4
  Time: 23:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/welcome.css"  type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<html>
<head>
    <title>登录成功</title>
</head>
<body>
<h1 align="center">欢迎进入图书馆管理系统</h1>
<%
    request.setCharacterEncoding("utf-8");
    if(session.getAttribute("adminname") == null){
        response.sendRedirect("/Library/index.jsp");
    }
%>
<jsp:include page="nav.html"/>
<div>

    俗话说“人生不如意事，十之八九；可与人言者一二”。这个道理告诉了人们什么呢？

    她告诉人们人生不易，许多事是不以人的意志而转移的。所以在遇到不顺心之时，要看那一二，并从中找到勇气和信心，看开困惑，消除烦恼，勇敢地直面人生，微笑迎接纷繁复杂的生活。

    不管别人如何看待这一说法，我现在已把它当做了我的人生信条，更是我解决一切不顺之事的万能宝贝。凡不开心的时候，只要用此道理自我解劝，总能烟消云散，迎刃而解。只是在自己不惑之年才认识并懂得她，每每想起，总觉得相见恨晚。

</div>
</body>
</html>
