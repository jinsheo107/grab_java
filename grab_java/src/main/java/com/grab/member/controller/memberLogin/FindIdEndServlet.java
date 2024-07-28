package com.grab.member.controller.memberLogin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.grab.member.service.MemberService;
import com.grab.member.vo.Member;


@WebServlet(name="memberFindIdEnd" , urlPatterns = "/FindIdEnd")
public class FindIdEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public FindIdEndServlet() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
				request.setCharacterEncoding("utf-8");
			
				String email = request.getParameter("email");

				MemberService service = new MemberService();
				Member m = service.searchId(email);
				

				if(m != null) {
					RequestDispatcher rd = request.getRequestDispatcher("/views/member/memberFind/find_id_2.jsp");
					request.setAttribute("member", m);
					rd.forward(request, response);
					
				}else {
					request.setAttribute("msg", "정확한 정보를 입력해 주세요!");
					request.setAttribute("loc", "/");
					RequestDispatcher rd = request.getRequestDispatcher("/views/member/memberFind/find_id_fail.jsp");
					rd.forward(request, response);
				}
				
			}


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
