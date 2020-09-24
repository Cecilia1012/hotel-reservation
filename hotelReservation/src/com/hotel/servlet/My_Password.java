package com.hotel.servlet;

import java.io.IOException;
import java.net.URLDecoder;
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
 * Servlet implementation class My_Password
 */
@WebServlet("/My_Password")
public class My_Password extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public My_Password() {
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
		//获取内容
		String password = MyTools.toChinese(request.getParameter("password"));//新密码
		String message = "";
		String id="";
		Cookie[] cookies = request.getCookies();
		if(cookies!=null)
			id=URLDecoder.decode(cookies[0].getValue(),"UTF-8");
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection =DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel?characterEncoding=utf-8&useSSL=false","root","123456");
			Statement stmtStatement = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			String sqlString = "update login set password = '"+password+"' where userID = '"+id+"'";
			int rs = stmtStatement.executeUpdate(sqlString);
			if(rs!=0)
			{
				message="密码修改成功！";
				request.setAttribute("message", message);
				RequestDispatcher rd = request.getRequestDispatcher("jsp/my.jsp");
				rd.forward(request, response);
				stmtStatement.close();
				connection.close();
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}

}
