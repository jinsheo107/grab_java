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
    
    .review__table table {
      width: 100%;
      margin: 2px;
      /* height: 2em; */
      background-color: white;
      border-radius: 20px;
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
	<section class="about-section about__spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-10">
					<div class="about__wrapper">
						<%
						Hospital h = (Hospital) request.getAttribute("hospital");
						%>
						<h3><%=h.getHospital_name()%></h3>
						<%@ page import="com.grab.hospital.vo.Department, java.util.*"%>
						<%
						List<Department> list = (List<Department>) request.getAttribute("resultList");
						for (int i = 0; i < list.size(); i++) {
						%>
						<div class="type__div"><%=list.get(i).getType_content()%></div>
						<%
						}
						%>
					</div>
					<div class="row">
						<div class="about__addr col-lg-8">
						<%@ page import="com.grab.hospital.vo.Review" %>
						<% 
							List<Review> reviews = (List<Review>)request.getAttribute("reviewList");
							double score = 0.0;
							for(int i = 0; i < reviews.size(); i++) {
								score += reviews.get(i).getReview_score();
							}
							
							double avg = Math.round(score / reviews.size() * 10) / 10.0;
						%>
							<div><span style="color: #FBE114; font-size: 20px">★</span><%= avg %><span>&nbsp(<%= reviews.size() %>)</span></div>
							<div><%=h.getHospital_addr()%></div>
						</div>
						
						<!-- <div class="col-lg-4">
							<a href="/hospital/hospital_request" class="request-btn"
								style="position: relative; left: 180px;">정보 정정 요청</a>
						</div> -->
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- About Section End -->

	<!-- Feature Section Begin -->
	<section class="feature-section about__spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 notice__div">
					<div class="homeUrl-title notice__title">
						<a href="#">
							<h3>공지사항</h3>
						</a>
					</div>
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
			<div class="row"></div>
		</div>
	</section>
	<!-- Team Section End -->

	<!-- 가격표 -->
	<section class="team-section about__spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="homeUrl-title normal-title">
						<h3>가격표</h3>
					</div>
				</div>
			</div>
			<div style="display: flex; justify-content: center;">
			<div class="detail__price" style="justify-content: center; text-align: center;">
				<table class="col-lg-12">
					<colgroup>
						<col width="50%">
						<col width="50%">
					</colgroup>
					<thead>
						<tr>
							<th style="padding: 10px"><h5>진료항목</h5></th>
							<th style="padding: 10px"><h5>가격</h5></th>
						</tr>
					</thead>
					<tbody>
						<%@ page import="com.grab.hospital.vo.HospitalPrice" %>
						<% 
							List<HospitalPrice> hospitaPrices = (List<HospitalPrice>)request.getAttribute("priceList"); 
							for(int i = 0; i < hospitaPrices.size(); i++) {
						%>
								<tr>
									<td style="padding: 10px"><%=hospitaPrices.get(i).getType() %></td>
									<td style="padding: 10px"><%=hospitaPrices.get(i).getPrice() %></td>
								</tr>
						<%}%>
					</tbody>
				</table>
				
			</div>
			</div>
		</div>
	</section>

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
						<div class="hompage_url__item">
							<%=h.getHospital_addr()%>
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
              <p><%= h.getHospital_doctor_num() %></p>
            </div>
            <div class="homeUrl-title normal-title">
              <h3>홈페이지</h3>
            </div>
            <div class="hompage_url__item">
              <a href=<%= h.getHospital_homepage() %>><p><%= h.getHospital_homepage() %></p></a>
            </div>
            <div class="homeUrl-title normal-title">
              <h3>전화번호</h3>
            </div>
            <div class="hompage_url__item">
              <p><%= h.getHospital_phone() %></p>
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
				<a class="create__review" href="/hospital/create_review">리뷰작성</a>
			<div>
				<div class="progress__table">
					<table>
					<colgroup>
						<col width="10%">
						<col width="90%">
					</colgroup>
						<tr>
							<th style="width: 5em;">친절
							</td>
							<td><progress value="20" max="100"></progress></td>
						</tr>
						<tr>
							<th>위생
							</td>
							<td><progress value="20" max="100"></progress></td>
						</tr>
						<tr>
							<th>시설
							</td>
							<td><progress value="20" max="100"></progress></td>
						</tr>
						<tr>
							<th>꼼꼼함
							</td>
							<td><progress value="20" max="100"></progress></td>
						</tr>
						<tr>
							<th>대기
							</td>
							<td><progress value="20" max="100"></progress></td>
						</tr>
					</table>
				</div>
			</div>
			<div>
			<div class="review__table">
				<table class="col-lg-12" style="padding: 20px 180px">
					<colgroup>
						<col width="10%">
						<col width="50%">
						<col width="20%">
						<col width="20%">
					</colgroup>
					<thead>
						<tr>
							<th style="padding: 10px;"><h5 style="text-decoration: underline #f8dd11 3px;">별점</h5></th>
							<th style="padding: 10px"><h5 style="text-decoration: underline #f8dd11 3px;">리뷰</h5></th>
							<th style="padding: 10px"><h5 style="text-decoration: underline #f8dd11 3px;">작성자</h5></th>
							<th style="padding: 10px"><h5 style="text-decoration: underline #f8dd11 3px;">작성일</h5></th>
						</tr>
					</thead>
					<tbody>
						<% 
							for(int i = 0; i < reviews.size(); i++) {
						%>
								<tr>
									<td style="padding: 10px"><%=reviews.get(i).getReview_score() %></td>
									<td style="padding: 10px"><%=reviews.get(i).getReview_content() %></td>
									<td style="padding: 10px"><%=reviews.get(i).getMember_no() %></td>
									<td style="padding: 10px"><%=reviews.get(i).getReg_date().getYear() %>-<%=reviews.get(i).getReg_date().getMonthValue() %>-<%=reviews.get(i).getReg_date().getDayOfMonth() %></td>
								</tr>
						<%}%>
					</tbody>
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
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4f36ed28a98f155fac9a64b707114d9c"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center : new kakao.maps.LatLng(33.450701, 126.570667),
			level : 3
		};

		var map = new kakao.maps.Map(container, options);
	</script>
</body>
</html>