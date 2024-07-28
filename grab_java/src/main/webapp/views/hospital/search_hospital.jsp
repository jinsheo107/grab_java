<%@page import="com.grab.hospital_detail.service.ReviewService"%>
<%@page import="com.grab.hospital_detail.service.HospitalGetService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여기아파 검색창</title>

						<% 
							/* List<Review> reviews = (List<Review>)request.getAttribute("reviewList");
							double score = 0.0;
							for(int j = 0; j < reviews.size(); j++) {
								score += reviews.get(i).getReview_score();
							}
							
							double avg = Math.round(score / reviews.size() * 10) / 10.0; */
						%>


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
	<link rel="stylesheet" href="../../resources/css/community/게시글 리스트.css" type="text/css">
	
	<style>
		<style>
	    table {
	        width: 80%;
	        margin: 0px 100px;
	        text-align: center;
	        border-spacing: 0 10px; /* 행 간격 설정 */
	    }
	
	    th, td {
	        padding: 10px 20px;
	        font-size: 20px;
	        background-color: #f9f9f9; /* 아주 연한 회색 배경 */
	    }
	
	    tbody tr {
	        background-color: #f9f9f9; /* 아주 연한 회색 배경 */
	    }
	
	    tbody tr:hover {
	        background-color: #f0f0f0; /* 행에 마우스 오버 시 더 진한 회색 */
	    }
	    
	    .pagination {
		display: inline-box;
		list-style-type: none;
		justify-content: center;
	}
	
	.pagination a {
		margin: 0 5px;
		text-decoration: none;
		color: black;
	}
	
	.pagination a.active {
		font-weight: bold;
		color: red;
	}
	</style>
</head>
<body>
	<%@ include file="../include/hospital_nav.jsp"%>
	<%@ page import="java.util.*" %>
	<% String keyword = (String)request.getAttribute("searchKeyword") == null ? "": (String)request.getAttribute("searchKeyword");  %>
	<% Hospital searchPaging = (Hospital)request.getAttribute("searchPaging");%>
	<% List<Hospital> searchList = (List<Hospital>)request.getAttribute("searchList"); %>
	<%@ page import="com.grab.hospital_detail.vo.Department" %>
	
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
								<input type="text" placeholder="<%= keyword %>" name="search_text">
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
							<th style="padding: 10px 20px; font-size: 20px;">진료과목</th>
						</tr>
					</thead>
					<tbody class="searchTbody">
						<%@ page import="com.grab.hospital_detail.vo.Hospital,java.util.*" %>
						<%@ page import="com.grab.hospital_detail.vo.Review" %>
						<%@ page import="com.grab.hospital_detail.vo.Department" %>
						<% for(int i = 0 ; i < searchList.size(); i++) { %>
								<tr onclick="navigateTo('/hospital/hospital_detail?hospital_no=<%= searchList.get(i).getHospital_no() %>')">
									<!-- 병원명 -->
									<td><%=searchList.get(i).getHospital_name()%></td>
									<!-- 평균리뷰점수 -->
									<td>
										<% List<Review> reviewList = new ReviewService().getReviewList(searchList.get(i).getHospital_no()); %>
										<% double scoreSum = 0.0;%>
										<%if(reviewList.size() > 0) {%>
										<% for(int j = 0; j < reviewList.size(); j++) {
											scoreSum += reviewList.get(j).getReview_score();
											} %>
											<%= Math.round(scoreSum / reviewList.size() * 10) / 10.0 %>
										<%} else { %>
											<%=scoreSum %>
										<%} %>
									</td>
									<!-- 병원주소 -->
									<td><%=searchList.get(i).getHospital_addr()%></td>
									<!-- 병원진료과목 -->
									<td>
										<% List<Department> departList = new HospitalGetService().getDepartment(searchList.get(i).getHospital_no()); %>
										<% for(int j = 0; j < departList.size(); j++) {%>
											<%= departList.get(j).getType_content() %><br>
										<%} %>
									</td>
								</tr>
							<%} %>
								
					</tbody>
					<tfoot>
							<tr>
								<td colspan="4">
									<div class="pagination" id="pagination">
										<% if (searchPaging != null) { %>
											<% if (searchPaging.isPrev()) { %>
												<a href="/hospital/search?search_text=<%=keyword%>&nowPage=<%=(searchPaging.getPageBarStart()-1)%>#content">&laquo;</a>
											<% } %>
											<% for (int i = searchPaging.getPageBarStart(); i <= searchPaging.getPageBarEnd(); i++) { %>
												<a href="/hospital/search?search_text=<%=keyword%>&nowPage=<%=i%>" <%=searchPaging.getNowPage() == i ? "class='active'" : " " %>><%=i %></a>
											<% } %>
											<% if (searchPaging.isNext()) { %>
												<a href="/hospital/search?search_text=<%=keyword%>&nowPage=<%=(searchPaging.getPageBarEnd()+1)%>#content">&raquo;</a>
											<% } %>
										<% } %>
									</div>
								</td>
							</tr>
					</tfoot>
				</table>
			</div>		
			</div>
		</div>
	</section>

	<footer>
    <div class="footer_align">
      <div class="footer_content">
        <ul class="notoSansRegular">
          <li>사이트맵</li>
          <li>&nbsp;|&nbsp;</li>
          <li>서비스이용약관</li>
          <li>&nbsp;|&nbsp;</li>
          <li>개인정보처리방침</li>
          <li>&nbsp;|&nbsp;</li>
          <li>사업자정보</li>
          <li>&nbsp;|&nbsp;</li>
          <li>채용공고</li>
          <li>&nbsp;|&nbsp;</li>
          <li>커뮤니티이용약관</li>
        </ul>
        <p class="notoSansLight">
          전화번호 : 010-0000-0000 <br>
          이메일 : abcdefg@hijklmnop.com <br>
          주소 : 서울특별시 금천구 가산디지털2로 95 (가산동, km타워) 3층 305호 <br>
          본 사이트는 저작권법의 보호를 받아 무단 전제 및 복제, 게시를 금합니다.
        </p>
      </div>
      <div class="copyright notoSansLight">
        <p>Copyright &copy; 2024 GDacademy.All Rights Reserved.</p>
      </div>
    </div>
  </footer>

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