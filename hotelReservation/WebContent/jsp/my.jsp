<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.URLDecoder"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.hotel.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>酒店预订系统</title>
	<link rel="stylesheet" type="text/css" href="/hotelReservation/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/hotelReservation/css/my.css">
</head>
<body>
<!-- 连接数据库，将该用户的基本信息输出 -->
<%
	request.setCharacterEncoding("UTF-8");
	Cookie[] cookies = request.getCookies();
	String id="";
	String name="";
	String nickName="";
	String sex="";
	String idNum="";
	if(cookies!=null)
		id=URLDecoder.decode(cookies[0].getValue(),"UTF-8");
	Class.forName("com.mysql.jdbc.Driver");
	Connection connection =DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel?characterEncoding=utf-8&useSSL=false","root","123456");
	Statement stmtStatement = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
	String sqlString = "select userName,nickName,sex,idNum from users where userID = '"+id+"'";
	ResultSet rs = stmtStatement.executeQuery(sqlString);
	while(rs.next())
	{
		name=rs.getString("userName");
		nickName=rs.getString("nickName");
		sex=rs.getString("sex");
		idNum=rs.getString("idNum");
	}
	stmtStatement.close();
	connection.close();
%>
<%
	/* 判断是否弹框输出提示信息 */
	String msg=(String)request.getAttribute("message");
	if(msg!=null)
	{
		if(!msg.equals(""))
		{
%>
			<script>
				alert("<%=msg%>");
			</script>
<%
		}
	}
%>
	<jsp:include page="nav_my.jsp"></jsp:include>
	<!-- 操作按钮 -->
	<div>
	<a href="/hotelReservation/jsp/my.jsp" id="bread">我的</a>
	<div id="container">
		<div id="left">
			<p>用户账号：<%= id %></p>
			<p>姓名：<%= name %></p>
			<p>昵称：<%= nickName %></p>
			<p>性别：<%= sex %></p>
			<p>身份证号：<%= idNum %></p>
			<a href="/hotelReservation/jsp/my_message.jsp" class="btn btn-success" id="change">我要修改个人信息</a>
			<a href="/hotelReservation/jsp/my_password.jsp" class="btn btn-success" id="change">我要修改密码</a>
		</div>
		<img alt="人物图片" src="/hotelReservation/image/user_pic.png" id="right">
	</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>