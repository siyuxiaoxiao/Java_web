<%--
  Created by IntelliJ IDEA.
  User: 萌新
  Date: 2017/11/3
  Time: 14:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" import="javax.sql.DataSource" %>
<%@ page language="java" import="javax.naming.Context" %>
<%@ page language="java" import="javax.naming.InitialContext" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3 class="title_1">课程信息维护</h3>
<hr>
<div style="clear: both"></div>
<table border="1" cellpadding="0" cellspacing="0" class="center">
    <thead>
    课程信息
    </thead>
    <tbody>
    <tr style="text-align: center">
        <td class="table_w">编号</td>
        <td class="table_w">课程名称</td>
        <td class="table_w">课程介绍</td>
        <td class="table_w">授课老师</td>
        <td class="table_w">照片</td>
        <td class="table_w">操作</td>
    </tr>
    <%
        Context c = new InitialContext();
        DataSource ds = (DataSource)c.lookup("java:comp/env/jdbc/myLessons");
        Connection conn = ds.getConnection();
        String sql="SELECT a.L_id,a.L_name,a.L_introduction, a.L_pigURL, b.t_name FROM t_lessons a, t_teachers b WHERE a.L_tearchID=b.t_id";
        Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);

        ResultSet rs=stmt.executeQuery(sql);
        rs.last();
        int pageSize=5;
        int recordCount=rs.getRow();
        int pageCount=(recordCount%pageSize==0)?(recordCount/pageSize):(recordCount/pageSize+1);
        int showPage=1;
        if(showPage>=pageCount)
            showPage=pageCount;
        int position=(showPage-1)*pageSize+1;
        rs.first();
        for(int i=1;i<=pageSize&&!rs.isAfterLast();i++){
            rs.next();
    %>
    <tr>

        <td class="table_w"><%=rs.getInt("L_id")%></td>
        <td class="table_w"><%=rs.getString("L_name")%></td>
        <td class="table_w"><%=rs.getString("L_introduction").substring(0,25)%>...</td>
        <td class="table_w"><%=rs.getString("t_name")%></td>


        <td class="table_w"><img src="../<%=rs.getString("L_pigURL")%>" width="45px" height="45px"></td>
        <td class="table_w"><a id="compile" href="lesson_edit.jsp?L_id=<%rs.getInt("L_id");%>">编辑</a>&nbsp;&nbsp;&nbsp;<a href="#">删除</a></td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
</body>
</html>
