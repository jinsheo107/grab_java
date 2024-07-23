package com.grab.hospital_detail.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.grab.hospital_detail.service.ReviewService;
import com.grab.hospital_detail.vo.Review;

@WebServlet("/review/modify")
public class ReviewModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReviewModifyServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String review_no_par = request.getParameter("review_no");
		int review_no = Integer.parseInt(review_no_par);
		
		Review review = new ReviewService().getReview(review_no);
		
		request.setAttribute("writenReview", review);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/hospital/modify_review.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
