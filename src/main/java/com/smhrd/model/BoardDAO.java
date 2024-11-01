package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.FactoryManager;

public class BoardDAO {

	private SqlSessionFactory factory = FactoryManager.getSqlSessionFactory();

	// ** xml에 정의된걸 보고 메소드의 리턴타입, 매개변수를 바로 적는 연습해두기
	// 1. 게시글 작성하기
	public int write(Board board) {

		// 1)
		SqlSession session = factory.openSession(true);
		// 2)
		int cnt = session.insert("write", board);
		// 3)
		session.close();
		// 4)
		return cnt;

	}

	// 2. 게시글 전체 조회하기
	public List<Board> list() {

		// 1)
		SqlSession session = factory.openSession(true);
		// 2)
		List<Board> list = session.selectList("list");
		// 3)
		session.close();
		// 4)
		return list;
	}

	// 3. 게시글 하나만 조회하기
	public Board view(int num) {

		// 1)
		SqlSession session = factory.openSession(true);
		// 2)
		Board board = session.selectOne("view", num);
		// 3)
		session.close();
		// 4)
		return board;
	}
	// 4. 게시글 검색하기
	public List<Board> search(String text) {
		
		SqlSession session = factory.openSession(true);
		
		List<Board> list = session.selectList("search" , "%"+text+"%");
		
		session.close();
		
		return list;
		
	}

}
