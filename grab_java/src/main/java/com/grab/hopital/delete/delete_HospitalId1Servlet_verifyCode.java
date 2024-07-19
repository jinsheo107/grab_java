package com.grab.hopital.delete;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/HospitalIdServlet_verifyCode")
public class delete_HospitalId1Servlet_verifyCode extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public delete_HospitalId1Servlet_verifyCode() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userEmail = request.getParameter("email");
		String inputAuthCode = request.getParameter("authCode");
		String sessionAuthCode = (String) request.getSession().getAttribute("authcode");
		
        if (sessionAuthCode != null && sessionAuthCode.equals(inputAuthCode)) {
            String Id = (userEmail);
            if (Id.next()) {
                response.getWriter().write("success:" + Id);
            } else {
                response.getWriter().write("error:User not found");
            }
        } else {
            response.getWriter().write("error:Invalid authentication code");
        }
    }
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
}