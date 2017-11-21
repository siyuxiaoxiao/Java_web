<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="javax.sql.DataSource" %>
<%@ page language="java" import="javax.naming.Context" %>
<%@ page language="java" import="javax.naming.InitialContext" %>
<%@ page language="java" import="javax.naming.NamingException" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>无标题文档</title>
    <link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<iframe src="header.html" style="width:100%; height:200px" frameborder="0" scrolling="no"></iframe>
<%!

    String driverClass = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    String url = "jdbc:sqlserver://localhost:1433;DatabaseName=myLessons";
    String username = "sa";
    String password = "666666";
%>

<div id="content">
    <div id="news">
        <div id="fader"><!--滚动图片-->
            <img src="upfiles/news/20171012001.jpg" width="500" height="200"/></div>
        <div id="bulliten"> <!--通知公告-->
            <h1 class="title1">通知公告 <span>更多>></span></h1>
            <ul>
                <%
                    String sql = "select * from t_news";
                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                    Connection conn = DriverManager.getConnection(url, username, password);
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery(sql);

                    for (int i = 0; i < 8; i++) {
                        rs.next();
                        String sTitle = rs.getString("N_title");
                        String sTime = rs.getString("N_addtime");


                        if (sTitle.length() > 20)
                            sTitle = sTitle.substring(0, 20);

                        sTime = sTime.substring(0, 10);

                %>
                <li><a href="#"><%=sTitle%>
                </a> <span><%=sTime%></span></li>
                <%
                    }
                    rs.close();
                %>


            </ul>
        </div>
    </div><!--news end-->
    <div id="cbottom">
        <div id="cleft"> <!--课程信息-->
            <h1 class="title1">热点课程 <span>更多>></span></h1>
            <table width="96%" border="0" cellpadding="0" cellspacing="0" align="center">
                <%
                    sql = "select * from t_lessons";
                    ResultSet rs2 = stmt.executeQuery(sql);

                    for (int i = 0; i < 4; i++) {
                        rs2.next();
                        String sName = rs2.getString("L_name"); /*课程名称*/
                        String sRUL = rs2.getString("L_pigURL");

                        if (i % 2 == 0)
                            out.println("<tr>");
                %>
                <td><img src="<%=sRUL%>" width="200" height="100"/>
                    <br/>
                    课程名称：<%=sName%><br/>
                    授课教师：路老师
                </td>
                <td>
                </td>
                <%
                        if (i % 2 == 1)
                            out.println("</tr>");
                    }
                    rs2.close();
                %>


            </table>
            <div class="student_works"><%--学生作品--%>
                <h1 class="title1">学生作品 <span>更多>></span></h1>
                <table width="96%" border="0" cellpadding="0" cellspacing="0" align="center">
                    <%
                        sql = "select * from t_demos";
                        ResultSet rs4 = stmt.executeQuery(sql);

                        for (int i = 0; i < 3; i++) {
                            rs4.next();
                            String d_title = rs4.getString("d_title"); /*课程名称*/
                            String d_introduction = rs4.getString("d_introduction").substring(0,30);
                            String d_authors = rs4.getString("d_authors");

                            out.println("<tr>");
                    %>
                    <tr height="60px">
                        <td><h4><b><%=d_title%></b></h4>
                        </td>
                        <td width="180" align="left">
                            <p>作者:<%=d_authors%>
                            </p>
                        </td>
                        <tr>
                    <td>
                            <span><%=d_introduction%>...
                            </span>
                    </td>
                    <td>指导老师:</td>
                    <tr>


                </tr>

                </tr>
                    <td colspan="2"><hr/></td>

                    </tr>



                    <%

                            out.println("</tr>");
                        }
                        rs4.close();
                    %>
                </table>
            </div>
        </div>
        <div id="cright"><!--教师信息-->
            <h1 class="title2">教学名师 <span>更多>></span></h1>
            <table width="96%" border="0" cellpadding="0" cellspacing="0" align="center">
                <%
                    sql = "select * from t_teachers";
                    ResultSet rs3 = stmt.executeQuery(sql);

                    for (int i = 0; i < 3; i++) {
                        rs3.next();
                        String tName = rs3.getString("t_name"); /*课程名称*/
                        String t_pigURL = rs3.getString("t_pigURL");
                        String t_introducout = rs3.getString("t_introducont");
                        out.println("<tr>");
                %>
                <tr height="120">
                    <td><img src="<%=t_pigURL%>" width="200" height="100"/>
                    </td>
                    <td width="180" align="left">
                        <p class="title3"><%=tName%>
                        </p>
                        <p class="tea_intro"><%=t_introducout%>
                        </p>
                    </td>
                </tr>


                <%

                        out.println("</tr>");
                    }
                    rs3.close();
                %>

            </table>
            <div class="resoures">
                <h1 class="title2">资源下载 <span>更多>></span></h1>
                <table width="96%" border="0" cellpadding="0" cellspacing="0" align="center">
                    <%
                        sql = "select * from t_lessons";
                        ResultSet rs5 = stmt.executeQuery(sql);

                        while (rs5.next()){



                            String r_name = rs5.getString("L_name");
                            out.println("<tr>");
                    %>
                    <tr height="30">

                        <td width="180" align="left">
                           <a href="#"><%=r_name%></a>


                        </td>
                    </tr>
                    <td colspan="2"><hr/></td>


                    <%

                            out.println("</tr>");
                        }
                        rs3.close();
                    %>

                </table>
            </div>
        </div>

    </div>
</div>
<div style="clear: both"></div>
<div class="footer"></div>
</body>
</html>
<%

    stmt.close();
    conn.close();
%>
