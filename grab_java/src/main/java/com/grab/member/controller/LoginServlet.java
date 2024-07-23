package com.grab.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.grab.member.service.MemberService;
import com.grab.member.vo.Member;

@WebServlet("/Hospital login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("/views/login.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("user_id");
        String userPw = request.getParameter("user_pw");

        MemberService service = new MemberService();
        Member member = service.login(userId, userPw);

        if (member != null) {
            HttpSession session = request.getSession();
            session.setAttribute("member", member);

            response.sendRedirect("/views/index.jsp");
        } else {
            response.sendRedirect("/views/login_failed.jsp");
        }
    }
}
