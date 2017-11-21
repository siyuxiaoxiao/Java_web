<%--
  Created by IntelliJ IDEA.
  User: 萌新
  Date: 2017/11/3
  Time: 11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*" %>
<%!
    public static void Conn(){
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        String password="666666";
    String user="sa";
        try {
            Connection conn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=myLessons",user,password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        String sql="SELECT a.L_id,a.L_name,a.L_introduction, a.L_pigURL, b.t_name FROM t_lessons a, t_teachers b WHERE a.L_tearchID=b.t_id";
    };
%>
<html>
<head>
    <title>Title</title>
    <style>
        .center{
            margin: 0 auto;
            text-align: center;
        }
        body{
            margin: 0 auto;
            text-align: center;
        }
    </style>
</head>
<body>
    <h2 class="center">课程信息修改</h2>
<hr>
<form method="post" action="">
    <input type="text" value="<%session.getAttribute("L_id");%>">
    <input type="text" value="<%session.getAttribute("L_name");%>">
    <input type="text" value="<%session.getAttribute("L_introduction");%>">
    <input type="text" value="<%session.getAttribute("t_name");%>">
    <input type="text" value="<%session.getAttribute("L_pigURL");%>">
    <input type="text" value="123">
</form>
</body>
</html>
