package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;

public class CheckCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 1. 데이터 수집
		request.setCharacterEncoding("UTF-8");
		String email = request.getParameter("email");
		
		// 2. 기능 실행
		
		MemberDAO dao = new MemberDAO();
		
		Member member = dao.check(email);
		
		
		// 3. 데이터 응답
		response.setContentType("text/html ; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(member == null) {
			out.print("true");
		}else {
			out.print("false");
		}
		
		return null;
	}

}
