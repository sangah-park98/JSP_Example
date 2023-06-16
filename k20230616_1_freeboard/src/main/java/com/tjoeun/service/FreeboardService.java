package com.tjoeun.service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.tjoeun.dao.FreeboardDAO;
import com.tjoeun.mybatis.MySession;
import com.tjoeun.vo.FreeboardList;
import com.tjoeun.vo.FreeboardVO;

public class FreeboardService {

	private static FreeboardService instance = new FreeboardService();
	public FreeboardService() {}
	public static FreeboardService getInstance() {
		return instance;
	}

//	insertOK.jsp에서 호출되는 메인글이 저장된 객체를 넘겨받고 mapper를 얻어온 후 메인글을 저장하는
//	FreeboardDAO 클래스의 insert sql 명령을 실행하는 메소드를 호출하는 메소드	
	public void insert(FreeboardVO vo) {
		System.out.println("FreeboardService의 insert()");
	    SqlSession mapper = MySession.getSession();
	    // System.out.println(mapper);  
	    FreeboardDAO.getInstance().insert(mapper, vo);
	    
	    mapper.commit();
	    mapper.close();
	   }
	
//	list.jsp에서 호출되는 브라우저에 출력할 페이지 번호를 넘겨받고 mapper를 얻어온 후, 1페이지 분량의 메인글 목록을
//	얻어오는 FreeboardDAO 클래스의 select sql 명령을 실행하는 메소드를 호출하는 메소드	
	public FreeboardList selectList(int currentPage) {
		System.out.println("FreeboardService의 selectList()");
		SqlSession mapper = MySession.getSession();
		FreeboardDAO dao = FreeboardDAO.getInstance();
		
		int pageSize = 10;
		int totalCount = dao.selectCount(mapper);
		// System.out.println(totalCount);
		
		FreeboardList freeboardList = new FreeboardList(pageSize, totalCount, currentPage);
		HashMap<String, Integer> hmap = new HashMap<>();
		hmap.put("startNo", freeboardList.getStartNo());
		hmap.put("endNo", freeboardList.getEndNo());
		freeboardList.setList(dao.selectList(mapper, hmap));
		
		// System.out.println(freeboardList);
		mapper.close();
		return freeboardList;
	}
	
	
	
}
