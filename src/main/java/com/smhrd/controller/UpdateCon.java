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

		String id = request.getParameter("user_id");
		String pw = request.getParameter("password");
		String name = request.getParameter("name");
		String birthdate = request.getParameter("birth_date");
		String gender = request.getParameter("gender");
		String phone = request.getParameter("phone_number");

		Member member = new Member(id, pw, name, birthdate, gender, phone, null, null);

		MemberDAO dao = new MemberDAO();

		dao.update(member);

		return "redirect:/goMain.do";
	}

}
