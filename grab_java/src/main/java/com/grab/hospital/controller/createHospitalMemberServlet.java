package com.grab.hospital.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.time.LocalDateTime;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.grab.common.sql.JDBCTemplate;
import com.grab.hospital.service.HospitalService;
import com.grab.hospital.vo.Hospital;
import com.grab.member.vo.Member;
// hospital
// 회원가입
@WebServlet("/hospital/createHospitalMember")
public class createHospitalMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public createHospitalMemberServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher view = request.getRequestDispatcher("/views/hospital/hospital_request.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
