<%--
  Created by IntelliJ IDEA.
  User: 萌新
  Date: 2017/11/3
  Time: 11:32
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.sql.*" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>Title</title>
    <style>
        .center {
            margin: 0 auto;
            text-align: center;
        }

        body {
            margin: 0 auto;
            text-align: center;
        }

        .s_intro_text {
            columns: 50;
            word-wrap: break-word;
            height: 80px;
            word-break: break-all;

        }
    </style>
</head>
<body>
<h2 class="center">课程信息修改</h2>
<hr>
<%
    String L_id = request.getParameter("L_id");

    String sql = "SELECT a.L_tearchID,a.L_id,a.L_name,a.L_introduction, a.L_pigURL, b.t_name FROM t_lessons a, t_teachers b WHERE a.L_tearchID=b.t_id AND L_id=" + L_id;

    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

    String password = "666666";
    String user = "sa";

    Connection conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=myLessons", user, password);
    Statement statement = conn.createStatement();
    ResultSet rs = statement.executeQuery(sql);
    rs.next();


%>

<form method="post" action="update.jsp" id="alterCourse" name="alterCourse">
    <input type="text" hidden="hidden" id="L_teachID" value="<%=rs.getString("L_tearchID")%>">
    编&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：<input name="id" type="text" value="<%=rs.getInt("L_id")%>"><br><br>
    课程名称：<input type="text" name="L_name" value="<%=rs.getString("L_name")%>"><br><br>
    课程介绍：<input type="text" name="L_introduction" class="s_intro_text"
                value="<%=rs.getString("L_introduction")%>"><br><br>
    授课老师：<input type="text" name="t_name" cols="50" rows="5" value="<%=rs.getString("t_name")%>"><br><br>
    照&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;片：<input type="text" value="<%%>"><br><br>
    操&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;作：<input type="submit" value="确定">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="reset" value="取消">
</form>
</body>
<%
    rs.close();
    statement.close();
    conn.close();
%>
</html>
