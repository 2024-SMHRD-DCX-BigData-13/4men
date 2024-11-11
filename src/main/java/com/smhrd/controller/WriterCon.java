package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.Post;
import com.smhrd.model.PostDAO;

public class WriterCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String post_type = request.getParameter("post_type");
		String post_title = request.getParameter("post_title");
		String post_content = request.getParameter("post_content");
		String post_file = request.getParameter("post_file");
		String id = request.getParameter("id");
		System.out.println(post_type);
		
		Post post = new Post();
		post.setPost_type(post_type);
		post.setPost_title(post_title);
		post.setPost_content(post_content);
		post.setPost_file(post_file);
		post.setId(id);
		
		PostDAO dao = new PostDAO();
		int cnt = dao.insert(post);
		
		if(cnt > 0) {
			request.setAttribute("successMsg", "게시물 작성 성공!");
			request.setAttribute("showFreeBoard", true);
			    return "main"; 
		}else {
			request.setAttribute("errorMsg", "게시물 작성에 실패했습니다 다시 시도 해주세요.");
			
			return "writer";
		}
		
		
	}

}
