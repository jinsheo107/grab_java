package com.grab.hospital.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.grab.hospital.service.HospitalGetService;
import com.grab.hospital.service.ReviewService;
import com.grab.hospital.vo.Department;
import com.grab.hospital.vo.Hospital;
import com.grab.hospital.vo.HospitalNotice;
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
			
			// 리뷰 리스트
			List<Review> reviewList = new ReviewService().getReview(h.getHospital_no());
			request.setAttribute("reviewList", reviewList);
			
			// 가격 리스트
			List<HospitalPrice> priceList = new HospitalGetService().getPrice(h.getHospital_no());
			request.setAttribute("priceList", priceList);
			
			// 리뷰의 총 키워드
			Map<String, Integer> map = new HospitalGetService().getKeyword(reviewList);
			request.setAttribute("keyword", map);
			
			// 병원공지 리스트
			List<HospitalNotice> hospitalNoticeList = new HospitalGetService().getNotice(h.getHospital_no());
			request.setAttribute("hospitalNotices", hospitalNoticeList);
			
			Review reveiwOption = new Review();
			
			String nowPage = request.getParameter("nowPage");
			if(nowPage != null) {
				reveiwOption.setNowPage(Integer.parseInt(nowPage));
			}
			
			reveiwOption.setTotalData(reviewList.size());
			
			List<Review> selectedReviewList = new ReviewService().selectReviewList(reveiwOption);
			
			request.setAttribute("reviewPaging", reveiwOption);
			request.setAttribute("selectedReviewList", selectedReviewList);
			
		}
		
		RequestDispatcher view = request.getRequestDispatcher("/views/hospital/hospital_detail.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
