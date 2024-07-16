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

@WebServlet(name="memberLoginEnd", urlPatterns="/member/loginEnd")
public class MemberLoginEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberLoginEndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = "jinseo107";
		String pw = "1234";
		
		Member m = new MemberService().loginMember(id, pw);
		
		if(m != null) {
			HttpSession session = request.getSession(true);
			
			if(session.isNew() || session.getAttribute("member") == null) {
				session.setAttribute("member", m);
				session.setMaxInactiveInterval(60 * 60 * 12);
			}
			
			response.sendRedirect("/");
		} else {
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
