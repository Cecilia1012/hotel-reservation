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
	<link rel="stylesheet" type="text/css" href="/hotelReservation/css/booking.css">
</head>
<body>
	<jsp:include page="nav_main.jsp"></jsp:include>
	<div>
	<%
		Integer hotelid =Integer.parseInt(request.getParameter("hotelid"));
		String name ="";
		Class.forName("com.mysql.jdbc.Driver");
		Connection connection =DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel?characterEncoding=utf-8&useSSL=false","root","123456");
		Statement stmtStatement = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
		String sqlString = "select ID,name,city,address,level,phone from hotel where ID = '"+hotelid+"'";
		ResultSet rs = stmtStatement.executeQuery(sqlString);
		while(rs.next())
		{
			name=rs.getString("name");
		}
		stmtStatement.close();
		connection.close();
%>
		<p id="bread"><a href="/hotelReservation/jsp/main.jsp" style="color: black;">首页</a>-><a href="/hotelReservation/jsp/booking.jsp" style="color: black;">预订</a></p>
		<div id="container">
			<form action="/hotelReservation/Booking" method="post" id="bookmsg">
				<p>酒店名称：<input type="hidden" value="<%=name%>"  name="hotelname"><%=name%></p>
				<p>入住时间：<input type="date" name="intime"></p>
				<p>退房时间：<input type="date" name="outtime"></p>
				<p>身份证号：<input type="text"" name="idNum"></p>
				<p>房间类型：
					<select name="roomType">
						<option>大床</option>
						<option>双床</option>
						<option>单人床</option>
						<option>多床</option>
					</select>
				</p>
				<p>房间数量：
					<select name="roomNum">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</select>
					间
				</p>
				<p>成人人数：
					<select name="adultNum">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</select>
				</p>
				<p>儿童人数：
					<select name="childNum">
						<option>0</option>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</select>
				</p>
				<input type="submit" name="booking" id="booking" class="btn btn-success" value="确认预订">
				<a href="/hotelReservation/jsp/main.jsp" class="btn btn-danger">取消预订</a>
			</form>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>