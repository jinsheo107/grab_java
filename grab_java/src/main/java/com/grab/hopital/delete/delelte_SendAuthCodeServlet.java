package com.grab.hopital.delete;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

@WebServlet("/SendAuthCodeServlet")
public class delelte_SendAuthCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public delelte_SendAuthCodeServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String email = request.getParameter("email");
	        String authCode = generateAuthCode();
	        
	        boolean emailSent = sendEmail(email, authCode); 

	        JSONObject jsonResponse = new JSONObject();
	        jsonResponse.put("success", emailSent);
	        
	        response.setContentType("application/json");
	        response.getWriter().write(jsonResponse.toJSONString());
	    }

	    private String generateAuthCode() {
	        
	        int randomNum = (int) (Math.random() * 900000) + 100000;
	        return String.valueOf(randomNum);
	    }

	    private boolean sendEmail(String email, String authCode) {
	        
	        return true;
	    }
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
