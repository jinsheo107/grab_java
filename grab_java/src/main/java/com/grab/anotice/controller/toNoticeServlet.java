package com.grab.anotice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.grab.anotice.service.NoticeService;
import com.grab.anotice.vo.Notice;

@WebServlet("/member/toNotice")
public class toNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public toNoticeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("notice_title");
		
		Notice option = new Notice();
		option.setNotice_title(title);
		
		String nowPage = request.getParameter("nowPage");
		if(nowPage != null) {
			option.setNowPage(Integer.parseInt(nowPage));
		}
		
		// 페이징바 구성
		option.setTotalData(new NoticeService().selectNoticeCount(option));
		
		List<Notice> list = new NoticeService().selectNoticeList(option);
		request.setAttribute("paging", option);
		request.setAttribute("resultList", list);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/notice/aNotice.jsp");
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
