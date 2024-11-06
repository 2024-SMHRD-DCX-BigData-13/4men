package com.smhrd.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;

// Servlet 개수 증가 --> 서버 부하 증가 >> Servlet을 1개만 쓰자
// FrontController 디자인 패턴
// 		: 사용자의 모든 요청을 하나의 Servlet에서 처리

@WebServlet("*.do") // .do 로 끝나는 모든 요청을 이 Servlet이 받도록 함
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// HashMap 자료구조 (dict 와 유사)
	// Key - Value 형태로 저장
	// Key, Value의 자료형이 고정되어있다.
	// 자바의 자료구조 중 검색속도가 가장 빠름

	// < > 제네릭 : 자료형을 정해 놓지 않음
	// 객체를 생성할 때 자료형을 결정 >> 유연함 부여
	// K : key 값의 자료형을 무엇으로 할 것인가
	// V : 어떤 값을 저장할 것인가
	private HashMap<String, Controller> handlerMapping;

	@Override
	public void init() throws ServletException {
		// Servlet이 메모리에 등록이 될 때 실행이 되는 메소드
		// >> 단 1번만 실행
		
		// 비어있는 HashMap 생성
		handlerMapping = new HashMap<String, Controller>();

		// mapping - POJO 저장
		
		handlerMapping.put("/goUpdate.do", new GoUpdateCon());
		
		handlerMapping.put("/update.do", new UpdateCon());
		
		handlerMapping.put("/goSelect.do", new GoSelectCon());
		
		handlerMapping.put("/delete.do", new DeleteCon());
		
		// ==============================================================
		handlerMapping.put("/goLogout.do", new GoLogoutCon());
		
		handlerMapping.put("/logout.do", new LogoutCon());

		handlerMapping.put("/goLogin.do", new GoLoginCon());

		handlerMapping.put("/join.do", new JoinCon());
		
		handlerMapping.put("/goMain.do", new GoMainCon());
		
		handlerMapping.put("/login.do", new LoginCon());
		
		handlerMapping.put("/find.do", new FindCon());
		
		handlerMapping.put("/search.do", new SearchCon());
		
		handlerMapping.put("/goFindId.do", new goFindIdCon());

		handlerMapping.put("/check.do", new CheckCon());
		
		handlerMapping.put("/goMyPage.do", new goMyPage());
		
		handlerMapping.put("/goCpost.do", new goCpostCon());
		

	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. URLMapping을 분리
		// http://localhost:8081/Ex08/login.do

		String uri = request.getRequestURI();
		// http://localhost:8081/Ex08

		String cpath = request.getContextPath();
		// /login.do
		String mapping = uri.substring(cpath.length());
		System.out.println(mapping);


		// ==============================================================

		// 2. URLMapping에 따라 다른 일을 처리

		String nextPage = null;

		Controller con = handlerMapping.get(mapping);

		if (con != null) {
			nextPage = con.execute(request, response);
		}

		// ==============================================================

		// 3. 페이지 이동
		// *** redirect 하고 싶은 경우에는 URLMapping 앞에 "redirect:/"를 붙이자 ***
		if (nextPage != null) {
			if (!nextPage.contains("redirect:/")) {

				RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/views/" + nextPage + ".jsp");

				rd.forward(request, response);

			} else {
				response.sendRedirect(nextPage.replace("redirect:/", ""));
			}
		}

	}

}
