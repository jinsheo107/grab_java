package com.grab.hopital.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.grab.hopital.service.HospitalService;
import com.grab.hopital.vo.Hospital;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/emailController")
public class emailControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public emailControllerServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hospitalLicense = request.getParameter("hospital_license");
		String hospitalRegistration = request.getParameter("hospital_registration");
		
		Hospital h = new Hospital();
		h.setHospital_license(hospitalLicense);
		h.setHospital_registration(hospitalRegistration);
		
		List<Hospital> result = HospitalService.saveHospitalRequest(h);
		request.setAttribute("result", result);
		RequestDispatcher dispatcher = request.getRequestDispatcher("views/membership/membership4");
		dispatcher.forward(request, response);
		
//		// 1. multipart/form-data 형식으로 파일이 왔는지 확인
//				if(ServletFileUpload.isMultipartContent(request)) {
//					// 2. 파일 저장 위치 설정
//					String dir = request.getServletContext().getRealPath("upload");
//					// 3. 저장 파일의 최대 크기 설정(10MB)
//					int maxSize = 1024 * 1024* 10;
//					// 4. 인코딩 설정
//					String encoding = "UTF-8";
//					// 5. Rename 클래스
//					DefaultFileRenamePolicy dfr = new DefaultFileRenamePolicy();
//					// 6. MultipartRequest 매개변수 
//					// HttpServletRequest, 저장위치, 최대크기, 인코딩, Rename규칙
//					MultipartRequest mr = new MultipartRequest(request,dir,maxSize,encoding,dfr);
//					// 7. 파일명 정보
//					String oriName = mr.getOriginalFileName("thumbnail");
//					String reName = mr.getFilesystemName("thumbnail");
////					System.out.println(oriName + "->" + reName);
//					String title = mr.getParameter("board_title");
//					String content = mr.getParameter("board_content");
//					//String writer = mr.getParameter("board_writer");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
