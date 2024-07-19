package com.grab.hopital.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/pwSearchEmailVerifyAuthServlet")
public class pwSearchEmailVerifyAuthServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public pwSearchEmailVerifyAuthServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String inputAuthCode = request.getParameter("authCode");
        String sessionAuthCode = (String) request.getSession().getAttribute("authCode");

        boolean isValid = inputAuthCode.equals(sessionAuthCode);
        response.getWriter().write("{\"valid\": " + isValid + "}");
    
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
