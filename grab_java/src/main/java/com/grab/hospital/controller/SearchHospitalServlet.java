package com.grab.hospital.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.grab.hospital.vo.Hospital;

@WebServlet("/hospital/search")
public class SearchHospitalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SearchHospitalServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyword = request.getParameter("search_text");
		
		HttpSession session = request.getSession(true);
		
		Hospital h = new Hospital();
		h.setHospital_name(keyword);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/hospital/search_hospital.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
