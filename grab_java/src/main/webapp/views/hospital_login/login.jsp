<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ page contentType="text/html; charset=UTF-8" language="java" %>
	<%@ page import="java.util.List" %>
	<%@ page import="com.grab.hopital.vo.Hospital" %>
	<% Review paging = (Review)request.getAttribute("paging"); %>
	<% List<Review> selectedReviewList = (List<Review>)request.getAttribute("selectedReviewList"); %>
	<% List<Review> reviews = (List<Review>)request.getAttribute("reviewList"); %>
	<%
		// 페이지 번호 가져오기
		int nowPage = 3;
		if (request.getParameter("nowPage") != null) {
		    nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
	%>



</body>
</html>l>