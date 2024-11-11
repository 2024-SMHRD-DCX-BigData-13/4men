package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.smhrd.model.PostDAO;

public class IncreaseViewCountCon implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String postId = request.getParameter("postId");
        System.out.println("Received postId: " + postId); // 디버깅 로그

        if (postId != null) {
            try {
                int parsedPostId = Integer.parseInt(postId);
                PostDAO dao = new PostDAO();
                boolean result = dao.increaseViewCount(parsedPostId);

                if (result) {
                    response.setStatus(HttpServletResponse.SC_OK);
                } else {
                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                }
            } catch (NumberFormatException e) {
                System.err.println("Invalid postId format: " + postId);
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            }
        } else {
            System.err.println("postId is null or empty");
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }

        return null; // AJAX 요청이므로 반환할 페이지 없음
    }
}