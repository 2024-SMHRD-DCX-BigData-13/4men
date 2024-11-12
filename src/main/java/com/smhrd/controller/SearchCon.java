package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.model.Board;
import com.smhrd.model.BoardDAO;
import com.smhrd.model.Post;
import com.smhrd.model.PostDAO;

public class SearchCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		  request.setCharacterEncoding("UTF-8");
	        String text = request.getParameter("text"); 
	        PostDAO dao = new PostDAO();
	        List<Post> list = dao.search(text); 

	        Gson gson = new Gson();
	        String json = gson.toJson(list); 

	        response.setContentType("application/json; charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        out.print(json); 
	        out.close();

	        return null;
	}

}
