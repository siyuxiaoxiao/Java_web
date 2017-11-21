<%@ page language="java" import="javax.sql.DataSource" %>
<%@ page language="java" import="javax.naming.Context" %>
<%@ page language="java" import="javax.naming.InitialContext" %>
<%@ page language="java" import="javax.naming.NamingException" %>
<%@ page import="java.sql.*" %>
<%--
  Created by IntelliJ IDEA.
  User: 萌新
  Date: 2017/11/7
  Time: 22:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    Context c = new InitialContext();
    DataSource ds = (DataSource)c.lookup("java:comp/env/jdbc/myLessons");
    Connection conn =ds.getConnection();
    String id=request.getParameter("id");
    String sql="DELETE FROM t_lessons where L_id="+id;
    Statement statement=conn.createStatement();

    int rtn=statement.executeUpdate(sql);
    if(rtn!=0){
        out.print("删除成功");
    }else {

        out.print("删除错误");
    }

%>
<head>
    <script>
        console.log(<%=id%>);
        console.log(<%=sql%>);

    </script>
</head>
