package com.grab.member.controller.memberLogin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.grab.member.service.MemberService;
import com.grab.member.vo.Member;


@WebServlet(name="memberCreateEnd",urlPatterns="/member/createEnd")
public class CreateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public CreateEndServlet() {
		super();

	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("member_id");
		String pw = request.getParameter("member_pw");
		String pwConfirm = request.getParameter("member_pw_confirm");
		String email = request.getParameter("member_email");

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		// 비밀번호 확인 일치 체크
		if (!pw.equals(pwConfirm)) {
			response.setContentType("text/html;charset=UTF-8");
			out.println("<html><body>");
			out.println("<script>alert('비밀번호가 일치하지 않습니다.'); location.href='/views/member/memberLogin/member_create.jsp';</script>");
			out.println("</body></html>");
			return;
		}

		Member m = new Member();

		m.setMember_id(id);
		m.setMember_pw(pw);  // 비밀번호는 반드시 암호화
		m.setMember_email(email);
		m.setMember_type(2);

		int result = new MemberService().createMember(m); 

		//		RequestDispatcher view
		//		= request.getRequestDispatcher("/views/memberLoginPage/memberLogin/member_create_fail.jsp");

		if(result > 0) {
			System.out.println("회원가입 성공");
			response.sendRedirect("/");
		}else {
			System.out.println("회원가입 실패");
			out.println("<html><body>");
			out.println("<script>alert('회원가입에 실패하였습니다.')</script>");
			out.println("</body></html>");
			response.sendRedirect("/");
		}
	}




	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
