package com.tjoeun.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//	@WebServlet 어노테이션에 특정 요청을 써주면 그 요청이 들어왔을 때 컨트롤러의 메소드가 자동으로 실행된다.
//	@WebServlet 어노테이션에 특정 요청이 들어왔을 때 해당 컨트롤러의 메소드가 실행되므로 요청마다 컨트롤러를
//	일일히 만들어야 하는 번거로움이 발생된다.
//	@WebServlet 어노테이션에 와일드카드 문자(*)를 사용하는 확장명 패턴의 요청을 받을 수 있다.
//	확장명 패턴 방식으로 요청을 받을 때 맨 앞에 "/"를 붙이지 않는다.
//	확장명 패턴 방식으로 요청을 받으면 파일명은 상관없이 동일한 확장명으로 요청되면 컨트롤러의 메소드가 자동으로
//	실행된다. => 확장명을 ".jsp"가 아닌 다른 이름을 사용하면 어떤 페이지가 호출되나 숨길 수 있다. => 보안성 향상
// =

@WebServlet("*.nhn")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public HomeController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// System.out.println("actionDo()");
		request.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html; charset=UTF-8"); 
		
		// getRequestURI() 메소드로 주소창에 요청된 컨텍스트 패스와 요청을 받아온다.
		String url = request.getRequestURI();
		System.out.println(url);
		// getContextPath() 메소드로 주소창에 요청된 컨텍스트 패스만 받아온다.
		String contextPath = request.getContextPath();
		System.out.println(contextPath);
		// 주소창에 입력된 컨텍스트 패스 뒤의 요청만 받아온다.
		// String context = url.substring(contextPath.length());
		String context = url.substring(contextPath.length() + 1, url.length() - 4);
		System.out.println(context);
		
		// 요청에 따른 view 페이지를 결정한다.
		String viewpage = "/WEB-INF/";
		switch (context) {
		case "hello": 
			viewpage += "hello"; // "/WEB-INF/" + "hello" => "/WEB-INF/hello"
			break;
		case "index": 
			viewpage += "index"; // "/WEB-INF/" + "index" => "/WEB-INF/index"
			break;
		}
		viewpage += ".jsp"; // "/WEB-INF/hello" + ".jsp" => "/WEB-INF/hello.jsp"
		
		// 요청에 따른 페이지를 호출한다.
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewpage);
		dispatcher.forward(request, response);
	}

}

























