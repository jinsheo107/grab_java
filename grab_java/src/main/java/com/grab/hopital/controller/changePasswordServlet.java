package com.grab.hopital.controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.grab.common.sql.JDBCTemplate;
import com.grab.hopital.dao.HospitalDao;


@WebServlet("/changePasswordServlet")
public class changePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public changePasswordServlet() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
        String email = request.getParameter("email");
        String newPassword = request.getParameter("new-password");

        Connection conn = null;
        try {
            conn = JDBCTemplate.getConnection();
            HospitalDao dao = new HospitalDao();
            boolean isChanged = dao.changePassword(name, email, newPassword, conn);

            if (isChanged) {
                response.sendRedirect("index.jsp");
            } else {
                response.getWriter().write("비밀번호 변경에 실패했습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("비밀번호 변경 중 오류가 발생했습니다.");
        } finally {
            try {
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
