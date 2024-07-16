package com.grab.hopital.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.grab.hopital.service.HospitalDetailModifyService;
import com.grab.hopital.vo.Hospital;

@WebServlet("/hospital/hospital_detail_essentail_modify")
public class HospitalDetailModifyEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public HospitalDetailModifyEndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hn = request.getParameter("hospital_name");
		String dn = request.getParameter("doctor_num");
		String ha = request.getParameter("hospital_addr");
		
		HttpSession session = request.getSession(false);
				
		if(session != null) {
			Hospital h = (Hospital)session.getAttribute("hospital");
			request.setAttribute("hospital", h);

			int result = new HospitalDetailModifyService().essentail_modify(hn, dn, ha, h);
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			if (result > 0) {
				out.println("<script>alert('성공적으로 제출하였습니다!'); location.href='" + request.getContextPath() + "/hospital/hospital_detail';</script>");
				
				h.setHospital_name(hn);
				h.setHospital_doctor_num(Integer.parseInt(dn));
				h.setHospital_addr(ha);
				
				session.setAttribute("hospital", h);
				request.setAttribute("hospital", h);
				
			} else {
				out.println("<script>alert('변경에 실패했습니다. 다시 시도해주세요.'); location.href='" + request.getContextPath() + "/hospital/hospital_detail';</script>");
			}
			out.close();
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
