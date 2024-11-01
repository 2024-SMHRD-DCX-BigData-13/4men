package com.smhrd.database;

import java.io.InputStream;


import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.ibatis.io.Resources;

public class FactoryManager {
	
	// 프로그램이 시작하자 마자 DBCP 생성
	private static SqlSessionFactory sqlSessionFactory;
	
	// {  } : 초기화 블럭
	//		  생성자 사용시에 실행(객체가 생성될 때 실행)
	
	// static {  } : static 초기화 블럭
	// 				 static 변수/메소드가 메모리에 등록된 직후 실행
	
	static {
		try {
			
			String resource = "com/smhrd/database/config.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			
		} catch (Exception e) {
			e.printStackTrace(); // 에러 메세지 출력
		}
	}

	public static SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}
	
	
	
}
