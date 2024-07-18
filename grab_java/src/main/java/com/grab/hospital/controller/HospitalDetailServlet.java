package com.grab.hospital.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.grab.hospital.service.HospitalGetService;
import com.grab.hospital.service.ReviewService;
import com.grab.hospital.vo.Department;
import com.grab.hospital.vo.Hospital;
import com.grab.hospital.vo.HospitalPrice;
import com.grab.hospital.vo.Review;

@WebServlet("/hospital/hospital_detail")
public class HospitalDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public HospitalDetailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		if(session != null) {
			Hospital h = (Hospital)session.getAttribute("hospital");
			
			List<Department> d = new HospitalGetService().getDepartment(h.getHospital_no());
			request.setAttribute("resultList", d);			
			request.setAttribute("hospital", h);
			
			List<Review> reviewList = new ReviewService().getReview(h.getHospital_no());
			request.setAttribute("reviewList", reviewList);
			
			List<HospitalPrice> priceList = new HospitalGetService().getPrice(h.getHospital_no());
			request.setAttribute("priceList", priceList);
			
			Review option = new Review();
			
			String nowPage = request.getParameter("nowPage");
			if(nowPage != null) {
				option.setNowPage(Integer.parseInt(nowPage));
			}
			
			option.setTotalData(reviewList.size());
			
			List<Review> selectedReviewList = new ReviewService().selectReviewList(option);
			
			request.setAttribute("paging", option);
			request.setAttribute("selectedReviewList", selectedReviewList);
			
			Map<String, Object> responseData = new HashMap<>();
	        responseData.put("reviews", selectedReviewList);
	        responseData.put("paging", option);

	        // JSON 응답 설정
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        PrintWriter out = response.getWriter();
	        out.print(new Gson().toJson(responseData));
	        out.flush();
		}
		
		RequestDispatcher view = request.getRequestDispatcher("/views/hospital/hospital_detail.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
