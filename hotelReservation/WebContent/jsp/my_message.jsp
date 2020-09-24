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
	<link rel="stylesheet" type="text/css" href="/hotelReservation/css/my_message.css">
</head>
<body>
<!-- 连接数据库，获取用户的基本信息 -->
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
	<jsp:include page="nav_my.jsp"></jsp:include>
	<!-- 操作按钮 -->
	<div>
	<p id="bread"><a href="/hotelReservation/jsp/my.jsp" style="color: black;">我的</a>-><a href="/hotelReservation/jsp/my_message.jsp" style="color: black;">修改个人信息</a></p>
	<form id="container" action="/hotelReservation/My_Message" method="post">
		<div id="left">
			<p>用户账号：<%= id %></p>
			<p>姓名：<input type="text" value="<%= name %> " name="name"></p>
			<p>昵称：<input type="text" value="<%= nickName %> " name="nickName"></p>
			<p>性别：
			<%
				if(sex.equals("男"))
				{
			%>
					<input type="radio" name="sex" value="男" checked="checked">男<input type="radio" name="sex" value="女">女
			<%
				}
				else
				{
			%>
					<input type="radio" name="sex" value="男">男<input type="radio" name="sex" value="女" checked="checked">女
			<%
				}
			%>
			</p>
			<p>身份证号：<input type="text" value="<%= idNum %>" name="idNum"></p>
			<input type="submit" name="yes" value="确认修改" class="btn btn-success" id="change">
			<a href="/hotelReservation/jsp/my.jsp" class="btn btn-danger" id="change">取消修改</a>
		</div>
		<img alt="人物图片" src="/hotelReservation/image/user_pic.png" id="right">
	</form>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>