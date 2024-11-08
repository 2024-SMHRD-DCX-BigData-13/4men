package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.FactoryManager;

public class PostDAO {

	private SqlSessionFactory factory = FactoryManager.getSqlSessionFactory();

	public List<Post> getPosts (){
		SqlSession session = factory.openSession(true);
		List<Post> list = session.selectList("getPosts");
		session.close();
		
		return list;
	}

}
