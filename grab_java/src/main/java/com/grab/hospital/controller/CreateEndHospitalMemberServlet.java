package com.grab.hospital.controller;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.grab.hospital.service.HospitalService;
import com.grab.hospital.vo.Hospital;
import com.grab.member.vo.Member;
import com.grab.hospital.vo.hospital_department;
@WebServlet(name="createEndHospitalMember" ,urlPatterns="/hospital/createEnd")
public class CreateEndHospitalMemberServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public CreateEndHospitalMemberServlet() {
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("create_id");
        System.out.println("id: " + id);
        String pw = request.getParameter("create_pw");
        String email = request.getParameter("create_email");
        String name = request.getParameter("hospital_name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address1");
        String homepage = request.getParameter("homepage");
        String time = request.getParameter("clinic_hours");
        String lunchTime = request.getParameter("clinic_hours_lunch");
        int doctorNum = Integer.parseInt(request.getParameter("number-of-doctors"));
        String[] specialties = request.getParameterValues("specialty");
        Hospital hospital = new Hospital();
        hospital.setHospital_no(1); 
        hospital.setHospital_name(name);
        hospital.setHospital_phone(phone);
        hospital.setHospital_addr(address);
        hospital.setHospital_homepage(homepage);
        hospital.setHospital_time(time);
        hospital.setHospital_lunch_time(lunchTime);
        hospital.setHospital_doctor_num(doctorNum);
        Member member = new Member();
        member.setMember_id(id);
        member.setMember_pw(pw);
        member.setMember_email(email);
        hospital_department[] departments = new hospital_department[specialties.length];
        for (int i = 0; i < specialties.length; i++) {
            departments[i] = new hospital_department();
            departments[i].setType_no(Integer.parseInt(specialties[i]));
            departments[i].setHospital_no(hospital.getHospital_no());
        }
        int result = new HospitalService().createHospitalUser(hospital, member);
        RequestDispatcher view = request.getRequestDispatcher("/views/membership/membership.jsp");
        if(result > 0) {
            view = request.getRequestDispatcher("/views/index.jsp"); 
        }
        view.forward(request,response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}