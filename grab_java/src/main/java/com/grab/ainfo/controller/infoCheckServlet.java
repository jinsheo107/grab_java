package com.grab.ainfo.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.grab.ainfo.service.HospiInfoService;
import com.grab.ainfo.vo.HospiInfo;

@WebServlet("/member/infoCheck")
public class infoCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public infoCheckServlet() {
        super();
    }	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hospital_no_par = request.getParameter("hospital_no");
		
		int hospital_no = Integer.parseInt(hospital_no_par);
		
		HospiInfo hi = new HospiInfoService().viewHospiInfo(hospital_no);
		
		
		RequestDispatcher view = request.getRequestDispatcher("/views/hospiInfo/aHospiInfoCheck.jsp");
		request.setAttribute("result", hi);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
