package com.grab.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.grab.member.service.MemberService;
import com.grab.member.vo.Member;
// member
// 회원탈퇴
@WebServlet("/deleteHospitalUserServlet")
public class deleteHospitalUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public deleteHospitalUserServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher view = request.getRequestDispatcher("/views/hospital/hospital_request.jsp");
        view.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String memberId = request.getParameter("member_id");
        String memberPw = request.getParameter("member_pw");
        String memberEmail = request.getParameter("member_email");

        Member member = new Member();
        MemberService service = new MemberService();
        int result = service.deleteHospitalMember(member);

        if (result > 0) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('회원 탈퇴가 완료 되었습니다.'); location.href='/index.jsp';</script>");
            out.close();
        } else {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('회원 탈퇴에 실패했습니다.'); history.back();</script>");
            out.close();
        }
    }
}
