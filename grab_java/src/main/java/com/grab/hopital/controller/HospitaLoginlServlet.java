package com.grab.hopital.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.grab.hopital.dao.HospitalDao;
import com.grab.hopital.vo.Hospital;

@WebServlet("/Hospital_login")
public class HospitaLoginlServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public HospitaLoginlServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("user-id");
        String password = request.getParameter("user-password");

        HospitalDao dao = new HospitalDao();
        Hospital hospital = dao.login(userId, password);

        if (hospital != null) {
            HttpSession session = request.getSession();
            session.setAttribute("hospital", hospital);
            response.sendRedirect("index.jsp");
        } else {
            request.setAttribute("loginError", "로그인에 실패하였습니다. 아이디와 비밀번호를 확인하세요.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        }
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
