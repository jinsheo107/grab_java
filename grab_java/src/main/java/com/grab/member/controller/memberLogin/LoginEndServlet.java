package com.grab.member.controller.memberLogin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.grab.member_detail.service.MemberService;
import com.grab.member_detail.vo.Member;

@WebServlet(name="memberLoginEnd", urlPatterns="/member/loginEnd")
public class LoginEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public LoginEndServlet() {
        super();
      
    }
	

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("member_id");
        String pw = request.getParameter("member_pw");

        Member m = new MemberService().loginMember(id, pw);
        
        if (m != null) {
        	
        	if(m.getMember_type() == 2) {
        		HttpSession session = request.getSession(true);
        		if (session.isNew() || session.getAttribute("member") == null) {
        			session.setAttribute("member", m);
        			session.setMaxInactiveInterval(60*30);
        		}
        		response.setContentType("text/html; charset=UTF-8");
        		response.getWriter().println("<script>alert('로그인에 성공하였습니다.'); location.href='" + request.getContextPath() + "/';</script>");        		
        	} else if(m.getMember_type() == 3) {
        		response.setContentType("text/html; charset=UTF-8");
        		response.getWriter().println("<script>alert('병원회원은 병원회원 로그인 페이지에서 로그인해야합니다.'); location.href='" + request.getContextPath() + "/';</script>");
        	} else {
        		response.setContentType("text/html; charset=UTF-8");
        		response.getWriter().println("<script>alert('관리자는 관리자 페이지에서 로그인해야 합니다.'); location.href='" + request.getContextPath() + "/';</script>");
        	}
        } else {
            response.setContentType("text/html; charset=UTF-8");
            response.getWriter().println("<script>alert('로그인에 실패하였습니다. 아이디나 비밀번호를 확인해 주세요.'); location.href='" + request.getContextPath() + "/views/member/memberLogin/login.jsp';</script>");
        }
    }






	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
