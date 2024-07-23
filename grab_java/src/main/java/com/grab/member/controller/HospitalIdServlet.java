package com.grab.member.controller;
// member
import java.io.IOException;
import java.sql.Connection;
import org.json.simple.JSONObject;

import com.grab.hospital.service.HospitalService;
import com.grab.member.service.MemberService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
// member
// 아이디 찾기
@WebServlet("/HospitalIdServlet")
public class HospitalIdServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public HospitalIdServlet() {
        super();
    }

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String email = request.getParameter("email");

        MemberService service = new MemberService();
        String userId = service.hospitalIdSearch(email);

        if (userId != null) {
            request.setAttribute("userId", userId);
            request.setAttribute("email", email);
            RequestDispatcher view = request.getRequestDispatcher("/views/idSearch/hospital_id_search2.jsp");
            view.forward(request, response);
        } else {
            response.getWriter().write("<script>alert('아이디를 찾을 수 없습니다.'); location.href='index.jsp';</script>");
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doGet(request, response);
    
    }
}