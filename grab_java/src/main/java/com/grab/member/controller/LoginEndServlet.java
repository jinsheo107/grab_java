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

@WebServlet("/user/logout")
public class LoginEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public LoginEndServlet() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("user_id");
	      String pwd = request.getParameter("user_pw");
	      
	      Member m = new Member();
	      	      
	      m.setMember_id(id);
	      m.setMember_pw(pwd);
	      
	      Member result = new MemberService().loginUser(m);
	      
	      if(result != null) {
	         HttpSession session = request.getSession(true);
	         if(session.isNew() || session.getAttribute("member") == null) {
	            session.setAttribute("member", result);
	      }
	    }
	      
	      response.sendRedirect("/");
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}