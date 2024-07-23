package com.grab.hospital.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.grab.common.sql.JDBCTemplate;
import com.grab.hospital.dao.HospitalDao;
import com.grab.hospital.service.HospitalService;
import com.grab.hospital.vo.Hospital;

// hospital
//진료 항목 3가지
@WebServlet("/medicalCheckServlet")
public class medicalCheckServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public medicalCheckServlet() {
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher view = request.getRequestDispatcher("/views/hospital/membership.jsp");
        view.forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] specialties = request.getParameterValues("specialty");
        if (specialties != null && specialties.length >= 1 && specialties.length <= 3) {
            Hospital hospital = new Hospital();
            
            hospital.setHospital_no(1);
            Connection conn = JDBCTemplate.getConnection();
            try {
                HospitalDao dao = new HospitalDao();
                int result = dao.saveSpecialties(hospital, specialties, conn);
                if (result > 0) {
                    JDBCTemplate.commit(conn);
                    response.sendRedirect("/index.jsp"); 
                } else {
                    JDBCTemplate.rollback(conn);
                    sendAlertAndRedirect(response, "항목 선택이 잘못되었습니다.", "/views/hospital/membership.jsp");
                }
            } catch (SQLException e) {
                JDBCTemplate.rollback(conn);
                e.printStackTrace();
                sendAlertAndRedirect(response, "항목 선택이 잘못되었습니다.", "/views/hospital/membership.jsp");
            } finally {
                JDBCTemplate.close(conn);
            }
        } else {
            sendAlertAndRedirect(response, "항목 선택이 잘못되었습니다.", "/views/hospital/membership.jsp");
        }
    }
    private void sendAlertAndRedirect(HttpServletResponse response, String message, String redirectUrl) throws IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('" + message + "'); location.href='" + redirectUrl + "';</script>");
        out.close();
    }
}



