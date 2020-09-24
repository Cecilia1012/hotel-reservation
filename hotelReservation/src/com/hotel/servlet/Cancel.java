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
 * Servlet implementation class Cancel
 */
@WebServlet("/Cancel")
public class Cancel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Cancel() {
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
		Integer id = Integer.parseInt(MyTools.toChinese(request.getParameter("id"))); 
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection =DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel?characterEncoding=utf-8&useSSL=false","root","123456");
			Statement stmtStatement = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			String sqlString = "update order_table set state='已取消' where orderID = '"+id+"'";
			Integer rs = stmtStatement.executeUpdate(sqlString);
			if(rs!=0)
			{
				String message="订单取消成功！";
				request.setAttribute("message", message);
				RequestDispatcher rd = request.getRequestDispatcher("jsp/order.jsp");
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
