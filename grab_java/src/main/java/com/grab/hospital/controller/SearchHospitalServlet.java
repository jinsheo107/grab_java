package com.grab.hospital.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.grab.hospital.service.HospitalGetService;
import com.grab.hospital.vo.Department;
import com.grab.hospital.vo.Hospital;

@WebServlet("/hospital/search")
public class SearchHospitalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SearchHospitalServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyword = request.getParameter("search_text");
		
		Hospital option = new Hospital();
		
		String nowSearchPage = request.getParameter("nowSearchPage");
		
		if(nowSearchPage != null) {
			option.setNowPage(Integer.parseInt(nowSearchPage));
		}
		
		option.setTotalData(new HospitalGetService().selectHospitalCount(keyword));
		
		List<Hospital> list = new HospitalGetService().selectHospitalList(keyword, option);
		
		request.setAttribute("searchPaging", option);
		request.setAttribute("searchKeyword", keyword);
		request.setAttribute("searchList", list);
				
		RequestDispatcher view = request.getRequestDispatcher("/views/hospital/search_hospital.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
