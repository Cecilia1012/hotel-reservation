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
	<link rel="stylesheet" type="text/css" href="/hotelReservation/css/order.css">
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
	<jsp:include page="nav_order.jsp"></jsp:include>
	<a href="/hotelReservation/jsp/order.jsp" id="bread">订单</a>
	<div>
	<%
		request.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		Cookie[] cookies = request.getCookies();
		String userid="";
		if(cookies!=null)
			userid=URLDecoder.decode(cookies[0].getValue(),"UTF-8");
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection =DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel?characterEncoding=utf-8&useSSL=false","root","123456");
			Statement stmtStatement = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			String sqlString="select orderID,userID,orderTime,total_price,state,in_time,out_time,idNum,hotelname,room_type,room_num,adult,children from order_table where userID = '"+userid+"'";
			ResultSet rs = stmtStatement.executeQuery(sqlString);
			while(rs.next())
			{
			%>
				<form id="container" method="post" action="/hotelReservation/Cancel" style="padding-left: 10%;padding-bottom: 3%;">
					<p>订单号：<%= rs.getInt("orderID") %>&nbsp;&nbsp;&nbsp;&nbsp;下单时间：<%=rs.getString("orderTime") %></p>
					<p>酒店：<%=rs.getString("hotelname")%></p>
					<p>入住时间：<%= rs.getString("in_time") %>&nbsp;&nbsp;&nbsp;&nbsp;退房时间：<%=rs.getString("out_time") %></p>
					<p>身份证号：<%=rs.getString("idNum") %></p>
					<p>房间类型：<%=rs.getString("room_type") %>&nbsp;&nbsp;&nbsp;&nbsp;房间数量：<%=rs.getString("room_num") %></p>
					<p>成人：<%=rs.getInt("adult") %>人&nbsp;&nbsp;&nbsp;&nbsp;儿童：<%=rs.getInt("children") %>人</p>
					<p>总价：<%=rs.getFloat("total_price") %>&nbsp;&nbsp;&nbsp;&nbsp;状态：<%=rs.getString("state") %></p>
					<input type="hidden" value="<%=rs.getInt("orderID") %>" name="id">
			<%
					if(rs.getString("state").equals("已支付"))
					{
			%>
						<input type="submit" class="btn btn-danger" value="我要取消订单" name="change" style="margin-bottom: 3%;">
			<%
					}
			%>
				</form>
			<%
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	%>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>