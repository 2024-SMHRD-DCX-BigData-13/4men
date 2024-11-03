package com.smhrd.controller;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;

public class JoinCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("JoinCon 실행"); // 확인용 로그

		request.setCharacterEncoding("UTF-8");
		
		String user_id = request.getParameter("user_id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String birthday = request.getParameter("birthday");
		String gender = request.getParameter("gender");
		String phone_number = request.getParameter("phone_number");

		Member member = new Member();
		member.setUser_id(user_id);
		member.setPassword(password);
		member.setName(name);
		member.setBirthday(birthday);
		member.setGender(gender);
		member.setPhone_number(phone_number);
		
	
		
		MemberDAO dao = new MemberDAO();
		int cnt = dao.join(member);
		
		response.setContentType("application/json ; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if (cnt > 0) {
			out.print("true");
		} else {
			out.print("false");
		}
		return null;
	}

}
