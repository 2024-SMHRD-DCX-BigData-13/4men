package com.smhrd.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.Member;
import com.smhrd.model.Post;
import com.smhrd.model.PostDAO;

public class GoMainCon implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");

		if (member != null) {
			request.setAttribute("member", member);

			int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
			int pageSize = 10;

			int startRow = (currentPage - 1) * pageSize;

			String post_type = request.getParameter("post_type");
			if (post_type == null) {
				post_type = "tip";
			}

			PostDAO postDAO = new PostDAO();
			List<Post> posts = postDAO.getPosts(post_type, startRow, pageSize);

			if (posts == null) {
				posts = new ArrayList<>();
			}

			int totalPosts = postDAO.getTotalPostCount(post_type);
			int totalPages = (int) Math.ceil((double) totalPosts / pageSize);

			request.setAttribute("posts", posts);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("totalPages", totalPages);
			request.setAttribute("post_type", post_type);
			
			return "main";
		} else {

			return "login";
		}
	}
}
