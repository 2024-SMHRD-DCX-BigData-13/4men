package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.Board;
import com.smhrd.model.BoardDAO;

public class GoViewBoardCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 1. 데이터 수집
		request.setCharacterEncoding("UTF-8");
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		// 2. 기능 실행
		// >> num이 일치하는 게시글 조회
		BoardDAO dao = new BoardDAO();
		
		Board board = dao.view(num);
		
		request.setAttribute("board", board);
		
		// 3. View 선택
		return "viewBoard";
	}

}
