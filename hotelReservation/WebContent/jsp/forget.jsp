<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>酒店预订系统---忘记密码</title>
	<link rel="stylesheet" type="text/css" href="/hotelReservation/css/forget.css">
	<link rel="stylesheet" type="text/css" href="/hotelReservation/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="forget_header.jsp"></jsp:include>
	<div id="container">
		<form action="/hotelReservation/Forget" method="post" id="forget_form">
			<p><span style="color: red;">*</span>手机号：<input type="text" name="phone" id="phone" placeholder="有效手机号" class="text"><span id="id"></span></p>
			<p><span style="color: red;">*</span>新密码：<input type="password" name="password" id="password" class="text"><span id="pwd"></span></p>
			<p><span style="color: red;">*</span>再次输入密码：<input type="password" name="repwd" id="repwd" class="text"><span id="rePwd"></span></p>
			<input type="submit" id="forgetBtn" name="forget" value="确认修改" class="btn btn-primary btn-lg">
		</form>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	<script type="text/javascript" src="/hotelReservation/js/forget.js"></script>
</body>
</html>