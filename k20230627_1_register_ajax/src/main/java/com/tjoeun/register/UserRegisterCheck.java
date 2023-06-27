package com.tjoeun.register;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UserRegisterCheck")
public class UserRegisterCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserRegisterCheck() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
	
		String userID = request.getParameter("userID").trim();
		// System.out.println(userID);
		
		// 회원 가입하려는 아이디가 테이블에 존재하는가 판단하는 메소드를 실행한다.
		int result = new RegisterDAO().registerCheck(userID);
		response.getWriter().write(result + "");
		
	}

}
