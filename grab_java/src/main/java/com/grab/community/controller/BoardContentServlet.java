package com.grab.community.controller;

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
import com.grab.community.vo.BoardComment;

import static com.grab.common.sql.JDBCTemplate.getConnection;

@WebServlet("/board/content")
public class BoardContentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public BoardContentServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Connection conn = getConnection();
		int boardNo = (Integer.parseInt(request.getParameter("boardNo")));
//		System.out.println(boardNo);
		// 조회수 카운팅
//		int hits = new BoardService().boardCount(boardNo);
		// 게시글 내용 출력
		Board b = new BoardService().BoardContent(boardNo);
		// 게시글 댓글 리스트 및 내용 출력
		List<BoardComment> comment = new BoardService().Boardcomment(boardNo);
		// 데이터 보내기
		request.setAttribute("boardContent", b);
		request.setAttribute("comment", comment);
//		System.out.println(comment);
		HttpSession session=request.getSession();
//		if((int)session.getAttribute("member_type")==3) {
//			
//		}
		if(b.getBoard_type()==1) {
			RequestDispatcher view = request.getRequestDispatcher("/views/community/community_notice_board.jsp");
			view.forward(request, response);
		} else if(b.getBoard_type()==2) {
			RequestDispatcher view = request.getRequestDispatcher("/views/community/Q&A_board.jsp");
			view.forward(request, response);
		} else {
			RequestDispatcher view = request.getRequestDispatcher("/views/community/information_share_board.jsp");
			view.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
