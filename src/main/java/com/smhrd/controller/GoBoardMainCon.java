package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.Board;
import com.smhrd.model.BoardDAO;

public class GoBoardMainCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 1. 데이터 수집
		
		// 2. 기능 실행
		// >> DB에서 전체 게시글 조회
		BoardDAO dao = new BoardDAO();
		
		List<Board> list = dao.list();
		
		request.setAttribute("list", list);
		// 3. View 선택
		
		return "boardMain";
	}

}
