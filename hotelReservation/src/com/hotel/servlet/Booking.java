package com.hotel.servlet;

import java.io.IOException;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hotel.tools.MyTools;

/**
 * Servlet implementation class Booking
 */
@WebServlet("/Booking")
public class Booking extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Booking() {
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
		//获取所需信息
		//用户账号
		String userid="";
		Cookie[] cookies = request.getCookies();
		if(cookies!=null)
			userid=URLDecoder.decode(cookies[0].getValue(),"UTF-8");
		//入住时间
		String intime = MyTools.toChinese(request.getParameter("intime"));
		//退房时间
		String outtime = MyTools.toChinese(request.getParameter("outtime"));
		//身份证号
		String idNum = MyTools.toChinese(request.getParameter("idNum"));
		//酒店名称
		String hotelname = MyTools.toChinese(request.getParameter("hotelname"));
		//房间类型
		String roomtype = MyTools.toChinese(request.getParameter("roomType"));
		//房间数量
		Integer roomnum = Integer.parseInt(MyTools.toChinese(request.getParameter("roomNum")));
		//成人
		Integer adultnum = Integer.parseInt(MyTools.toChinese(request.getParameter("adultNum")));
		//儿童
		Integer childnum = Integer.parseInt(MyTools.toChinese(request.getParameter("childNum")));
		//下单时间
		Date currentTime = new Date();
		 SimpleDateFormat nowtime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 String ordertime=nowtime.format(currentTime);
		//总价
		//大床1300，双床850，单人床270，多床1980
		Integer total=0;
		switch(roomtype)
		{
			case "大床":
				total=1300*roomnum;
				break;
			case "双床":
				total=850*roomnum;
				break;
			case "单人床":
				total=270*roomnum;
				break;
			case "多床":
				total=1980*roomnum;
				break;
		}
		//状态
		String state = "已支付";
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection =DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel?characterEncoding=utf-8&useSSL=false","root","123456");
			Statement stmtStatement = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			String sql="insert into order_table (userID,orderTime,total_price,state,in_time,out_time,idNum,hotelname,room_type,room_num,adult,children) value('"+userid+"','"+ordertime+"','"+total+"','"+state+"','"+intime+"','"+outtime+"','"+idNum+"','"+hotelname+"','"+roomtype+"','"+roomnum+"','"+adultnum+"','"+childnum+"')";
			int rs=stmtStatement.executeUpdate(sql);
			if(rs!=0)
			{
				String message="预订成功!";
				request.setAttribute("message", message);
				RequestDispatcher rd=request.getRequestDispatcher("jsp/main.jsp");
				rd.forward(request, response);
			}
			
			stmtStatement.close();
			connection.close();
		} 
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}

}
