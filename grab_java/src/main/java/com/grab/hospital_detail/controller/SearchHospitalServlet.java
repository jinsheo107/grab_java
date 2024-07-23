package com.grab.hospital_detail.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.grab.hospital_detail.service.HospitalGetService;
import com.grab.hospital_detail.service.ReviewService;
import com.grab.hospital_detail.vo.Department;
import com.grab.hospital_detail.vo.Hospital;
import com.grab.hospital_detail.vo.Review;

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
		
		
		List<Review> reviewList;
		List<Department> departmentList = null;
		double avg = 0.0;
		for (Hospital hospital : list) {
	        reviewList = new ReviewService().getReviewList(hospital.getHospital_no());
	        double score = 0.0;
	        for (Review review : reviewList) {
	            score += review.getReview_score();
	        }
	        avg = reviewList.isEmpty() ? 0.0 : Math.round(score / reviewList.size() * 10) / 10.0;
	        
	        departmentList = new HospitalGetService().getDepartment(hospital.getHospital_no());
	        
	    }
		
		request.setAttribute("departmentList", departmentList);
		request.setAttribute("starAvg", avg);
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
