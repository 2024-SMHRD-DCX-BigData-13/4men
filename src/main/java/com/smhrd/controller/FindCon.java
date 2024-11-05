package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.smhrd.model.Member;
import com.smhrd.model.MemberDAO;

public class FindCon implements Controller {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. 데이터 수집
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String phone_number = request.getParameter("phone_number");

        // 3. 데이터 응답 준비
        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            // 2. 기능 실행
            MemberDAO dao = new MemberDAO();
            Member member = dao.find(name, birthday, phone_number);

            if (member == null) {
                // 조회 결과가 없거나 null인 경우에 대한 응답
                out.print("{\"result\": false, \"message\": \"해당 정보를 가진 회원을 찾을 수 없습니다.\"}");
            } else {
                // 조회 결과가 있는 경우 응답
                String userId = member.getId();
                out.print("{\"result\": true, \"user_id\": \"" + userId + "\"}");
            }
        } catch (Exception e) {
            // 예외 발생 시 로그에 기록하고 클라이언트에 오류 응답 반환
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print("{\"result\": false, \"message\": \"서버 오류가 발생했습니다. 다시 시도해 주세요.\"}");
        }

        return null;
    }
}
