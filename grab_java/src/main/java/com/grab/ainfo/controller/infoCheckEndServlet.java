package com.grab.ainfo.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.grab.ainfo.service.HospiInfoService;

@WebServlet("/member/infoCheckEnd")
public class infoCheckEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public infoCheckEndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hospital_no_par = request.getParameter("hospital_no");
		
		String answer1_par = request.getParameter("answer1");
		String answer2_par = request.getParameter("answer2");
		
		int hospital_no = Integer.parseInt(hospital_no_par);
		int answer1 = Integer.parseInt(answer1_par);
		int answer2 = Integer.parseInt(answer2_par);
		
		if(answer1 == 0 && answer2 == 0) {
			int result = new HospiInfoService().permit(hospital_no);
			
			if(result > 0) {
				response.sendRedirect("/member/toHospiInfo");
			}
		}
		RequestDispatcher view = request.getRequestDispatcher("/member/toHospiInfo");
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
