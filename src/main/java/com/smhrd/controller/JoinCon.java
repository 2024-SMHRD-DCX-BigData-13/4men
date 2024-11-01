package com.smhrd.controller;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.controller.Controller;
import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;

public class JoinCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		String tel = request.getParameter("tel");
		String[] preference = request.getParameterValues("preference");

		Member member = new Member();
		member.setEmail(email);
		member.setPw(pw);
		member.setTel(tel);
		member.setPreference(preference);
		
		MemberDAO dao = new MemberDAO();
		int cnt = dao.join(member);

		if (cnt > 0) {
			System.out.println("회원가입 성공");
			return "redirect:/goJoinSuccess.do?email=" + email;
		} else {
			System.out.println("회원가입 실패");
			return "redirect:/goMain.do";
		}

	}

}
