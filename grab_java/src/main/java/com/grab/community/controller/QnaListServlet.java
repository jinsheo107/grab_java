package com.grab.community.controller;

import static com.grab.common.sql.JDBCTemplate.getConnection;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.grab.community.service.BoardService;
import com.grab.community.vo.Board;

@WebServlet("/Q&A_board/list")
public class QnaListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public QnaListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = getConnection();
		
		Board b = new Board();
		String nowPage = request.getParameter("now_page");
		int boardType = 2;
		if(nowPage != null) {
			b.setNowPage(Integer.parseInt(nowPage));
		}
		b.setTotalContent(new BoardService().boardCount(b));
		List<Board> list = new BoardService().boardList(boardType, b);
		
		request.setAttribute("paging", b);
		request.setAttribute("boardList", list);
		HttpSession session=request.getSession();
		if(session==null) {
			RequestDispatcher view = request.getRequestDispatcher("index.jsp");
			view.forward(request, response);
		} else {
			RequestDispatcher view = request.getRequestDispatcher("/views/community/qna.jsp");
			view.forward(request, response);	
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
