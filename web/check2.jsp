<%--
  Created by IntelliJ IDEA.
  User: GAO
  Date: 2022/6/9
  Time: 23:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.sql.*" contentType="text/html;charset=utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>检验注册页面</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->

</head>

<body>
<br>
<%
    request.setCharacterEncoding("utf-8");
    String users=request.getParameter("user");
    String pass=request.getParameter("pwd");
%>
<%
    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://127.0.0.1:3307/login";
    String use = "root";
    String password = "529527";
    Class.forName(driver);
    Connection conn= DriverManager.getConnection(url,use,password);
    PreparedStatement sql =conn.prepareStatement("insert into user(username,password)values(?,?)");
    sql.setString(1,users);
    sql.setString(2,pass);
    int rtn=sql.executeUpdate();
    sql.close();
    conn.close();
%>

</body>
</html>