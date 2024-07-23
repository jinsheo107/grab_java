package com.grab.admin.aReview.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.grab.admin.aReview.service.ReviewService;
import com.grab.admin.aReview.vo.Review;

@WebServlet("/member/toReview")
public class toReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public toReviewServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String content = request.getParameter("review_content");
		
		Review option = new Review();
		option.setReview_content(content);
		
		String nowPage = request.getParameter("nowPage");
		if(nowPage != null) {
			option.setNowPage(Integer.parseInt(nowPage));
		}
		System.out.println("안녕 servlet");
		option.setTotalData(new ReviewService().selectReviewCount(option));
		
		List<Review> list = new ReviewService().selectReviewList(option);
		RequestDispatcher view = request.getRequestDispatcher("/views/review/aReview.jsp");
		request.setAttribute("paging", option);
		request.setAttribute("resultLIst", list);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
