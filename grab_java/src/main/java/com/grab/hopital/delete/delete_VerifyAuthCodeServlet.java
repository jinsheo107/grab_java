package com.grab.hopital.delete;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.grab.hopital.service.*;

import org.json.simple.JSONObject;

@WebServlet("/VerifyCode")
public class delete_VerifyAuthCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public delete_VerifyAuthCodeServlet() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String code = request.getParameter("code");
        boolean isValid = hospitalService.verifyCode(code); 

        JSONObject jsonResponse = new JSONObject();
        jsonResponse.put("valid", isValid);
        
        response.setContentType("application/json");
        response.getWriter().write(jsonResponse.toString());
    }

    

    private String getSavedAuthCode() {
        
        return "123456"; // 예시 인증번호
    }

	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
