package com.grab.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.grab.member.service.MemberService;
import com.grab.member.vo.Member;
//member
// 비밀번호 찾기
@WebServlet("/checkMemberPwServlet")
public class FindPasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public FindPasswordServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");

        MemberService service = new MemberService();
        Member member = service.findMemberByNameAndEmail(name, email);

        if (member != null) {
            request.setAttribute("member", member);
            RequestDispatcher view = request.getRequestDispatcher("/views/pwSearch/hospital_pw_search2.jsp");
            view.forward(request, response);
        } else {
            response.getWriter().write("<script>alert('존재하지 않는 사용자입니다.'); location.href='/views/pwSearch/hospital_pw_search1.jsp';</script>");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
