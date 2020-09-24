<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>酒店预订系统</title>
	<link rel="stylesheet" type="text/css" href="/hotelReservation/css/login.css">
	<link rel="stylesheet" type="text/css" href="/hotelReservation/css/bootstrap.min.css">
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
	<div id="container">
		<h1 style="text-align: center;margin-top: 2%;">酒店预订系统</h1>
		<form action="/hotelReservation/Login" method="post" id="login_form">
			<p id="account">账号：<input type="text" name="id" id="id"></p>
			<p>密码：<input type="password" name="password" id="password"></p>
			<div id="link"><a href="/hotelReservation/jsp/register.jsp" class="register">注册</a><a href="/hotelReservation/jsp/forget.jsp" class="forget">忘记密码</a></div>
			<input type="submit" id="loginBtn" name="login" value="登录" class="btn btn-primary btn-lg">
		</form>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	<script type="text/javascript" src="/hotelReservation/js/login.js"></script>
</body>
</html>