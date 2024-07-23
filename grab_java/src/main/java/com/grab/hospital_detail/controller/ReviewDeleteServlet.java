package com.grab.hospital_detail.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.grab.hospital_detail.service.ReviewService;

@WebServlet("/review/delete")
public class ReviewDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public ReviewDeleteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String review_no_par = request.getParameter("review_no");
		String hospital_no_par = request.getParameter("hospital_no");
		int review_no = Integer.parseInt(review_no_par);
		int hospital_no = Integer.parseInt(hospital_no_par);
		
		int result = new ReviewService().deleteReview(review_no);
		
		if(result > 0) {
			System.out.println("delete review success");
		} else if (result == -1){ 
		} else {
			System.out.println("delete review fail");
		}
		
		request.setAttribute("hospital_no", hospital_no);
		
		RequestDispatcher view = request.getRequestDispatcher("/hospital/hospital_detail");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
