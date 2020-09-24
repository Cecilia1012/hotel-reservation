package com.hotel.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hotel.tools.MyTools;


/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		//获取用户ID和密码框的内容
		String userId = MyTools.toChinese(request.getParameter("id"));//账号
		String password = MyTools.toChinese(request.getParameter("password"));//密码
		String message="";
		//连接数据库判断用户登录
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection =DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel?characterEncoding=utf-8&useSSL=false","root","123456");
			Statement stmtStatement = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			String sqlString = "select password from login where userID = '"+userId+"'";
			//获得结果集
			ResultSet rs = stmtStatement.executeQuery(sqlString); 
			//账号不存在
			rs.last();
			int rowCount=rs.getRow();
			if(rowCount==0)
			{
				message="该账号不存在，请先注册！";
				request.setAttribute("message", message);
				RequestDispatcher rd=request.getRequestDispatcher("jsp/login.jsp");
				rd.forward(request, response);
			}
			else
			{
				rs.beforeFirst();
				while(rs.next())
				{
					if(password.equals(rs.getString("password")))
					{
						//创建cookie
						Cookie user=new Cookie("userId", userId);
						response.addCookie(user);
						response.sendRedirect("jsp/main.jsp");
					}
					else {
						message="密码错误！";
						request.setAttribute("message", message);
						RequestDispatcher rd=request.getRequestDispatcher("jsp/login.jsp");
						rd.forward(request, response);
					}
				}
			}
			stmtStatement.close();
			connection.close();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
			//System.out.println(e.getMessage());
		}
	}
}
