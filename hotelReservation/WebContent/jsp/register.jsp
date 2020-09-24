<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>酒店预订系统---注册</title>
	<link rel="stylesheet" type="text/css" href="/hotelReservation/css/register.css">
	<link rel="stylesheet" type="text/css" href="/hotelReservation/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="register_head.jsp"></jsp:include>
	<div id="container">
		<form action="/hotelReservation/Register" method="post" id="register_form">
			<p><span style="color: red;">*</span>手机号：<input type="text" name="phone" id="phone" placeholder="有效手机号" class="text"><span id="id"></span></p>
			<p><span style="color: red;">*</span>姓名：<input type="text" name="username" id="username" class="text"></p>
			<p><span style="color: red;">*</span>性别： <input type="radio" name="sex" value="男">男<input type="radio" name="sex" value="女">女</p>
			<p><span style="color: red;">*</span>身份证号：<input type="text" name="idNum" id="idNum" class="text"></p>
			<p id="nick">昵称：<input type="text" name="nickname" id="nickname" class="text"><span id="nickTip"></span></p>
			<p><span style="color: red;">*</span>密码：<input type="password" name="password" id="password" class="text"><span id="pwd"></span></p>
			<p><span style="color: red;">*</span>再次输入密码：<input type="password" name="repwd" id="repwd" class="text"><span id="rePwd"></span></p>
			<p class="write write5"><span style="color: red;">*</span>验证码：
				<input type="text" id="check" class="text">
				<img src="/hotelReservation/image/check1.png" id="checkpic">
				<a href="" id="change">看不清楚？换张图片	</a>
			</p>
			<p id="checktip" class="tip">请填写图片中的字符，不区分大小写</p>

			<p class="agree">
				<input type="checkbox" name="checkbox" id="checkbox" checked="checked">
					同意"<span class="clause">服务条款</span>"和"<span class="clause">隐私权相关政策</span>"
			</p>
			
			<input type="submit" id="registerBtn" name="register" value="注册" class="btn btn-primary btn-lg">
		</form>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	<script type="text/javascript" src="/hotelReservation/js/register.js"></script>
</body>
</html>