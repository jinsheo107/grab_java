<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원상세페이지</title>
<!-- Google Font -->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,600,700,800,900&display=swap" rel="stylesheet">

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

<style>
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

<style>
.review__table {
	padding: 20px 25px;
	display: flex;
	background: #ffffff;
	-webkit-box-shadow: 0px 0px 10px rgba(18, 8, 81, 0.15);
	box-shadow: 0px 0px 10px rgba(18, 8, 81, 0.15);
	padding: 10px;
	text-align: center;
	-webkit-transition: all 0.3s;
	-o-transition: all 0.3s;
	transition: all 0.3s;
	width: 100%;
	/* height: 80px; */
	align-items: center;
	justify-content: center;
}

.review_a_table table {
	display: inline-flex;
	background: #ffffff;
	-webkit-box-shadow: 0px 0px 10px rgba(18, 8, 81, 0.15);
	box-shadow: 0px 0px 10px rgba(18, 8, 81, 0.15);
	text-align: center;
	-webkit-transition: all 0.3s;
	-o-transition: all 0.3s;
	transition: all 0.3s;
	width: 100%;
	/* height: 80px; */
	align-items: center;
	justify-content: center;
}

.review_a_table tr {
	border-radius: 20px;
	display: flex;
	margin: 10px;
	justify-content: center;
}

.review_a_table tbody {
	margin-top: 30px;
	width: 80%;
}

.review__table table {
	width: 100%;
	margin: 2px;
	/* height: 2em; */
	background-color: white;
}

.review__table th, .review__table td {
	text-align: center;
	justify-content: center;
	/* background-color: white; */
	padding: 10px 0px;
}

.progress__table {
	padding: 20px 25px;
	display: flex;
	background: white;
	-webkit-box-shadow: 0px 0px 10px rgba(18, 8, 81, 0.15);
	box-shadow: 0px 0px 10px rgba(18, 8, 81, 0.15);
	padding: 10px;
	text-align: center;
	-webkit-transition: all 0.3s;
	-o-transition: all 0.3s;
	transition: all 0.3s;
	width: 100%;
	align-items: center;
	justify-content: center;
	margin-bottom: 30px;
}

.progress__table progress {
	width: 100%;
	margin: 2px;
	background-color: white;
	border-radius: 20px;
}

.progress__table table {
	width: 90%;
	margin: 2px;
	background-color: white;
	border-radius: 20px;
}

.progress__table th, .progress__table td {
	text-align: center;
	justify-content: center;
	/* background-color: white; */
	padding: 10px 0px;
}
</style>
</head>
<body>
	<%@ include file="../include/hospital_nav.jsp"%>
	
	<%@ page import="com.grab.hospital.vo.Hospital"%>
	<%@ page import="com.grab.hospital.vo.Review"%>
	<%@ page import="com.grab.hospital.vo.HospitalNotice"%>
	
	
	<% Member member = (Member) session.getAttribute("member"); %>
	<% Hospital hospital = (Hospital) request.getAttribute("hospital"); %>
	<% List<Department> list = (List<Department>) request.getAttribute("resultList"); %>
	<% List<Review> reviews = (List<Review>) request.getAttribute("reviewList"); %>
	<% List<Member> reviewMemberList = (List<Member>) request.getAttribute("reviewMemberList"); %>
	<% List<HospitalNotice> hospitalNotices = (List<HospitalNotice>) request.getAttribute("hospitalNotices"); %>
	<% Map<String, Integer> keywordMap = (Map<String, Integer>) request.getAttribute("keyword"); %>
	<% List<Review> selectedReviewList = (List<Review>) request.getAttribute("selectedReviewList"); %>

	<section class="about-section about__spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-10">
					<div class="about__wrapper">
						<h3><%=hospital.getHospital_name()%></h3>
						<%@ page import="com.grab.hospital.vo.Department, java.util.*"%>
						<%
						for (int i = 0; i < list.size(); i++) {
						%>
						<div class="type__div"><%=list.get(i).getType_content()%></div>
						<%
						}
						%>
					</div>
					<div class="row">
						<div class="about__addr col-lg-8">
							
							<%
							double score = 0.0;
							for (int i = 0; i < reviews.size(); i++) {
								score += reviews.get(i).getReview_score();
							}

							double avg = Math.round(score / reviews.size() * 10) / 10.0;
							%>
							<div>
								<span style="color: #FBE114; font-size: 20px">★</span><%=avg%><span>&nbsp(<%=reviews.size()%>)
								</span>
							</div>
							<div><%=hospital.getHospital_addr()%></div>
						</div>

						<%
						if (m != null && member.getMember_type() == 2) {
						%>
						<div class="col-lg-4">
							<a
								href="/hospital/hospital_request?hospital_no=<%=hospital.getHospital_no()%>"
								class="request-btn" style="position: relative; left: 180px;">정보
								정정 요청</a>
						</div>
						<%
						}
						%>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- About Section End -->

	<!-- Feature Section Begin -->
	<section class="feature-section about__spad">
		<div class="container">
			<div class="row" style="justify-content: center;">
				<div class="homeUrl-title notice__title col-lg-2">
					<a href="#"><h3>공지사항</h3></a>
				</div>
				<div class="review__table">
					<table class="col-lg-12" style="padding: 20px 180px">
						<thead>
						<colgroup>
							<col width="10%">
							<col width="50%">
							<col width="20%">
							<col width="20%">
						</colgroup>
						
						<tr>
							<th style="padding: 10px;"><h5>번호</h5></th>
							<th style="padding: 10px"><h5>공지사항</h5></th>
							<th style="padding: 10px"><h5>작성일</h5></th>
							<th style="padding: 10px"><h5>조회수</h5></th>
						</tr>
						</thead>
						<tbody>
							
							<%
							
							for (int i = hospitalNotices.size() - 1; i >= 0; i--) {
							%>
							<tr>
								<td style="padding: 10px"><%=i + 1%></td>
								<td style="padding: 10px"><%=hospitalNotices.get(i).getNotice_title()%></td>
								<td style="padding: 10px"><%=hospitalNotices.get(i).getNotice_reg_date().getYear()%>-<%=hospitalNotices.get(i).getNotice_reg_date().getMonthValue()%>-<%=hospitalNotices.get(i).getNotice_reg_date().getDayOfMonth()%></td>
								<td style="padding: 10px"><%=hospitalNotices.get(i).getNotice_view()%></td>
							</tr>
							<%
							}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</section>
	<!-- Services Section End -->

	<!-- Team Section Begin -->
	<section class="team-section about__spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="homeUrl-title normal-title">
						<h3>진료시간</h3>
					</div>
				</div>
			</div>
			<div class="row">
				<!-- 진료시간 구현 필요 -->
			</div>
		</div>
	</section>
	<!-- Team Section End -->

	<!-- 주소 -->
	<section class="team-section about__spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="homeUrl-title normal-title">
						<h3>주소</h3>
					</div>
					<div></div>
					<div>
						<div class="hompage_url__item" id="addr">
							<%=hospital.getHospital_addr()%>
						</div>
						<div class="hompage_url__item" id="map"
							style="padding: 158px 100px"></div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="col">
						<div class="homeUrl-title normal-title">
							<h3>의사 수</h3>
						</div>
						<div class="hompage_url__item">
							<p><%=hospital.getHospital_doctor_num()%></p>
						</div>
						<div class="homeUrl-title normal-title">
							<h3>홈페이지</h3>
						</div>
						<div class="hompage_url__item">
							<a href=<%=hospital.getHospital_homepage()%>><p><%=hospital.getHospital_homepage()%></p></a>
						</div>
						<div class="homeUrl-title normal-title">
							<h3>전화번호</h3>
						</div>
						<div class="hompage_url__item">
							<p><%=hospital.getHospital_phone()%></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- 리뷰 Begin -->


	<section class="team-section spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="homeUrl-title normal-title">
						<h3>리뷰</h3>
					</div>
				</div>
			</div>
			<%
			if (m != null && member.getMember_type() == 2) {
			%>
			<a class="create__review" href="/hospital/create_review?hospital_no=<%=hospital.getHospital_no()%>">리뷰작성</a>
			<%
			}
			%>
			<div>
				<div class="progress__table">
					<table>
						<colgroup>
							<col width="10%">
							<col width="90%">
						</colgroup>
						<tr>
							<th style="width: 5em;">친절</th>
							<td><progress value="<%=keywordMap != null && keywordMap.get("1") == null ? 0 : keywordMap.get("1")%>" max="<%=reviews.size()%>"></progress></td>
						</tr>
						<tr>
							<th>위생</th>
							<td><progress value="<%=keywordMap != null && keywordMap.get("2") == null ? 0 : keywordMap.get("2")%>" max="<%=reviews.size()%>"></progress></td>
						</tr>
						<tr>
							<th>시설</th>
							<td><progress value="<%=keywordMap != null && keywordMap.get("3") == null ? 0 : keywordMap.get("3")%>" max="<%=reviews.size()%>"></progress></td>
						</tr>
						<tr>
							<th>꼼꼼함</th>
							<td><progress value="<%=keywordMap != null && keywordMap.get("4") == null ? 0 : keywordMap.get("4")%>" max="<%=reviews.size()%>"></progress></td>
						</tr>
						<tr>
							<th>대기</th>
							<td><progress value="<%=keywordMap != null && keywordMap.get("5") == null ? 0 : keywordMap.get("5")%>" max="<%=reviews.size()%>"></progress></td>
						</tr>
					</table>
				</div>
			</div>

			<div id="reviewContainer">
				<%
				Review paging = (Review) request.getAttribute("reviewPaging");
				%>

				<%
				int nowPage = 1;
				if (request.getParameter("nowPage") != null) {
					nowPage = Integer.parseInt(request.getParameter("nowPage"));
				}
				%>
				<div class="">
					<div id="content" class="review_a_table">
						<table>
							<!-- 데이터 출력 -->
							<% if (paging != null) {
								for (int i = 0; i < selectedReviewList.size(); i++) { %>
							<tr style="background-color: #f0f0f0;">
								<td style="padding: 10px; width: 10%;">
								<%=reviewMemberList.get(i).getMember_id()%>
								<%if(selectedReviewList.get(i).get) %>
								<div class="badge bg-success">리뷰인증</div>
								</td>
								<td style="padding: 10px; color: #f8dd11; width: 20%; font-size: 14px;	">
									<% for (int j = 0; j < selectedReviewList.get(i).getReview_score(); j++) { %>
										★ 
									<% } %> 
									<% for (int j = 0; j < 5 - selectedReviewList.get(i).getReview_score(); j++) { %>
										☆ 
									<% }%>
								</td>
								<td style="padding: 10px; width: 50%;"><%=selectedReviewList.get(i).getReview_content()%></td>
								<td style="padding: 10px; width: 20%;"><%=selectedReviewList.get(i).getReg_date().getYear()%>-<%=selectedReviewList.get(i).getReg_date().getMonthValue()%>-<%=selectedReviewList.get(i).getReg_date().getDayOfMonth()%>
									<%if(selectedReviewList.get(i).getMember_no() == member.getMember_no()) {%>
										<div>
											<a href="#"><svg xmlns="http://www.w3.org/2000/svg" style="width:12px;" viewBox="0 0 512 512"><path d="M362.7 19.3L314.3 67.7 444.3 197.7l48.4-48.4c25-25 25-65.5 0-90.5L453.3 19.3c-25-25-65.5-25-90.5 0zm-71 71L58.6 323.5c-10.4 10.4-18 23.3-22.2 37.4L1 481.2C-1.5 489.7 .8 498.8 7 505s15.3 8.5 23.7 6.1l120.3-35.4c14.1-4.2 27-11.8 37.4-22.2L421.7 220.3 291.7 90.3z"/></svg></a>
											&nbsp;
											<a href="#"><svg xmlns="http://www.w3.org/2000/svg" style="width:12px;" viewBox="0 0 448 512"><path d="M135.2 17.7L128 32 32 32C14.3 32 0 46.3 0 64S14.3 96 32 96l384 0c17.7 0 32-14.3 32-32s-14.3-32-32-32l-96 0-7.2-14.3C307.4 6.8 296.3 0 284.2 0L163.8 0c-12.1 0-23.2 6.8-28.6 17.7zM416 128L32 128 53.2 467c1.6 25.3 22.6 45 47.9 45l245.8 0c25.3 0 46.3-19.7 47.9-45L416 128z"/></svg></a>
										</div>
									<%} %>
								</td>
								
							</tr>
							<% } } %>
							<tr>
								<td colspan="4">
									<div class="pagination" id="pagination">
										<% if (paging != null) { %>
											<% if (paging.isPrev()) { %>
												<a href="#content" data-page="<%=(paging.getPageBarStart() - 1)%>" style="z-index: 8;">&laquo;</a>
											<% } %>
											<% for (int i = paging.getPageBarStart(); i <= paging.getPageBarEnd(); i++) { %>
												<a href="#content" data-page="<%=i%>" class="<%=paging.getNowPage() == i ? "active" : ""%>"><%=i%></a>
											<% } %>
											<% if (paging.isNext()) { %>
												<a href="#content" data-page="<%=(paging.getPageBarEnd() + 1)%>">&raquo;</a>
											<% } %>
										<% } %>
									</div>
								</td>
							</tr>
						</table>
					</div>
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
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4f36ed28a98f155fac9a64b707114d9c"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services"></script>

	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		var addr = document.getElementById("addr").innerText;
		console.log(addr);
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch("서울특별시 관악구 관악로 1" , function(result, status) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
		        });
		        infowindow.open(map, marker);
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});    
	</script>

	<script>
		window.onload = function() {
	        var alertMessage = "<%=(String) request.getAttribute("alertMessage")%>
			if (alertMessage != null && alertMessage != "" && alertMessage != "null") {
				alert(alertMessage);
			}
		};
	</script>
</body>
</html>