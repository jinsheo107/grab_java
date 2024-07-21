<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="../../resources/css/common/폰트.css">
<link rel="stylesheet"
	href="../../resources/css/common/bootstrap.min.css" type="text/css">
<link rel="stylesheet"
	href="../../resources/css/common/font-awesome.min.css" type="text/css">
<link rel="stylesheet"
	href="../../resources/css/common/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="../../resources/css/common/flaticon.css"
	type="text/css">
<link rel="stylesheet"
	href="../../resources/css/common/owl.carousel.min.css" type="text/css">
<link rel="stylesheet"
	href="../../resources/css/common/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="../../resources/css/common/style.css"
	type="text/css">
</head>
<body>
	<%@ include file="../include/hospital_nav.jsp"%>

	<section class="register-domain spad">
		<div class="container">
			<div class="row d-flex justify-content-center">
				<div class="col-lg-8">
					<div class="register__text">
						<div class="searchComment">
							<h3 class="notoSansBold">찾으시는 병원을 검색해 보세요!</h3>
						</div>
						<div class="register__form">
							<form action="/hospital/search">
								<input type="text" placeholder="병원 검색하기" name="search_text">
								<button type="submit" class="notoSansMedium site-btn">검색</button>
							</form>
						</div>
					</div>
				</div>
				<div class="book_list">
				<table style="width: 80%; margin: 0px 100px; text-align: center;">
					<colgroup>
						<col width="30%">
						<col width="10%">
						<col width="40%">
						<col width="20%">
					</colgroup>
					<thead>
						<tr>
							<th style="padding: 10px 20px; font-size: 20px;">병원명</th>
							<th style="padding: 10px 20px; font-size: 20px;">별점</th>
							<th style="padding: 10px 20px; font-size: 20px;">병원주소</th>
							<th style="padding: 10px 20px; font-size: 20px;">조회수</th>
						</tr>
					</thead>
					<tbody>
						<%@ page import="com.grab.hospital.vo.Hospital, java.util.*" %>
						<%@ page import="com.grab.hospital.vo.Review" %>
						<%
							List<Hospital> searchList = (List<Hospital>)request.getAttribute("searchList");
							for(int i = 0 ; i < searchList.size(); i++) { %>
						<% 
							/* List<Review> reviews = (List<Review>)request.getAttribute("reviewList");
							double score = 0.0;
							for(int j = 0; j < reviews.size(); j++) {
								score += reviews.get(i).getReview_score();
							}
							
							double avg = Math.round(score / reviews.size() * 10) / 10.0; */
						%>
								<tr onclick="navigateTo('/hospital/hospital_detail?hospital_no=<%= searchList.get(i).getHospital_no() %>')">
									<td><%=searchList.get(i).getHospital_name()%></td>
									<td>5</td>
									<%-- <td><%= avg%></td> --%>
									<td><%=searchList.get(i).getHospital_addr()%></td>
									<td><%=searchList.get(i).getHospital_view()%></td>
								</tr>
						<%}%>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="4">
								<% Hospital searchPaging = (Hospital)request.getAttribute("searchPaging"); %>
								<% if(searchPaging !=null){ %>
									<div class="center">
										<div class="pagination">
											<!-- 이전 버튼이 활성화 되었을시 해당 코드 실행 -->
											<% if(searchPaging.isPrev()){ %>
												<!-- ?는 값도 같이 보내겠다는 의미이다. get만 가능 -->
												<!-- nowPage의 값을 현재 페이지-1한 값(이전 페이지) 로 보내겠다는 뜻 -->
												<a href="/hospital/search?nowSearchPage=<%=(searchPaging.getPageBarStart()-1)%>">&laquo;</a>
											<%} %>
											
											<%
												for(int i = searchPaging.getPageBarStart(); i <= searchPaging.getPageBarEnd(); i++){ %>
													
												<a href="/hospital/search?nowSearchPage=<%=i%>"<%=searchPaging.getNowPage() == i ? "class='active'" : "" %>>
													<%=i %>
												</a>
											<%} %>
											<!-- 다음 버튼이 활성화 되었을시 해당 코드 실행 -->
											<%if(searchPaging.isNext()){ %>
												<a href="/hospital/search?nowSearchPage=<%=(searchPaging.getPageBarEnd()+1)%>">&raquo;</a>
											<%} %>
										</div>
									</div>
								<%} %>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>		
			</div>
		</div>
	</section>

	<%@ include file="../include/footer.jsp"%>

	<script src="../../resources/js/common/jquery-3.7.1.js"></script>
	<script src="../../resources/js/common/bootstrap.min.js"></script>
	<script src="../../resources/js/common/jquery.slicknav.js"></script>
	<script src="../../resources/js/common/owl.carousel.min.js"></script>
	<script src="../../resources/js/common/main.js"></script>
	
	<script type="text/javascript">
		function navigateTo(url) {
	        window.location.href = url;
	    }	
	</script>

</body>
</html>