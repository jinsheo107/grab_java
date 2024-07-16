package com.grab.hospital.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.grab.hospital.service.HospitalSettingDepartmentService;
import com.grab.hospital.vo.Department;
import com.grab.member.service.MemberService;
import com.grab.member.vo.Member;

@WebServlet("/hospital/hospital_detail")
public class HospitalDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public HospitalDetailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member m = (Member)request.getAttribute("member");
		
		List<Department> d = new HospitalSettingDepartmentService().settingDepartment(m.getMember_no());
		
		request.setAttribute("resultList", d);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/hospital/hospital_detail.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
