<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.PreparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: 萌新
  Date: 2017/11/8
  Time: 20:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

    String password="666666";
    String user="sa";

    Connection conn= DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=myLessons",user,password);
    Statement statement=conn.createStatement();
    response.setContentType("text/html;charset=utf-8");
    request.setCharacterEncoding("utf-8");
    String L_id=request.getParameter("id");
    String L_name=request.getParameter("L_name");
    String L_introduction=request.getParameter("L_introduction");
    String t_name=request.getParameter("t_name");
    String sql = "UPDATE t_lessons set L_name=?,L_introduction=? where L_id="+L_id;
    out.println(sql);
    PreparedStatement ps=conn.prepareStatement(sql);
    ps.setString(1,L_name);
    ps.setString(2,L_introduction);
    int res=ps.executeUpdate();
    if(res==0){
        out.println("更新出错");
    }else {
        out.println("更新成功");
    }

%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
