package com.grab.hospital.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.grab.hospital.service.ReviewService;
import com.grab.member.vo.Member;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet(name = "HospitalCreateReviewEnd", urlPatterns = "/hospital/create_review_end")
public class HospitalCreateReviewEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public HospitalCreateReviewEndServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (ServletFileUpload.isMultipartContent(request)) {
			HttpSession session = request.getSession();
			Member member = (Member) session.getAttribute("member");

			String dir = request.getServletContext().getRealPath("upload");

			int maxSize = 1024 * 1024 * 10;

			String encoding = "UTF-8";

			DefaultFileRenamePolicy dfr = new DefaultFileRenamePolicy();

			MultipartRequest mr = new MultipartRequest(request, dir, maxSize, encoding, dfr);

			String orgName = mr.getOriginalFileName("review_file");
			String reName = mr.getFilesystemName("review_file");

			int reviewStar = Integer.parseInt(mr.getParameter("reviewStar"));
			String reviewContent = mr.getParameter("review_content");
			int keyword_1 = mr.getParameter("keyword_1") == null ? 9 : Integer.parseInt(mr.getParameter("keyword_1"));
			int keyword_2 = mr.getParameter("keyword_2") == null ? 9 : Integer.parseInt(mr.getParameter("keyword_2"));
			int keyword_3 = mr.getParameter("keyword_3") == null ? 9 : Integer.parseInt(mr.getParameter("keyword_3"));
			int keyword_4 = mr.getParameter("keyword_4") == null ? 9 : Integer.parseInt(mr.getParameter("keyword_4"));
			int keyword_5 = mr.getParameter("keyword_5") == null ? 9 : Integer.parseInt(mr.getParameter("keyword_5"));

			int[] keywords = { keyword_1, keyword_2, keyword_3, keyword_4, keyword_5 };
			List<Integer> selectedKeywordsList = new ArrayList<>();
			for (int keyword : keywords) {
				if (keyword != 9) {
					selectedKeywordsList.add(keyword);
				}
			}

			String hospitalIdParam = mr.getParameter("hospital_no");

			int hospital_no = Integer.parseInt(hospitalIdParam);

			int[] selectedKeywords = selectedKeywordsList.stream().mapToInt(i -> i).toArray();

			int[] result = new ReviewService().createReview(hospital_no, member.getMember_no(), reviewStar,
					selectedKeywords, reviewContent, orgName, reName);

			int count = 0;

			for (int r : result) {
				count++;
				if (r == 0) {
					request.setAttribute("alertMessage", "리뷰에 실패했습니다. 다시 시도해주세요.");
					break;
				} else {
					if (count == result.length) {
						request.setAttribute("alertMessage", "리뷰작성을 성공하였습니다!");
					}
				}
			}

			response.sendRedirect(request.getContextPath() + "/hospital/hospital_detail?hospital_no=" + hospital_no);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
