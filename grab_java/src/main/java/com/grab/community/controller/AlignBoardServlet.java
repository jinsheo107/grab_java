package com.grab.community.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.grab.community.service.AlignService;
import com.grab.community.service.BoardService;
import com.grab.community.vo.Board;

@WebServlet("/align/board")
public class AlignBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public AlignBoardServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int alignNo = Integer.parseInt(request.getParameter("align"));
		System.out.println(alignNo+"정렬넘버");
		Board b = new Board();
		String nowPage = request.getParameter("now_page");
		HttpSession session = request.getSession();
		int boardType = (int)session.getAttribute("boardType");
		List<Board> list = null;
		if(nowPage != null) {
			b.setNowPage(Integer.parseInt(nowPage));
		}
		b.setTotalContent(new BoardService().boardCount());
		if(alignNo==1) {
			list = new AlignService().dateDESC(boardType, b);
		} else if(alignNo==2) {
			list = new AlignService().dateASC(boardType, b);
		} else if(alignNo==3) {
			list = new AlignService().viewDESC(boardType, b);
		} else {
			list = new AlignService().viewASC(boardType, b);
		}
		request.setAttribute("paging", b);
		request.setAttribute("boardList", list);
		System.out.println(list);
//		HttpSession session=request.getSession();
//		if(session==null) {
//			RequestDispatcher view = request.getRequestDispatcher("index.jsp");
//			view.forward(request, response);
//		} else {
//			RequestDispatcher view = request.getRequestDispatcher("/views/community/community_notice.jsp");
//			view.forward(request, response);	
//		}
		if(boardType == 1) {
			System.out.println(boardType+"확인");
			RequestDispatcher view = request.getRequestDispatcher("/views/community/community_notice.jsp");
			view.forward(request, response);
//			response.sendRedirect("/views/community/community_notice.jsp");
		} else if(boardType == 2) {
			RequestDispatcher view = request.getRequestDispatcher("/views/community/qna.jsp");
			view.forward(request, response);
//			response.sendRedirect("/Q&A_board/list");
		} else {
			RequestDispatcher view = request.getRequestDispatcher("/views/community/information_share.jsp");
			view.forward(request, response);
//			response.sendRedirect("/information_share/list");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
