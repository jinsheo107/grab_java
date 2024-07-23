package com.grab.admin.aNotice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.grab.admin.aNotice.service.NoticeService;
import com.grab.admin.aNotice.vo.Notice;

@WebServlet("/notice/createEnd")
public class NoticeCreateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public NoticeCreateEndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String notice_title = request.getParameter("notice_title");
		String notice_content = request.getParameter("notice_content");
		
		Notice n = new Notice();
		n.setNotice_title(notice_title);
		n.setNotice_content(notice_content);
		
		int result = new NoticeService().createNotice(n);
		/* RequestDispatcher view = null; */
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/member/toNotice");
		}
		/* view.forward(request, response); */
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
