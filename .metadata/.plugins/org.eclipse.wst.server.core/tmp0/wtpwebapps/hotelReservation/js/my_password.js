/**
 * 
 */
var newPwd = document.getElementById("password");
var rePwd = document.getElementById("repwd");

var pwdTip = document.getElementById("pwd");
var reTip = document.getElementById("rePwd");

//密码框失焦
newPwd.onblur = function () {
	var sPwd = newPwd.value;
	var lenPwd = sPwd.length;
	//判断密码长度
	if(lenPwd<6||lenPwd>16)
	{
		pwdTip.style.color="red";
		pwdTip.innerText="密码长度应为6~16个字符";
		newPwd.select();
		newPwd.focus();
	}
	else
	{
		pwdTip.style.color="green";
		pwdTip.innerText="密码可用";
	}
}

//确认密码框失焦
rePwd.onblur = function() {
	var sRe = rePwd.value;
	var sPwd = newPwd.value;
	if(sRe==sPwd)
	{
		reTip.style.color="green";
		reTip.innerText="密码一致";
	}
	else
	{
		reTip.style.color="red";
		reTip.innerText="两次密码不一致";
		rePwd.select();
		rePwd.focus();
	}
}