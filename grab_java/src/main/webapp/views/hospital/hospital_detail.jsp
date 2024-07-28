	<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>병원상세페이지</title>
	<!-- Google Font -->
	
	
	<link
		href="https://fonts.googleapis.com/css?family=Montserrat:400,500,600,700,800,900&display=swap"
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
		<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4f36ed28a98f155fac9a64b707114d9c"></script>
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
	
		<%@ include file="../include/hospital_nav.jsp"%>
	
		<%@ page import="com.grab.hospital_detail.vo.Hospital"%>
		<%@ page import="com.grab.hospital_detail.vo.Review"%>
		<%@ page import="com.grab.hospital_detail.vo.HospitalNotice"%>
	
	
		<%
		Member member = (Member) session.getAttribute("member");
		%>
		<%
		Hospital hospital = (Hospital) request.getAttribute("hospital");
		%>
		<%
		List<Department> list = (List<Department>) request.getAttribute("resultList");
		%>
		<%
		List<Review> reviews = (List<Review>) request.getAttribute("reviewList");
		%>
		<%
		List<Member> reviewMemberList = (List<Member>) request.getAttribute("reviewMemberList");
		%>
		<%
		List<HospitalNotice> hospitalNotices = (List<HospitalNotice>) request.getAttribute("hospitalNotices");
		%>
		<%
		Map<String, Integer> keywordMap = (Map<String, Integer>) request.getAttribute("keyword");
		%>
		<%
		List<Review> selectedReviewList = (List<Review>) request.getAttribute("selectedReviewList");
		%>
	
		<section class="about-section about__spad">
			<div class="container">
				<div class="row">
					<div class="col-lg-10">
						<div class="about__wrapper">
							<h3><%=hospital.getHospital_name()%></h3>
							<%@ page import="com.grab.hospital_detail.vo.Department, java.util.*"%>
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
								if (!hospitalNotices.isEmpty()) {
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
								} else {
								%>
								<tr>
									<td colspan="4">공지사항이 없습니다.</td>
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
					<div class="review__table">
						<table>
							<tr>
								<th>진료시간</th>
								<th>점심시간</th>
							</tr>
							<tr>
								<td><%=hospital.getHospital_time()%></td>
								<td><%=hospital.getHospital_lunch_time()%></td>
							</tr>
						</table>
					</div>
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
				<a class="create__review"
					href="/hospital/create_review?hospital_no=<%=hospital.getHospital_no()%>">리뷰작성</a>
				<%
				}
				%>
				<div>
					<div class="progress__table">
						<%
						if (keywordMap != null && !keywordMap.isEmpty()) {
						%>
						<table>
							<colgroup>
								<col width="10%">
								<col width="90%">
							</colgroup>
							<tr>
								<th style="width: 5em;">친절</th>
								<td><progress
										value="<%=keywordMap.get("1") == null ? 0 : keywordMap.get("1")%>"
										max="<%=reviews.size()%>"></progress></td>
							</tr>
							<tr>
								<th>위생</th>
								<td><progress
										value="<%=keywordMap.get("2") == null ? 0 : keywordMap.get("2")%>"
										max="<%=reviews.size()%>"></progress></td>
							</tr>
							<tr>
								<th>시설</th>
								<td><progress
										value="<%=keywordMap.get("3") == null ? 0 : keywordMap.get("3")%>"
										max="<%=reviews.size()%>"></progress></td>
							</tr>
							<tr>
								<th>꼼꼼함</th>
								<td><progress
										value="<%=keywordMap.get("4") == null ? 0 : keywordMap.get("4")%>"
										max="<%=reviews.size()%>"></progress></td>
							</tr>
							<tr>
								<th>대기</th>
								<td><progress
										value="<%=keywordMap.get("5") == null ? 0 : keywordMap.get("5")%>"
										max="<%=reviews.size()%>"></progress></td>
							</tr>
						</table>
						<%
						} else {
						%>
						<table>
							<colgroup>
								<col width="10%">
								<col width="90%">
							</colgroup>
							<tr>
								<th style="width: 5em;">친절</th>
								<td><progress value="0%>" max="<0"></progress></td>
							</tr>
							<tr>
								<th>위생</th>
								<td><progress value="0%>" max="<0"></progress></td>
							</tr>
							<tr>
								<th>시설</th>
								<td><progress value="0%>" max="<0"></progress></td>
							</tr>
							<tr>
								<th>꼼꼼함</th>
								<td><progress value="0%>" max="<0"></progress></td>
							</tr>
							<tr>
								<th>대기</th>
								<td><progress value="0%>" max="<0"></progress></td>
							</tr>
						</table>
	
						<%
						}
						%>
					</div>
				</div>
	
	
				<%
				if (member != null) {
					if (!selectedReviewList.isEmpty()) {
				%>
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
								<%
								if (paging != null && selectedReviewList != null && !selectedReviewList.isEmpty() && reviewMemberList != null
										&& !reviewMemberList.isEmpty()) {
									for (int i = 0; i < selectedReviewList.size(); i++) {
								%>
								<tr style="background-color: #f0f0f0;">
									<td style="padding: 10px; width: 10%;"><%=reviewMemberList.get(i).getMember_id().substring(0, 3) + "***"%>
										<%
										if ("Y".equals(selectedReviewList.get(i).getReview_check())) {
										%>
										<div class="badge bg-success">리뷰인증</div> <%
										 }
										 %>
									</td>
									<td
										style="padding: 10px; color: red; width: 20%; font-size: 14px;">
										<%
										for (int j = 0; j < selectedReviewList.get(i).getReview_score(); j++) {
										%> ★ <%
										}
										%> <%
	 									for (int j = 0; j < 5 - selectedReviewList.get(i).getReview_score(); j++) {
										%> ☆ <%
										}
										%>
									</td>
									<td style="padding: 10px; width: 50%;"><%=selectedReviewList.get(i).getReview_content()%></td>
									<td style="padding: 10px; width: 20%;"><%=selectedReviewList.get(i).getReg_date().getYear()%>-<%=selectedReviewList.get(i).getReg_date().getMonthValue()%>-<%=selectedReviewList.get(i).getReg_date().getDayOfMonth()%>
										<%
										if (selectedReviewList.get(i).getMember_no() == member.getMember_no()) {
										%>
										<div>
											<a
												href="/review/modify?review_no=<%=selectedReviewList.get(i).getReview_no()%>&hospital_no=<%=hospital.getHospital_no()%>"><svg
													xmlns="http://www.w3.org/2000/svg" width="20" height="20"
													class="bi bi-pencil-square " viewBox="0 0 16 16">
						              <path
														d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
						              <path fill-rule="evenodd"
														d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5z" />
						            	</svg> </a> &nbsp; <a href="javascript:void(0);"
												onclick="confirmDelete(<%=selectedReviewList.get(i).getReview_no()%>, <%=hospital.getHospital_no()%>)">
												<svg xmlns="http://www.w3.org/2000/svg" width="20"
													height="20" class="bi bi-trash delete" viewBox="0 0 16 16">
												        <path
														d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0z" />
												        <path
														d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4zM2.5 3h11V2h-11z" />
												    </svg>
											</a>
										</div> <%
	 }
	 %></td>
	
								</tr>
								<%
								}
								%>
								<tr>
									<td colspan="4">
										<div class="pagination" id="pagination">
											<%
											if (paging != null) {
											%>
											<%
											if (paging.isPrev()) {
											%>
											<a
												href="/hospital/hospital_detail?hospital_no=<%=hospital.getHospital_no()%>&nowPage=<%=(paging.getPageBarStart() - 1)%>#content">&laquo;</a>
											<%
											}
											%>
											<%
											for (int i = paging.getPageBarStart(); i <= paging.getPageBarEnd(); i++) {
											%>
											<a
												href="/hospital/hospital_detail?hospital_no=<%=hospital.getHospital_no()%>&nowPage=<%=i%>#content"
												<%=paging.getNowPage() == i ? "class='active'" : " "%>><%=i%></a>
											<%
											}
											%>
											<%
											if (paging.isNext()) {
											%>
											<a
												href="/hospital/hospital_detail?hospital_no=<%=hospital.getHospital_no()%>&nowPage=<%=(paging.getPageBarEnd() + 1)%>#content">&raquo;</a>
											<%
											}
											%>
											<%
											}
											%>
										</div>
									</td>
									<%
									} else {
									%>
									<div>
										<div class="review_a_table">
											<table>
												<tr>
													<td>
														<div style="margin-bottom: 20px;">작성된 리뷰가 없습니다</div>
													</td>
												</tr>
											</table>
										</div>
									</div>
									<%
									}
									%>
									<%
									}
									%>
								</tr>
							</table>
						</div>
					</div>
				</div>
	
				<%
				} else {
				%>
				<div>
					<div id="content" class="progress__table">
						<table>
							<tr>
								<td>
									<div>로그인 시 확인 가능합니다!</div>
								</td>
							</tr>
							<tr>
								<td><a class="searchBtn"
									href="/member/login?hospital_no=<%=hospital.getHospital_no()%>">로그인</a>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<%
				}
				%>
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
	
	
	
	
		<script>
			function confirmDelete(review_no, hospital_no) {
	        if (confirm("정말로 이 리뷰를 삭제하시겠습니까?")) {
	            window.location.href = "/review/delete?review_no=" + review_no + "&hospital_no=" + hospital_no;
	        }
	    }
		</script>
	
		<script>
			window.onload = function() {
		        var alertMessage = "<%=(String) request.getAttribute("alertMessage")%>
				if (alertMessage != null && alertMessage != "" && alertMessage != "null") {
					alert(alertMessage);
				}
			};
			
			document.addEventListener("DOMContentLoaded", function() {
		        var contentElement = document.getElementById("content");
		        if (contentElement) {
		            contentElement.scrollIntoView({ behavior: 'instant', block: 'start' });
		        }
		    });
		</script>
	</body>
	</html>