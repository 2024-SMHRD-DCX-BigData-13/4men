package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;

public class LoginCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("user_id2");
		String pw = request.getParameter("password2");

		Member member = new Member();
		member.setId(id);
		member.setPw(pw);

		MemberDAO dao = new MemberDAO();
		Member result = dao.login(member);

		if (result != null) {
			System.out.println("로그인 성공");
			HttpSession session = request.getSession();
			session.setAttribute("member", result);

			return "redirect:/goMain.do";
		} else {
			System.out.println("로그인 실패");
			return "redirect:/goLogin.do";
		}

	}

}
