<%--
  Created by IntelliJ IDEA.
  User: GAO
  Date: 2022/6/9
  Time: 21:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="Dao.BookDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Entity.Book" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/borrow.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/InfoScript.js"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="https://cdn.bootcss.com/popper.js/1.12.5/umd/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<%
    request.setCharacterEncoding("utf-8");
    if(session.getAttribute("adminname") == null){
        response.sendRedirect("/Library/index.jsp");
    }
    ArrayList<Book> booklist = (ArrayList<Book>)session.getAttribute("allbooklist");
%>
<html>
<head>
    <style type="text/css">

        .btn{
            display: inline-block;
            margin-top: 10px;
            padding: 10px 24px;
            border-radius: 4px;
            background-color: #63b7ff;
            color: #fff;
            cursor: pointer;
        }</style>
    <title>查询图书</title>

</head>
<body>
<h1 align="center">欢迎进入图书馆管理系统</h1>
<jsp:include page="nav.html"/>
<li>输入查询图书编号</li>
<table class="table">
    <thead>
    <form name="thisform"method="post">
        <input id="numid" type="text" name="name">
        <input type="button" value="查询"onclick="sel()">
    </form>

    <script language="javascript">
        function sel(){
            var bookid = document.getElementById("numidid").value;
            createXMLHttpRequest();   //调用创建XMLHttpRequest对象的方法
            xmlHttp.onreadystatechange=bookcheckResult;   //设置回调函数
            var url="BookAction?action=querybookbyid&next=borrowcheck&id=" + numid;
            xmlHttp.open("POST",url,true);      //向服务器端发送请求
            xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=utf8");
            xmlHttp.send(null);

        }
    </script>

    <tr>
        <th>书本编号</th>
        <th>书名</th>
        <th>作者</th>
        <th>出版社</th>
        <th>价格</th>
        <th>类目</th>
        <th>库存总量</th>
        <th>借出数量</th>
        <th>剩余数量</th>
        <th>所在位置(柜号)</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody>
<%--   <%
       String name=request.getParameter("name");
       int num;
       if(name == null || "".equals(name)){
        num= Integer.parseInt(name);
       Book s = booklist.get(num);
       %>
   <tr>
       <td><%=s.getId()%></td>
       <td><a href="BookAction?action=querybookbyid&id=<%=s.getId()%>&next=check"><%=s.getName()%></a> </td>
       <td><%=s.getAuthor()%></td>
       <td><%=s.getPublisher()%></td>
       <td><%=s.getPrice()%></td>
       <td><%=s.getCategory()%></td>
       <td><%=s.getStore()%></td>
       <td><%=s.getLend()%></td>
       <td><%=s.getRemain()%></td>
       <td><%=s.getLocation()%></td>
       <td><a  class="btn" href="BookAction?action=querybookbyid&id=<%=s.getId()%>&next=edit">编辑或删除</a></td>
   </tr>
   <%
       }
   %>--%>
   <%
       if(booklist!=null && booklist.size() > 0)
           for(int i = 0; i < booklist.size(); i++)
           {
               Book b = booklist.get(i);
   %>
   <tr>
       <td><%=b.getId()%></td>
       <td><a href="BookAction?action=querybookbyid&id=<%=b.getId()%>&next=check"><%=b.getName()%></a> </td>
       <td><%=b.getAuthor()%></td>
       <td><%=b.getPublisher()%></td>
       <td><%=b.getPrice()%></td>
       <td><%=b.getCategory()%></td>
       <td><%=b.getStore()%></td>
       <td><%=b.getLend()%></td>
       <td><%=b.getRemain()%></td>
       <td><%=b.getLocation()%></td>
       <td><a  class="btn" href="BookAction?action=querybookbyid&id=<%=b.getId()%>&next=edit">编辑或删除</a></td>
   </tr>
   <%

       }
   %>
   </tbody>
</table>
</div>
<form action="IOAction?action=borrow" onsubmit="return errorsubmit()" method="post">
    <div>
        <span class="infotitle">书本编号：</span><input type="text" name="bookid" onkeyup="bookcheck()" id="bookid"><span id="bookidcheck" class="error"></span>
    </div>
    <div>
        <span class="infotitle">书本名称：</span><input type="text" name="bookname" id="bookname"disabled>
    </div>
    <div>
        <span class="infotitle">书本作者：</span><input type="text" name="bookauthor" id="bookauthor" disabled>
    </div>
    <div>
        <span class="infotitle">出版单位：</span><input type="text" name="bookpublisher" id="bookpublisher" disabled>
    </div>
    <div>
        <span class="infotitle">书本剩余：</span><input type="text" name="bookremain" id="bookremain" disabled><span id="booknumcheck" class="error"></span>
    </div>
    <div>

        </select>
    </div
</body>
</html>
