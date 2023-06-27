package com.tjoeun.ajax;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AjaxInsert")
public class AjaxInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AjaxInsert() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// System.out.println("AjaxSearch 서블릿이 GET 방식으로 요청됨");
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// System.out.println("AjaxSearch 서블릿이 POST 방식으로 요청됨");
		actionDo(request, response);
	}
	
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // System.out.println("AjaxInsert 서블릿의 actionDo() 메소드 실행");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		int result = 0;
		try {
			
			// insert.jsp에서 입력한 데이터가 ajax를 통해서 넘어오는 데이터를 받는다.
			String name = request.getParameter("name").trim();
			int age = Integer.parseInt(request.getParameter("age").trim());
			String gender = request.getParameter("gender");
			String email = request.getParameter("email").trim();
			// 넘겨받은 데이터를 AjaxVO 클래스 객체에 저장한다.
			AjaxVO vo = new AjaxVO();
			vo.setName(name);
			vo.setAge(age);
			vo.setGender(gender);
			vo.setEmail(email);
			
			// 넘겨받은 데이터를 테이블에 저장하는 메소드를 실행한다.
			result = new AjaxDAO().insert(vo);
		} catch (Exception e) {
			result = -1;
		}
		// System.out.println(result);
		// write() 메소드는 인수로 문자열만 가질 수 있으므로 공백을 붙여서 문자열로 만들어 리턴한다.
		response.getWriter().write(result + "");
	}

}
