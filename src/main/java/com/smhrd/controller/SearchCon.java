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

public class SearchCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. 데이터 수집
		request.setCharacterEncoding("UTF-8");
		
		String text = request.getParameter("text");
		
		
		
		// 2. 기능 실행
		// >> 텍스트를 포함하는 제목을 가지는 게시글만 조회
		BoardDAO dao = new BoardDAO();
		List<Board> list = dao.search(text);
		
		
		// 3. 데이터 응답
		// json (JavaScript Object Notation)
		// javascript의 객체 형식으로 작성된 데이터 저장 양식
		// [{key : value}, {}, {}.....]
		// 용량이 적음, 가시성이 높음, 호환성 매우 높음
		
		// JSON <--> Java Object 변환에 쓰이는 라이브러리
		Gson gson = new Gson();
		// ex) Java Object -> JSON
		String json = gson.toJson(list);
		
		// ex) JSON --> Java Object
		// gson.fromJson("json" , 클래스 정보);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		out.print(json);
		
//		String json = "[";
//		for(Board board : list)	{
//			json += "{"	;
//			json += "\"title\" : \"" + board.getTitle() + "\"";	
//			json += "\"title\" : \"" + board.getWriter() + "\"";	
//			json += "\"title\" : \"" + board.getB_date() + "\"";				
//			json += "},";
//			
//		}
//		
//		json+= "]";
//		
//		json.replace(", ]", "]");
		
		
		
		
		
		return null;
	}

}
