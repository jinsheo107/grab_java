package com.grab.admin.aInfo.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.grab.admin.aInfo.service.HospiInfoService;
import com.grab.admin.aInfo.vo.HospiInfo;



@WebServlet("/member/toHospiInfo")
public class toHospiInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public toHospiInfoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("hospital_name");
		
		HospiInfo option = new HospiInfo();
		option.setHospital_name(title);
		
		String nowPage = request.getParameter("nowPage");
		if(nowPage != null) {
			option.setNowPage(Integer.parseInt(nowPage));
		}
		
		option.setTotalData(new HospiInfoService().selectHospiInfoCount(option));
		
		List<HospiInfo> list = new HospiInfoService().selectHospiInfoList(option);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/hospiInfo/aHospiInfo.jsp");
		request.setAttribute("paging", option);
		request.setAttribute("resultList", list);
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
