package com.grab.hopital.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.grab.hopital.service.HospitalService;


@WebServlet("/sendEmail")
public class checkhospitalEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public checkhospitalEmailServlet() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
        boolean emailSent = HospitalService.sendAutoCode(email);
        
        JSONObject jsonResponse = new JSONObject();
        jsonResponse.put("success", emailSent);
        
        response.setContentType("application/json");
        response.getWriter()email.write(jsonResponse.toString());

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
