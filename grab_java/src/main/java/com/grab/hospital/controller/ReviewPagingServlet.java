package com.grab.hospital.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.grab.hospital.service.ReviewService;
import com.grab.hospital.vo.Review;

@WebServlet("/hospital/get_reviews")
public class ReviewPagingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ReviewPagingServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nowPage = request.getParameter("nowPage");
		
        // 리뷰 데이터 조회 로직
		/*
		 * List<Review> reviewList = new ReviewService().getReview(h.getHospital_no());
		 * request.setAttribute("reviewList", reviewList);
		 * 
		 * Review reveiwOption = new Review();
		 * 
		 * if(nowPage != null) { reveiwOption.setNowPage(Integer.parseInt(nowPage)); }
		 * 
		 * reveiwOption.setTotalData(reviewList.size());
		 * 
		 * List<Review> selectedReviewList = new
		 * ReviewService().selectReviewList(reveiwOption);
		 * 
		 * request.setAttribute("reviewPaging", reveiwOption);
		 * request.setAttribute("selectedReviewList", selectedReviewList);
		 */
		

        // JSON으로 변환
        JSONObject o = new JSONObject();
		/* String json = gson.toJson(reviews); */

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
//        response.getWriter().write(json);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
