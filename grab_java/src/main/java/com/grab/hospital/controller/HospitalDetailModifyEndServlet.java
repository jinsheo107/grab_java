package com.grab.hospital.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
		String hospital_time = request.getParameter("hospital_time");
		String hospital_lunch_time = request.getParameter("hospital_lunch_time");
		int doctor_num = Integer.parseInt(request.getParameter("doctor_num"));
		String hospital_phone = request.getParameter("hospital_phone");
		
		
		String[] selectedTypes = request.getParameterValues("type_no");
        if (selectedTypes != null) {
            for (String type : selectedTypes) {
            	
            }
        }
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
