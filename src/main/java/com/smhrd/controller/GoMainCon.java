package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GoMainCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 일이 다 끝나면, 다음 페이지가 어디인지 리턴을 해줘야 함
		return "main";
		
		
	}

}
