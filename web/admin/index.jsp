<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/10/30
  Time: 15:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/style.css" type="text/css">
</head>
<body>
<div class="header">
    <h1>课程信息管理平台--数据管理主界面</h1>
</div>
<div class="body">
    <div id="leftBar">
        <div style="width: 120px;height: 400px;margin: 0 auto">
        <div class="menu">
            <a href="#">通知公告管理</a>
        </div>
        <div class="menu">
            <a href="coures.jsp" target="showContent">课程管理</a>
        </div>
        <div class="menu">
            <a href="#">教师信息管理</a>
        </div>
        <div class="menu">
            <a href="#">学生作品管理</a>
        </div>
        </div>
    </div>
    <div id="rightNav">
        <iframe name="showContent" width="100%" height="100%"  src="welcome.html"></iframe>
    </div>

</div>
<div class="footer"></div>
</body>

</html>
