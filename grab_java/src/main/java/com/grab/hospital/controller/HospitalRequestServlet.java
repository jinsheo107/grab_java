package com.grab.hospital.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/hospital/hospital_request")
public class HospitalRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public HospitalRequestServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String hospital_no_par = request.getParameter("hospital_no");

		int hospital_no = Integer.parseInt(hospital_no_par);

		request.setAttribute("hospital_no", hospital_no);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/hospital/hospital_request.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
