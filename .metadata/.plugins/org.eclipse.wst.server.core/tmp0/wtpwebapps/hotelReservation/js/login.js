/**
 * 
 */

var userID = document.getElementById("id");
var pwd = document.getElementById("password");

//函数判断是否为空
function isEmpty() {
	//获取文本框的内容
	var userId = userID.value;
	var pawd = pwd.value;
	if(userId==""||pawd=="")
		return false;
	return true;
}

//密码文本框失焦判断填写状况
pwd.onblur = function() {
	if(isEmpty()==false)
		alert("账号或密码不能为空！");
}

//账号文本框失焦
userID.onblur = function() {
	if(isEmpty()==false&&pwd.value!="")
		alert("账号不能为空！");
}