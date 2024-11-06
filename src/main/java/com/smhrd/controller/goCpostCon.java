package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.Member;

public class goCpostCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// session 데이터 받아오기
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		if (member != null) {
			// 사용자 정보가 세션에 존재하는 경우 - 로그 확인용
			System.out.println("회원확인: " + member.toString());

			// 게시물 작성 시 필요한 추가 작업을 여기에 작성

			// JSP로 데이터를 전달하기 위해 request에 설정할 수도 있습니다.
			request.setAttribute("member", member);

			// 게시물 작성 페이지로 이동
			return "Cpost";
		} else {
			// 로그인 상태가 아닐 경우 - 예: 로그인 페이지로 이동
			System.out.println("User not logged in.");
			return "login"; // 로그인 페이지로 이동
		}
	}

}
