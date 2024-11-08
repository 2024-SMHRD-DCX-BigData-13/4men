package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;

public class UpdateCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String birthdate = request.getParameter("birthdate");
		String gender = request.getParameter("gender");
		String phone = request.getParameter("phone");

		Member member = new Member(id, pw, name, birthdate, gender, phone, null, null);

		MemberDAO dao = new MemberDAO();

		int cnt = dao.update(member);


		if (cnt > 0) {
			System.out.println("O");
			Member members = dao.select(id);
			request.getSession().setAttribute("member", members);
			return "main";
		} else {
			System.out.println("X");
			return "myPage";
		}
	}

}
