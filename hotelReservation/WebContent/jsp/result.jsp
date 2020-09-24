<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.URLDecoder"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.hotel.servlet.*" %>
<%@ page import="com.hotel.javabean.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>酒店预订系统</title>
	<link rel="stylesheet" type="text/css" href="/hotelReservation/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/hotelReservation/css/result.css">
</head>
<body>
	<jsp:include page="nav_main.jsp"></jsp:include>
	<div>
		<p id="bread"><a href="/hotelReservation/jsp/main.jsp" style="color: black;">首页</a>-><a href="/hotelReservation/jsp/result.jsp" style="color: black;">查询结果</a></p>
		<div id="container">
			<table class="table">
				<tr>
					<td>酒店名称</td>
					<td>城市</td>
					<td>酒店地址</td>
					<td>等级</td>
					<td>客服电话</td>
					<td>预订</td>
				</tr>
				<%
					request.setCharacterEncoding("UTF-8");
					String city = (String)request.getAttribute("city");

					//查询获取列表数据
					ArrayList<Hotel> hotels = new ArrayList<Hotel>();
					try 
					{
						Class.forName("com.mysql.jdbc.Driver");
						Connection connection =DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel?characterEncoding=utf-8&useSSL=false","root","123456");
						Statement stmtStatement = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
						String sqlString = "select ID,name,city,address,level,phone from hotel where city = '"+city+"'";
						ResultSet rs = stmtStatement.executeQuery(sqlString);
						if(rs!=null)
						{
							while(rs.next())
							{
								Hotel hotelmin = new Hotel();
								hotelmin.setid(rs.getInt("ID"));
								hotelmin.setname(rs.getString("name"));
								hotelmin.setcity(rs.getString("city"));
								hotelmin.setaddress(rs.getString("address"));
								hotelmin.setlevel(rs.getString("level"));
								hotelmin.setphone(rs.getString("phone"));
								hotels.add(hotelmin);
							}
						}
						for(Hotel hotelmin:hotels)
						{
					%>
						<tr>
							<td><%=hotelmin.getname() %></td>
							<td><%=hotelmin.getcity() %></td>
							<td><%=hotelmin.getaddress() %></td>
							<td><%=hotelmin.getlevel() %></td>
							<td><%=hotelmin.getphone() %></td>
							<td><a href='/hotelReservation/jsp/booking.jsp?hotelid=<%= hotelmin.getid()%>'>预订</a></td>
						</tr>
					<%
						}
						stmtStatement.close();
						connection.close();
					}
					catch(Exception e)
					{
						e.printStackTrace();
					}
				%>
			</table>
			<a class="btn btn-primary" id="return" href="/hotelReservation/jsp/main.jsp">返回查询</a>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>