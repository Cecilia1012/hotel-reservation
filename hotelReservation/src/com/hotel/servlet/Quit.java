package com.hotel.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Quit
 */
@WebServlet("/Quit")
public class Quit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Quit() {
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
		//获取cookies数组
		Cookie[] cookies = request.getCookies();
		//循环销毁
		for(Cookie cookie: cookies){
            cookie.setMaxAge(0); 
            cookie.setPath("/"); 
            response.addCookie(cookie);
      }
		String message="退出成功！";
		request.setAttribute("message", message);
		RequestDispatcher rd=request.getRequestDispatcher("jsp/login.jsp");
		rd.forward(request, response);
	}

}
