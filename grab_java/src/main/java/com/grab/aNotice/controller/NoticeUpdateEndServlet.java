package com.grab.aNotice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.grab.aNotice.service.NoticeService;

@WebServlet("/member/noticeUpdateEnd")
public class NoticeUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public NoticeUpdateEndServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String notice_no_par = request.getParameter("notice_no");
		int notice_no = Integer.parseInt(notice_no_par);
		
		String notice_title = request.getParameter("notice_title");
		String notice_content = request.getParameter("notice_content");
		
		int result = new NoticeService().updateNotice(notice_no, notice_title, notice_content);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/member/toNotice");
		}else {
			RequestDispatcher view = request.getRequestDispatcher("/views/notice/aNotice.jsp");
			view.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
