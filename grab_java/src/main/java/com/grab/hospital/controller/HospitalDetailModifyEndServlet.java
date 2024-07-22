package com.grab.hospital.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.grab.hospital.service.HospitalDetailModifyService;
import com.grab.hospital.vo.Hospital;
import com.grab.hospital.vo.HospitalModifyRequest;

@WebServlet(name="hospitalDetailModifyEnd", urlPatterns = "/hospital/hospital_detail_select_modify")
public class HospitalDetailModifyEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public HospitalDetailModifyEndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hospital_no_par = request.getParameter("hospital_no");
		int hospital_no = Integer.parseInt(hospital_no_par);
		String hospital_time = request.getParameter("hospital_time");
		String hospital_lunch_time = request.getParameter("hospital_lunch_time");
		int doctor_num = Integer.parseInt(request.getParameter("doctor_num"));
		String hospital_phone = request.getParameter("hospital_phone");
		
		String[] selectedTypes = request.getParameterValues("type_no");
		
		int updateDetail = new HospitalDetailModifyService().detailModify(hospital_no, hospital_time, hospital_lunch_time, doctor_num, hospital_phone, selectedTypes);
		
        if(updateDetail > 0) {
        	System.out.println("success");
        	request.setAttribute("alertMessage", "정보 변경에 성공했습니다.");
        } else {
        	System.out.println("fail");
        	request.setAttribute("alertMessage", "정보 변경에 실패했습니다.");
        }
        
        request.setAttribute("hospital_no", hospital_no);
        RequestDispatcher view = request.getRequestDispatcher("/hospital/hospital_detail");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
