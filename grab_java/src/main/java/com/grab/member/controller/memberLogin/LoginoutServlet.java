package com.grab.member.controller.memberLogin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/member/logout")
public class LoginoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public LoginoutServlet() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그아웃 기능 구현
				HttpSession session = request.getSession(false);
				if(session != null && session.getAttribute("member") != null) {
					session.removeAttribute("member");
					session.invalidate();
				}
				response.sendRedirect("/");
			}


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
