<%--
  Created by IntelliJ IDEA.
  User: 萌新
  Date: 2017/11/3
  Time: 13:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="javax.sql.DataSource" %>
<%@ page language="java" import="javax.naming.Context" %>
<%@ page language="java" import="javax.naming.InitialContext" %>
<%@ page language="java" import="javax.naming.NamingException" %>


<html>
<head>
    <title>Title</title>
    <script>
        function deleteConfime(id) {

            if (confirm("您确定要删除该用户信息吗？")) {


                this.location = "delete.jsp?id=" + id;

            }
            else {
                return false;
            }
        }

    </script>
    <link rel="stylesheet" href="../css/style.css" type="text/css">
</head>
<body>

<h3 style="text-align: center;margin: 0 auto">课程信息维护</h3>
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
        int showPage=1;
        String integer=request.getParameter("showPage");
        if (integer==null){
            integer="1";
        }
        showPage=Integer.parseInt(integer);
        if (showPage<=1){
            showPage=1;
        }
        Context c = new InitialContext();
        DataSource ds = (DataSource)c.lookup("java:comp/env/jdbc/myLessons");
        Connection conn = ds.getConnection();



        String sql = "SELECT a.L_id,a.L_name,a.L_introduction, a.L_pigURL, b.t_name FROM t_lessons a, t_teachers b WHERE a.L_tearchID=b.t_id";
        Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
        int pageSize = 5;
        int recordCount = 0;
        int pageCount=0;
        ResultSet rs = stmt.executeQuery(sql);
        rs.last();
        recordCount=rs.getRow();



        pageCount=(recordCount%pageSize==0)?(recordCount/pageSize):(recordCount/pageSize+1);



        if(showPage>=pageCount){
            showPage=pageCount;
        }
        int position=(showPage-1)*pageSize+1;
        rs.absolute(position);
        for (int i = 1; i <= pageSize && !rs.isAfterLast(); i++) {
            String strID = rs.getString(1);

            String strIntroduction = rs.getString(3);

            if(strIntroduction.length()>50)
                strIntroduction = strIntroduction.substring(0,50) + "...";


    %>
    <tr>

        <td class="table_w" ><%=rs.getInt("L_id")%>
        </td>
        <td class="table_w"><%=rs.getString("L_name")%>
        </td>
        <td class="table_w"><%=rs.getString("L_introduction").substring(0, 25)%>...</td>
        <td class="table_w"><%=rs.getString("t_name")%>
        </td>
        <td class="table_w"><%=rs.getString("L_pigURL")%>
        </td>
        <td class="table_w"><a id="compile"
                               href="lesson_edit.jsp?L_id=<%=strID%>" target="_self">编辑</a>&nbsp;&nbsp;&nbsp;<a
                href="#"  onclick="deleteConfime(<%=strID%>)">删除</a></td>
    </tr>
    <%
        rs.next();
        }
    %>
    <tr height="40">
        <td colspan="6" align="center" valign="middle">
            第<%=showPage %>页（共<%=pageCount %>页） <a href="coures.jsp?showPage=1">首页</a> <a href="coures.jsp?showPage=<%=showPage-1%>">上一页</a>
            <a href="coures.jsp?showPage=<%=showPage+1%>">下一页</a>
            <a href="coures.jsp?showPage=<%=pageCount%>">末页</a>
            <br>
            <br>
            <a href="lesson_add.jsp?oType=0" target="_self">添加课程</a>&nbsp;&nbsp;<a href="delete.jsp?uid=all" target="_self">全部删除</a></td>
    </tr>
    </tbody>
</table>
<%
    rs.close();
    stmt.close();
    conn.close();%>
</body>
</html>
