<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.URLDecoder"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.hotel.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="/hotelReservation/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/hotelReservation/css/nav.css">
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	Cookie[] cookies = request.getCookies();
	String id="";
	String name="";
	if(cookies!=null)
		id=URLDecoder.decode(cookies[0].getValue(),"UTF-8");
	Class.forName("com.mysql.jdbc.Driver");
	Connection connection =DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel?characterEncoding=utf-8&useSSL=false","root","123456");
	Statement stmtStatement = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
	String sqlString = "select userName from users where userID = '"+id+"'";
	ResultSet rs = stmtStatement.executeQuery(sqlString);
	while(rs.next())
	{
		name=rs.getString("userName");
	}
	stmtStatement.close();
	connection.close();
%>
	<ul class="nav nav-tabs" style="background-color: rgba(183,226,255,0.6); ">
  		<li role="presentation"><a href="/hotelReservation/jsp/main.jsp">首页</a></li>
  		<li role="presentation"  class="active"><a href="/hotelReservation/jsp/order.jsp">订单</a></li>
  		<li role="presentation"><a href="/hotelReservation/jsp/my.jsp">我的</a></li>
  		<span id="out" style="margin-left: 70%"><%= name %>，欢迎<a href="/hotelReservation/Quit" class="btn btn-primary" id="outBtn">退出</a></span>
	</ul>
</body>
</html>