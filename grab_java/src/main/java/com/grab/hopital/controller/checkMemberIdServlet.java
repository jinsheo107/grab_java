package com.grab.hopital.controller;

import java.io.IOException;
import java.sql.Connection;
import org.json.simple.JSONObject;

import com.grab.hopital.service.HospitalService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/checkMemberId")
public class checkMemberIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public checkMemberIdServlet() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String username = request.getParameter("member_id");
	        boolean isTaken = HospitalService.checkMemberId(Member_id);
	        
	        JSONObject jsonResponse = new JSONObject();
	        jsonResponse.put("isTaken", isTaken);
	        
	        response.setContentType("application/json");
	        response.getWriter().write(jsonResponse.toString());
    }

		

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
