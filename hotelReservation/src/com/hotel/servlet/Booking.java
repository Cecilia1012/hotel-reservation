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
		//��ȡ������Ϣ
		//�û��˺�
		String userid="";
		Cookie[] cookies = request.getCookies();
		if(cookies!=null)
			userid=URLDecoder.decode(cookies[0].getValue(),"UTF-8");
		//��סʱ��
		String intime = MyTools.toChinese(request.getParameter("intime"));
		//�˷�ʱ��
		String outtime = MyTools.toChinese(request.getParameter("outtime"));
		//���֤��
		String idNum = MyTools.toChinese(request.getParameter("idNum"));
		//�Ƶ�����
		String hotelname = MyTools.toChinese(request.getParameter("hotelname"));
		//��������
		String roomtype = MyTools.toChinese(request.getParameter("roomType"));
		//��������
		Integer roomnum = Integer.parseInt(MyTools.toChinese(request.getParameter("roomNum")));
		//����
		Integer adultnum = Integer.parseInt(MyTools.toChinese(request.getParameter("adultNum")));
		//��ͯ
		Integer childnum = Integer.parseInt(MyTools.toChinese(request.getParameter("childNum")));
		//�µ�ʱ��
		Date currentTime = new Date();
		 SimpleDateFormat nowtime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 String ordertime=nowtime.format(currentTime);
		//�ܼ�
		//��1300��˫��850�����˴�270���ല1980
		Integer total=0;
		switch(roomtype)
		{
			case "��":
				total=1300*roomnum;
				break;
			case "˫��":
				total=850*roomnum;
				break;
			case "���˴�":
				total=270*roomnum;
				break;
			case "�ല":
				total=1980*roomnum;
				break;
		}
		//״̬
		String state = "��֧��";
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection =DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel?characterEncoding=utf-8&useSSL=false","root","123456");
			Statement stmtStatement = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
			String sql="insert into order_table (userID,orderTime,total_price,state,in_time,out_time,idNum,hotelname,room_type,room_num,adult,children) value('"+userid+"','"+ordertime+"','"+total+"','"+state+"','"+intime+"','"+outtime+"','"+idNum+"','"+hotelname+"','"+roomtype+"','"+roomnum+"','"+adultnum+"','"+childnum+"')";
			int rs=stmtStatement.executeUpdate(sql);
			if(rs!=0)
			{
				String message="Ԥ���ɹ�!";
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
