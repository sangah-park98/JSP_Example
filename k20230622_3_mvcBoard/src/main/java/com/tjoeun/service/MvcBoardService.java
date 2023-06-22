package com.tjoeun.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.tjoeun.dao.MvcBoardDAO;
import com.tjoeun.mybatis.MySession;
import com.tjoeun.vo.MvcBoardList;
import com.tjoeun.vo.MvcBoardVO;

public class MvcBoardService {

	private static MvcBoardService instance = new  MvcBoardService();
	private MvcBoardService() {}
	public static MvcBoardService getInstance() {
		return instance;
	}
	
//	MvcBoardDAO 클래스에서 사용할 dao 클래스 객체를 얻어온다.
	private MvcBoardDAO dao = MvcBoardDAO.getInstance();

//	컨트롤러에 insertOK.nhn이라는 요청이 들어오면 컨트롤러에서 호출하는 메소드로 테이블에 저장할 메인글 정보가
//	저장된 request 객체를 넘겨받고 mapper를 얻어온 후 MvcBoardDAO 클래스의 insert sql 명령을 실행하는 메소드를 
//	호출하는 메소드	
	public void insert(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("MvcBoardService 클래스의 insert() 메소드");
		SqlSession mapper = MySession.getSession();
		
		// insert.jsp에서 입력한 request 객체에 저장돼서 넘어오는 데이터를 받아서 MvcBoardVO 클래스 객체에
		// 저장한다.
		MvcBoardVO vo = new MvcBoardVO();
		vo.setName(request.getParameter("name"));
		vo.setSubject(request.getParameter("subject"));
		vo.setContent(request.getParameter("content"));
		// System.out.println(vo);
		
		// MvcBoardDAO 클래스의 insert.jsp에서 입력한 데이터를 테이블에 저장하는 insert sql 명령을 실행하는
		// 메소드를 호출한다.
		dao.insert(mapper, vo);
		
		mapper.commit();
		mapper.close();
		
	}
//	컨트롤러에 list.nhn이라는 요청이 들어오면 컨트롤러에서 호출하는 메소드로 mapper를 얻어온 후 MvcboardDAO
//	클래스의 브라우저에 출력할 1페이지 분량의 글 목록과 페이징 작업에 사용할 8개의 변수가 저장된 클래스 객체를
//	만들어 request 영역에 저장하는 메소드를 호출하는 메소드
	public void selectList(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("MvcBoardService 클래스의 selectList() 메소드");
		SqlSession mapper = MySession.getSession();
		
		// list.nhn이 요청될 때 넘어오는 브라우저에 표시할 페이지 번호를 받는다.
		// 브라우저에 표시할 페이지 번호가 정상적으로 넘어왔다면 넘어온 페이지 번호로, 
		// 정상적으로 넘어오지 않았다면 1로 브라우저에 표시할 페이지 번호를 설정한다.
		int currentPage = 1;
		try {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		} catch(NumberFormatException e) {
			
			
		}
		
		// 1페이지에 표시할 글의 개수를 정한다.
		int pageSize = 10;
		// 테이블에 저장된 전체글의 개수를 얻어온다.
		int totalCount = dao.selectCount(mapper);
		// System.out.println(totalCount);
		// 1페이지 분량의 글 목록과 페이징 작업에 사용되는 8개의 변수를 초기화시키는 MvcBoardList 클래스의
		// 객체를 만든다.
		MvcBoardList boardList = new MvcBoardList(pageSize, totalCount, currentPage);
		// 1페이지 분량의 시작, 끝 인덱스를 기억하는 hashMap 객체를 만들고 초기화시킨다.
		HashMap<String, Integer> hmap = new HashMap<>();
		hmap.put("startNo", boardList.getStartNo());
		hmap.put("endNo", boardList.getEndNo());
		
		// 1페이지 분량의 글 목록을 얻어와서 MvcBoardList 클래스 객체의 ArrayList에 넣어준다.
		boardList.setList(dao.selectList(mapper, hmap));
		// System.out.println(boardList.getList());
		
		// MvcBoardList 클래스 객체를 request 영역에 저장한다.
		request.setAttribute("boardList", boardList);
		
		mapper.close();
		
		
	}
}



