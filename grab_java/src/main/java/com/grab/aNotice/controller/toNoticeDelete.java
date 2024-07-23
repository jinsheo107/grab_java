package com.grab.aNotice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.grab.aNotice.service.NoticeService;
import com.grab.aNotice.vo.Notice;

@WebServlet("/member/toNoticeDelete")
public class toNoticeDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public toNoticeDelete() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String notice_no_par = request.getParameter("notice_no");
		int notice_no = Integer.parseInt(notice_no_par);
		
		Notice n = new Notice();
		int result = new NoticeService().deleteNotice(notice_no);
		List<Notice> list = new NoticeService().selectNoticeList(n);
		request.setAttribute("resultList", list);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/member/toNotice");
		}else {
			RequestDispatcher view = request.getRequestDispatcher("/views/aNotice/aNotice.jsp");
			view.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
