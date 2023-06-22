package com.tjoeun.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.tjoeun.vo.MvcBoardVO;

public class MvcBoardDAO {
	private static MvcBoardDAO instance = new  MvcBoardDAO();
	private MvcBoardDAO() {}
	public static MvcBoardDAO getInstance() {
		return instance;
	}

//	MvcBoardService 클래스에서 호출되는 mapper와 테이블에 저장할 메인글 정보가 저장된 객체를 넘겨받고 메인글을
//	테이블에 저장하는 mvcboard.xml 파일의 insert sql을 실행하는 메소드	
	public void insert(SqlSession mapper, MvcBoardVO vo) {
		System.out.println("MvcBoardDAO 클래스의 insert() 메소드");
		mapper.insert("insert", vo);
	}
	
	
//	MvcBoardService 클래스에서 호출되는 mapper를 넘겨받고 테이블에 저장된 전체글의 개수를 얻어오는
//  mvcboard.xml 파일의 select sql을 실행하는 메소드	
	public int selectCount(SqlSession mapper) {
		System.out.println("MvcBoardDAO 클래스의 selectCount() 메소드");
		return (int) mapper.selectOne("selectCount");
	}
	
//	MvcBoardService 클래스에서 호출되는 mapper와 1페이지 분량의 시작, 끝 인덱스가 저장된 HashMap 객체를 넘겨받고 
//	1페이지 분량의 글 목록을 얻어오는 mvcboard.xml 파일의 select sql 명령을 실행하는 메소드	
	public ArrayList<MvcBoardVO> selectList(SqlSession mapper, HashMap<String, Integer> hmap) {
		return (ArrayList<MvcBoardVO>) mapper.selectList("selectList", hmap);
	}
	
	
	
	
	
}
