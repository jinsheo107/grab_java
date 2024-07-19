package com.grab.hopital.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Hospital_Membership3")
public class 진료과Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public 진료과Servlet() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] specialties = request.getParameterValues("specialty");
        if (specialties != null && specialties.length <= 3) {
            try {
                
                String jdbcURL = "jdbc:mysql://localhost:3306/hospital_department";
                String dbUser = "grab";
                String dbPassword = "1234";
                
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
                
                String sql = "INSERT INTO hospital_specialties (hospital_id, specialty) VALUES (?, ?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                
                int hospitalId = (int) request.getSession().getAttribute("hospital_id");
                for (String specialty : specialties) {
                    pstmt.setInt(1, hospitalId);
                    pstmt.setString(2, specialty);
                    pstmt.executeUpdate();
                }
                
                pstmt.close();
                conn.close();
                
                response.sendRedirect("Hospital_Membership4.jsp");
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("잘못된 정보입니다 다시 입력해주세요.");
            }
        } else {
            response.sendRedirect("잘못된 정보입니다 다시 입력해주세요.");
        }
    }

	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
