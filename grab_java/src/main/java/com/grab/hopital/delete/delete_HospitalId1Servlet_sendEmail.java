package com.grab.hopital.delete;

import java.io.IOException;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/HospitalIdServlet_sendEmail")
public class delete_HospitalId1Servlet_sendEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public delete_HospitalId1Servlet_sendEmail() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher view = request.getRequestDispatcher("/views/idSearch/hospital_id_search1.jsp");
		view.forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userEmail = request.getParameter("email");
		String autoCode = generateAuthCode();
		
		String host = ""; // smtp 서버 주소?
		final String id = ""; 
		final String password = ""; 
		
		String to = userEmail;
		
		Properties props = new Properties();
		props.put("mail.smtp.host" , host);
		props.put("mail.smtp.auto", "true");
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(id, password);
			}
		});
		
		try {
			MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(id));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject("코드를 입력해주세요.");
            message.setText("당신의 코드는 " + autoCode);
           
            Transport.send(message);
            System.out.println("인증번호가 전송 되었습니다.");
            
            request.getSession().setAttribute("authCode", autoCode);
            request.getSession().setAttribute("userEmail", userEmail);
            response.getWriter().write("success");
			
		} catch(Exception e) {
			e.printStackTrace();
			response.getWriter().write("인증번호 전송에 실패했습니다.");
		}
	}
	
	private String generateAuthCode() {
		return String.valueOf((int)(Math.random()*900000)+100000);
	}
}
