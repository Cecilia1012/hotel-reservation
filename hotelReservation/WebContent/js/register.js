/**
 * 
 */
//获取文本框
var userId = document.getElementById("phone");//电话
var name = document.getElementById("username");//姓名
var nick = document.getElementById("nickname");//昵称
var pwd = document.getElementById("password");//密码
var rePwd = document.getElementById("repwd");//再次输入
var check = document.getElementById("check");//验证码文本框

//获取提示
var idTip = document.getElementById("id");//电话提示
var nickTip = document.getElementById("nickTip");//昵称提示
var pwdTip = document.getElementById("pwd");//密码提示
var reTip = document.getElementById("rePwd");//再次输入提示
var checktip = document.getElementById("checktip");//验证码提示
var checkbox = document.getElementById("checkbox");//复选框

//超链接
var change = document.getElementById("change");//换验证码超链接

//勾选框
var agree = document.getElementById("checkbox");//勾选框

var checkpic = document.getElementById("checkpic");//获取验证码图片

var button = document.getElementById("registerBtn");//按钮

//验证码图片的值
var checkLetterLower="gyfy";
var checkLetterUpper = "GYFY";
var checkLetter = "GYFY";

//判断函数
//判断验证码
function isCorrectCheck(s)
{
	if(s==checkLetter||s==checkLetterUpper||s==checkLetterLower)
		return true;
	return false;
}

//更换验证码的函数
function changePicture()
{
	var num;
	num=Math.floor(Math.random()*4+1);
	switch(num)
	{
		case 1:
			checkpic.src="/hotelReservation/image/check1.png";
			checkLetter="GYFY";
			checkLetterLower="gyfy";
			checkLetterUpper="GYFY";
			break;
		case 2:
			checkpic.src="/hotelReservation/image/check2.png";
			checkLetter="IDHM";
			checkLetterLower="idhm";
			checkLetterUpper="IDHM";
			break;
		case 3:
			checkpic.src="/hotelReservation/image/check3.png";
			checkLetter="wsQJ";
			checkLetterUpper="WSQJ";
			checkLetterLower="wsqj";
			break;
		case 4:
			checkpic.src="/hotelReservation/image/check4.png";
			checkLetter="RXBJ";
			checkLetterUpper="RXBJ";
			checkLetterLower="rxbj";
			break;
	}
}

//文本框失焦
//账号
userId.onblur = function() {
	var sNum = userId.value;
	var lenNum = sNum.length;
	if(lenNum!=11)
	{
		idTip.style.color="red";
		idTip.innerText="请填写正确格式的手机号xxxxxxxxxxx";
		userId.select();
		userId.focus();
	}
	else
	{
		idTip.style.color="green";
		idTip.innerText="手机号格式正确";
	}
}

//昵称
nick.onblur = function() {
	var sNick = nick.value;
	var lenNick = sNick.length;
	if(sNick!="")
	{
		if(lenNick>10)
		{
			nickTip.style.color="red";
			nickTip.innerText="昵称长度不超过10字符";
		}
		else
		{
			nickTip.style.color="green";
			nickTip.innerText="昵称可用";
		}
	}
}

//密码
pwd.onblur = function() {
	var sPassword=pwd.value;
	var lenPassword = sPassword.length;
	if(lenPassword<6||lenPassword>16)
	{
		pwdTip.style.color="red";
		pwdTip.innerText="密码长度应为6~16个字符";
		pwd.select();
		pwd.focus();
	}
	else if(isCorrectPassword(sPassword))
	{
		pwdTip.style.color="green";
		pwdTip.innerText="密码可用";
	}
}

//再次输入密码
rePwd.onblur = function() {
	var sRepeat=rePwd.value;
	var sPassword = pwd.value;
	if(sRepeat==sPassword)
	{
		reTip.style.color="green";
		reTip.innerText="密码一致";
	}
	else
	{
		reTip.style.color="red";
		reTip.innerText="两次填写的密码不一致";
		rePwd.select();
		rePwd.focus();
	}
}

//验证码文本框
check.onblur = function()
{
	var sCheck = check.value;
	if(isCorrectCheck(sCheck))
	{
		checktip.style.color="green";
		checktip.innerText="验证通过";
	}
	else
	{
		checktip.style.color="red";
		checktip.innerText="验证码输入错误";
		//输入错误后更换图片
		changePicture();
		check.select();
		check.focus();
	}
}

//超链接行为
//换验证码
change.onclick = function(event)
{
	event.preventDefault();
	changePicture();
}