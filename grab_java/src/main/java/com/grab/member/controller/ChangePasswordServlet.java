package com.grab.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.grab.member.service.MemberService;
import com.grab.member.vo.Member;


@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public ChangePasswordServlet() {
        super();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String memberId = request.getSession().getAttribute("loggedInMemberId").toString();
        String currentPassword = request.getParameter("current-password");
        String newPassword = request.getParameter("new-password");
        MemberService memberService = new MemberService();
        Member member = memberService.getMemberById(memberId);
        if (member.getMember_pw().equals(currentPassword)) {
            if (currentPassword.equals(newPassword)) {
                request.setAttribute("error", "새 비밀번호는 현재 비밀번호와 다르게 설정해 주세요.");
                RequestDispatcher view = request.getRequestDispatcher("/hospital_mypage_pw_change2.jsp");
                view.forward(request, response);
            } else {
                member.setMember_pw(newPassword);
                int result = memberService.changePassword(member);
                if (result > 0) {
                    response.sendRedirect("hospital_mypage.jsp");
                } else {
                    request.setAttribute("error", "비밀번호 변경에 실패했습니다.");
                    RequestDispatcher view = request.getRequestDispatcher("/hospital_mypage_pw_change2.jsp");
                    view.forward(request, response);
                }
            }
        } else {
            request.setAttribute("error", "현재 비밀번호가 올바르지 않습니다.");
            RequestDispatcher view = request.getRequestDispatcher("/hospital_mypage_pw_change1.jsp");
            view.forward(request, response);
        }
    }
}
