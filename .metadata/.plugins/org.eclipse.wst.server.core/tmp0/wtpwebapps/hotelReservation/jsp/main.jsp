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
	<link rel="stylesheet" type="text/css" href="/hotelReservation/css/main.css">
</head>
<body>
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
	<jsp:include page="nav_main.jsp"></jsp:include>
	<div>
		<a href="/hotelReservation/jsp/main.jsp" id="bread">首页</a>
		<div id="container">
			<!-- 搜索框 -->
			<form id="left" action="/hotelReservation/Main_Search" method="post">
				<p>城市：<select name="city">
<%
				Class.forName("com.mysql.jdbc.Driver");
				Connection connection =DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel?characterEncoding=utf-8&useSSL=false","root","123456");
				Statement stmtStatement = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
				String sqlString = "select distinct(city) from hotel";
				ResultSet rs = stmtStatement.executeQuery(sqlString);
				while(rs.next())
				{
					String city=rs.getString("city");
					%>
					<option><%=city %></option>
					<%
				}
				stmtStatement.close();
				connection.close();
%>
				</select></p>
				<input type="submit" value="查询" class="btn btn-primary" id="searchBtn" name="search">
			</form>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>