package com.grab.hopital.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.grab.hopital.service.HospitalRequestService;

@WebServlet(name="HospitalRequestEnd", urlPatterns = "/hospital/requestEnd")
public class HospitalRequestEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public HospitalRequestEndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String requestSelected = request.getParameter("request__element");
		String requestTextarea = request.getParameter("request__textarea");

		int result = new HospitalRequestService().createRequest(requestSelected, requestTextarea);
		
		response.setContentType("text/html; charset=UTF-8");
	    PrintWriter out = response.getWriter();

	    if (result > 0) {
	        out.println("<script>alert('요청사항을 제출하였습니다!'); location.href='" + request.getContextPath() + "/hospital/hospital_detail';</script>");
	    } else {
	        out.println("<script>alert('제출에 실패했습니다. 다시 시도해주세요.'); location.href='" + request.getContextPath() + "/hospital/hospital_detail';</script>");
	    }
	    out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
