package com.grab.hospital_detail.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.grab.hospital_detail.service.HospitalGetService;
import com.grab.hospital_detail.service.HospitalRequestService;
import com.grab.hospital_detail.vo.Hospital;

@WebServlet(name = "hospitalRequestEnd", urlPatterns = "/hospital/requestEnd")
public class HospitalRequestEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public HospitalRequestEndServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String memberNo_par = request.getParameter("member_no");
		String hospitalNo_par = request.getParameter("hospital_no");
		String requestSelected = request.getParameter("request__element");
		String requestTextarea = request.getParameter("request__textarea");

		int member_no = Integer.parseInt(memberNo_par);
		int hospital_no = Integer.parseInt(hospitalNo_par);

		int result = new HospitalRequestService().createRequest(member_no, hospital_no, requestSelected, requestTextarea);

		if (result > 0) {
			request.setAttribute("alertMessage", "요청사항을 제출하였습니다!");
		} else {
			request.setAttribute("alertMessage", "제출에 실패했습니다. 다시 시도해주세요.");
		}
		request.setAttribute("hospital_no", hospital_no);

		RequestDispatcher view = request.getRequestDispatcher("/hospital/hospital_detail");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
