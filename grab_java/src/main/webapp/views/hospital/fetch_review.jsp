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
	<%@ page import="com.grab.hospital.vo.Review" %>
	<% Review paging = (Review)request.getAttribute("paging"); %>
	<% List<Review> selectedReviewList = (List<Review>)request.getAttribute("selectedReviewList"); %>
	<% List<Review> reviews = (List<Review>)request.getAttribute("reviewList"); %>
	<%
		// 페이지 번호 가져오기
		int nowPage = 1;
		if (request.getParameter("nowPage") != null) {
		    nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
	%>
	
	<div id="content">
	    <!-- 데이터 출력 -->
	    <%
	    if (paging != null) {
	        for (Review r : selectedReviewList) {%>
	        	<tr>
							<td style="padding: 10px"><%=r.getReview_score() %></td>
							<td style="padding: 10px"><%=r.getReview_content() %></td>
							<td style="padding: 10px"><%=r.getMember_no() %></td>
							<td style="padding: 10px"><%=r.getReg_date().getYear() %>-<%=r.getReg_date().getMonthValue() %>-<%=r.getReg_date().getDayOfMonth() %></td>
						</tr>
	        <%}
	    }
	    %>
	</div>
	
	<div class="pagination" id="pagination">
	    <!-- 페이징 출력 -->
	    <% if (paging != null) { %>
	        <% if (paging.isPrev()) { %>
	            <a href="#" data-page="<%=(paging.getPageBarStart()-1)%>" style="z-index: 8;">&laquo;</a>
	        <% } %>
	        <% for (int i = paging.getPageBarStart(); i <= paging.getPageBarEnd(); i++) { %>
	            <a href="#" data-page="<%=i%>" class="<%=paging.getNowPage() == i ? "active" : "" %>"><%=i %></a>
	        <% } %>
	        <% if (paging.isNext()) { %>
	            <a href="#" data-page="<%=(paging.getPageBarEnd()+1)%>">&raquo;</a>
	        <% } %>
	    <% } %>
	</div>

</body>
</html>