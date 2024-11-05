package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.FactoryManager;

public class MemberDAO {
	// DAO (Data Access Object)
	// 데이터베이스와 상호작용하는 기능을 구현한 객체
	// >> 메소드 형태로 구현

	// 기존 jdbc의 문제점
	// 1. 복잡한 코드
	// 2. 양식이 모두가 다르다. >> 협업 힘들어짐
	// 3. **요청시마다 새로운 연결이 생성
	// >> Mybatis 프레임워크

	// Connection Pool (Datasource)
	// 연결을 미리 정해진 갯수 만큼만 해두자
	// 기능을 실행할 때 빌려가고 반납을 받자
	// >> 정해진 갯수만큼만 동시에 실행 / 초과는 대기열

	// MyBatis
	// Java(class) 와 Xml 파일을 동시에 사용
	// sql문을 xml에 작성 --> java 코드 실행

	// sqlSessionFactory 받아오기 *필수작업*
	private SqlSessionFactory factory = FactoryManager.getSqlSessionFactory();

	// 1. 회원가입 메소드
	public int join(Member member) {
		// 1) 연결객체 빌려오기
		// auto commit 사용여부 넣어주기 boolean타입
		SqlSession session = factory.openSession(true);

		// 2) 준비된 SQL문을 실행
		// 메소드 명 == 실행하고자 하는 sql문의 키워드
		// 단, select문 제외
		// 매개변수 1개 : "id"
		// 매개변수 2개 : "id"
		// insert/delete/update : int (몇 행 수정)
		int cnt = session.insert("join", member);

		// 3) 연결 객체 반납
		session.close();

		// 4) SQL문의 실행 결과 리턴
		return cnt;

	}

	public Member login(Member member) { // email, pw
		// 1) 연결 객체 빌려오기
		SqlSession session = factory.openSession(true);

		// 2) Sql문 실행
		// selectOne : 조회 결과가 하나일 때
		// 결과가 resultType 그대로(DTO)
		// selectList : 조회 결과가 여러개일 때(DTO의 ArrayList)
		//
		Member result = session.selectOne("login", member);
		// 3) 연결 객체 반납

		System.out.println("-------------------");
		session.close();
		// 4) Sql문 실행 결과 리턴
		return result;

	}

	public int update(Member member) {

		SqlSession session = factory.openSession(true);
		int cnt = session.update("update", member);
		session.close();

		return cnt;
	}
	
	public List<Member> select() {
		
		SqlSession session = factory.openSession(true);
		List<Member> list = session.selectList("select");
		session.close();
		
		return list;
		
	}
	
	public Member check(String user_id) {
	    // 1. user_id가 null이거나 비어있는 경우 처리
	    if (user_id == null || user_id.trim().isEmpty()) {
	        // 유효하지 않은 user_id 처리
	        return null;
	    }

	    // 2. SQL 세션 생성 및 조회
	    SqlSession session = factory.openSession(true);
	    Member member = null;
	    try {
	        member = session.selectOne("check", user_id);
	    } catch (Exception e) {
	        e.printStackTrace(); // 오류 로그를 출력하여 디버깅
	    } finally {
	        session.close(); // 세션을 닫음
	    }

	    return member;
	}

	public Member find (String name, String birthdate, String phone_number) {
		SqlSession session = factory.openSession(true);
		Member para = new Member();
		para.setName(name);
		para.setBirthdate(birthdate);
		para.setPhone(phone_number);
		Member member = session.selectOne("find",para);
		session.close();
		
		return member;
	}

	
	
}
