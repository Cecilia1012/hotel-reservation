package com.hotel.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hotel.tools.MyTools;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取文本框的值
		String userId = MyTools.toChinese(request.getParameter("phone"));//账号
		String userName = MyTools.toChinese(request.getParameter("username"));//用户姓名
		String nickName = MyTools.toChinese(request.getParameter("nickname"));//用户昵称
		String passwordString = MyTools.toChinese(request.getParameter("password"));//用户密码
		String sex=MyTools.toChinese(request.getParameter("sex"));//性别
		String idNum = MyTools.toChinese(request.getParameter("idNum"));//身份证号
		String[] check = MyTools.toChineses(request.getParameterValues("checkbox"));//复选框
		String message = "";//提示信息
		
		if(check.equals(null))
		{
			message="请先同意相关条款";
			request.setAttribute("message", message);
			RequestDispatcher rd=request.getRequestDispatcher("jsp/register.jsp");
			rd.forward(request, response);
		}
		else
		{
			try 
			{
				Class.forName("com.mysql.jdbc.Driver");
				Connection connection =DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel?characterEncoding=utf-8&useSSL=false","root","123456");
				Statement stmtStatement = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
				String sqlString = "insert into login (userID,password) values('"+userId+"','"+passwordString+"')";
				int rs = stmtStatement.executeUpdate(sqlString);
				if(rs!=0)
				{
					String sql = "insert into users (userID,userName,nickName,sex,idNum) values ('"+userId+"','"+userName+"','"+nickName+"','"+sex+"','"+idNum+"')";
					int rs2 = stmtStatement.executeUpdate(sql);
					if(rs2!=0)
					{
						message="注册成功";
						request.setAttribute("message", message);
						RequestDispatcher rd=request.getRequestDispatcher("jsp/login.jsp");
						rd.forward(request, response);
						stmtStatement.close();
						connection.close();
					}
				}
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
			}
		}
	}
}
