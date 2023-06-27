package com.tjoeun.ajax;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AjaxSearch")
public class AjaxSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AjaxSearch() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// System.out.println("AjaxSearch 서블릿이 GET 방식으로 요청됨");
		// System.out.println(request.getParameter("name"));
		actionDo(request, response);
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// System.out.println("AjaxSearch 서블릿이 POST 방식으로 요청됨");
		// request.setCharacterEncoding("UTF-8");
		System.out.println(request.getParameter("name"));
		actionDo(request, response);

	}
	
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// System.out.println("AjaxSearch 서블릿이 POST 방식으로 요청됨");
		// request.setCharacterEncoding("UTF-8");
		// System.out.println("AjaxSearch 서블릿이 actionDo 방식으로 요청됨");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String name = request.getParameter("name");
		// System.out.println(name);
		
		// ajax 방식으로 요청한 곳으로 데이터를 리턴한다.
		// write() 메소드로 ajax 방식으로 요청한 곳으로 데이터를 리턴한다.
		// write() 메소드의 인수는 반드시 문자열이 나와야 하고 ajax로 서블릿을 호출한 곳에서는
		// responseText를 사용해서 받는다.
		response.getWriter().write(getJSON(name));
		
	}
	
	private String getJSON(String name) {
		// System.out.println("AjaxSearch 서블릿이 getJSON 방식으로 요청됨");
		// 검색할 이름을 입력하지 않고 검색 버튼을 클릭했을 때 넘어오는 null을 공백으로 처리한다.
		if(name == null) {
			name ="";
		}
		// ajax 테이블에서 입력한 문자열이 name 필드에 포함된 데이터를 얻어온다.
		ArrayList<AjaxVO> list = new AjaxDAO().search(name);
		// System.out.println(list);
		
		// 테이블을 검색해서 얻어온 데이터를 json 형식의 문자열로 만든다.
		StringBuffer result = new StringBuffer();
		result.append("{\"result\": ["); // json 시작
		// 데이터의 개수만큼 반복하며 json 형태의 문자열로 만든다.
		for(AjaxVO vo : list) {
			result.append("[{\"value\" : \"" + vo.getIdx() + "\"},");
			result.append("{\"value\" : \"" + vo.getName().trim() + "\"},");
			result.append("{\"value\" : \"" + vo.getAge() + "\"},");
			result.append("{\"value\" : \"" + vo.getGender().trim() + "\"},");
			result.append("{\"value\" : \"" + vo.getEmail().trim() + "\"}],");
			
		}
		result.append("]}"); // json 끝
		
		// StringBuffer 타입의 객체를 String 타입으로 리턴시키기 위해 toString() 메소드를 실행해서
		// 리턴시킨다.
		return result.toString();
	}

}













