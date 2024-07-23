package com.grab.aNotice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.grab.aNotice.service.NoticeService;
import com.grab.aNotice.vo.Notice;

@WebServlet("/member/toNoticeUpdate")
public class toNoticeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public toNoticeUpdateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String notice_no_par = request.getParameter("notice_no");
		int notice_no = Integer.parseInt(notice_no_par);
		
		Notice n = new NoticeService().getNoticeByNo(notice_no);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/notice/aNoticeUpdate.jsp");
		request.setAttribute("notice", n);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
