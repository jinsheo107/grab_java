package com.grab.aLogin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.grab.aLogin.service.MemberService;
import com.grab.aLogin.vo.Member;


@WebServlet(name="adminLoginEnd", urlPatterns = "/admin/loginEnd")
public class AdminLoginEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminLoginEndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("admin_id");
		String pw = request.getParameter("admin_pw");
		
		Member admin = new MemberService().loginMember(id, pw);
		
		if(admin != null) {
			HttpSession session = request.getSession(true);
			if(session.isNew() || session.getAttribute("member") == null){
				session.setAttribute("member", admin);
				session.setMaxInactiveInterval(60 * 60 * 12); // 12시간
			}
			response.sendRedirect("/views/aMain.jsp");
		}else {
			RequestDispatcher view = request.getRequestDispatcher("/views/aMain.jsp");
			view.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
