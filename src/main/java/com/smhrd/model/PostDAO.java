package com.smhrd.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.FactoryManager;

public class PostDAO {

	private SqlSessionFactory factory = FactoryManager.getSqlSessionFactory();

	public List<Post> getPosts(String post_type, int startRow, int pageSize) {
		SqlSession session = factory.openSession(true);

		// 파라미터로 사용할 Map 생성
		Map<String, Object> params = new HashMap<>();
		params.put("post_type", post_type);
		params.put("startRow", startRow);
		params.put("pageSize", pageSize);

		List<Post> list = session.selectList("getPosts", params);
		session.close();

		return list;
	}

	public int getTotalPostCount(String post_type) {
		SqlSession session = factory.openSession(true);

		// 파라미터로 사용할 Map 생성
		Map<String, Object> params = new HashMap<>();
		params.put("post_type", post_type);

		int totalCount = session.selectOne("getTotalPostCount", params);
		session.close();

		return totalCount;
	}
	
	public int insert(Post post) {
		SqlSession session = factory.openSession(true);
		
		int cnt = session.insert("insert" , post);
		
		session.close();
		
		return cnt;
	}
	
	public List<Post> search(String text){
		SqlSession session = factory.openSession(true);
		
		List<Post> list = session.selectList("search" , "%"+text+"%");
		
		session.close();
		
		return list;
	}

	public boolean increaseViewCount(int postId) {
	    try (SqlSession session = factory.openSession(true)) { 
	        int result = session.update("increaseViewCount", postId);
	        return result > 0; 
	    }
	}
}
