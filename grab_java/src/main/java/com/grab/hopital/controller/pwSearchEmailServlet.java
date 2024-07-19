package com.grab.hopital.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/pwSearchEmailServlet")
public class pwSearchEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public pwSearchEmailServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("hospital_email");
        String name = request.getParameter("member_name");

        // 인증번호 생성
        String authCode = generateAuthCode();

        // 이메일 전송 로직
        boolean emailSent = sendEmail(email, authCode);

        if (emailSent) {
            request.getSession().setAttribute("authCode", authCode);
            response.getWriter().write("{\"success\": true}");
        } else {
            response.getWriter().write("{\"success\": false}");
        }
    }

    private String generateAuthCode() {
        return String.valueOf((int) (Math.random() * 1000000));
    }

    private boolean sendEmail(String email, String authCode) {
        // 이메일 전송 로직 
        return true; 
   }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
