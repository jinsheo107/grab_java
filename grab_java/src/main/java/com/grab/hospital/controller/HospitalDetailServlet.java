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

@WebServlet(name="hospitalDetail", urlPatterns = "/hospital/hospital_detail")
public class HospitalDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public HospitalDetailServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String alertMessage = (String)request.getParameter("alertMessage");
		request.setAttribute("alertMessage", alertMessage);
		
		String hospital_no_par = (String)request.getParameter("hospital_no");
		
		int hospital_no = Integer.parseInt(hospital_no_par);
		
		System.out.println("detail_hospital_no: " + hospital_no);
		
		
		Hospital hospital = new HospitalGetService().getHospital(hospital_no);

		
		List<Department> department = new HospitalGetService().getDepartment(hospital_no);
		request.setAttribute("resultList", department);
		request.setAttribute("hospital", hospital);

		// 리뷰 리스트
		List<Review> reviewList = new ReviewService().getReview(hospital_no);
		request.setAttribute("reviewList", reviewList);
		
		// 가격 리스트
		List<HospitalPrice> priceList = new HospitalGetService().getPrice(hospital_no);
		request.setAttribute("priceList", priceList);

		// 리뷰의 총 키워드
		if(!reviewList.isEmpty()) {
			Map<String, Integer> reviewKeywordListMap = new HospitalGetService().getKeyword(reviewList);
			request.setAttribute("keyword", reviewKeywordListMap);			
		}

		// 병원공지 리스트
		List<HospitalNotice> hospitalNoticeList = new HospitalGetService().getNotice(hospital.getHospital_no());
		request.setAttribute("hospitalNotices", hospitalNoticeList);

		Review reveiwOption = new Review();

		String nowPage = request.getParameter("nowPage");
		if (nowPage != null) {
			reveiwOption.setNowPage(Integer.parseInt(nowPage));
		}

		reveiwOption.setTotalData(reviewList.size());

		
		List<Review> selectedReviewList = new ReviewService().selectReviewList(reveiwOption);

		request.setAttribute("reviewPaging", reveiwOption);
		request.setAttribute("selectedReviewList", selectedReviewList);

		RequestDispatcher view = request.getRequestDispatcher("/views/hospital/hospital_detail.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
