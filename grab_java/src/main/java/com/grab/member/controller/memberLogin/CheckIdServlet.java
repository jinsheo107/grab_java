package com.grab.member.controller.memberLogin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.grab.member.service.MemberService;
import com.grab.member.vo.Member;


@WebServlet(name="CheckId" , urlPatterns = "/checkId")
public class CheckIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public CheckIdServlet() {
		super();

	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("member_Id");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		


		 Member u = new MemberService().selectById(id);
		
	        try {
	            if (u == null) {
	                out.print("available");
	            } else {
	                out.print("unavailable");
	            }
	        
	        } catch (Exception e) {
	            e.printStackTrace();
	            out.print("error");
	        }
	     
		}
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
