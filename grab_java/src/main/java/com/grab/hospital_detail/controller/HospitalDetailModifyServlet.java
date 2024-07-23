package com.grab.hospital_detail.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.grab.hospital_detail.service.HospitalGetService;
import com.grab.hospital_detail.vo.Hospital;
import com.grab.hospital_detail.vo.HospitalType;
import com.grab.member_detail.vo.Member;

@WebServlet("/hospital/hospital_detail_modify")
public class HospitalDetailModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public HospitalDetailModifyServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
		
		int hospital_no = member.getMember_no();
		
		Hospital hospital = new HospitalGetService().getHospital(hospital_no);
		request.setAttribute("hospital", hospital);
		
		List<HospitalType> hospital_type = new HospitalGetService().getHospitalType();
		
		request.setAttribute("hospitalTypeList", hospital_type);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/hospital/hospital_detail_modify.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
