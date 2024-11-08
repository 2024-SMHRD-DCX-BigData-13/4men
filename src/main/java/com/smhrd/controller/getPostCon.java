package com.smhrd.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.model.Post;
import com.smhrd.model.PostDAO;

public class getPostCon implements Controller {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
        int pageSize = request.getParameter("pageSize") != null ? Integer.parseInt(request.getParameter("pageSize"))
                : 10;

        // 시작 인덱스 계산
        int startRow = (currentPage - 1) * pageSize;

        // postType 파라미터 가져오기
        String post_type = request.getParameter("post_type");
        if (post_type == null) {
            post_type = "tip";  // 기본값 설정 (팁)
        }

        // DAO를 통해 해당 페이지의 게시글 가져오기
        PostDAO postDAO = new PostDAO();
        List<Post> posts = postDAO.getPosts(post_type, startRow, pageSize);

        // 총 게시글 수 가져오기
        int totalPosts = postDAO.getTotalPostCount(post_type);
        int totalPages = (int) Math.ceil((double) totalPosts / pageSize);

        // JSON 데이터로 응답하기 위해 Map에 데이터 설정
        Map<String, Object> result = new HashMap<>();
        result.put("posts", posts);
        result.put("totalPages", totalPages);
        // Gson을 사용하여 JSON 응답 생성
        Gson gson = new Gson();
        String jsonResponse = gson.toJson(result);

        // 응답 설정 및 전송
        response.setContentType("application/json; charset=UTF-8");
        response.getWriter().write(jsonResponse);
        return null; // 이 경우 뷰로 이동하지 않고 JSON 응답만 보냅니다.
    }
}
