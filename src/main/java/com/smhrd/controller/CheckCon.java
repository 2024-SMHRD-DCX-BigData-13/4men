package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

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
		String name = request.getParameter("name");
		String birthday = request.getParameter("birthday");
		String phone_number = request.getParameter("phone_number");

		// 2. 기능 실행
		MemberDAO dao = new MemberDAO();
		List<Member> members = dao.find(name, birthday, phone_number);

		// 3. 데이터 응답
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();

		if (members == null) {
			out.print("{\"result\": false}");
		} else {	
			String userId = members.get(0).getUser_id();
			out.print("{\"result\": true, \"user_id\": \"" + userId + "\"}");
			
		}
		return null;
	}

}
