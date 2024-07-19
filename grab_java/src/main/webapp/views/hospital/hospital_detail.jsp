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
						<% List<Review> selectedReviewList = (List<Review>)request.getAttribute("selectedReviewList"); %>
						<tr>
							<th style="padding: 10px;"><h5>번호</h5></th>
							<th style="padding: 10px"><h5>공지사항</h5></th>
							<th style="padding: 10px"><h5>작성일</h5></th>
							<th style="padding: 10px"><h5>조회수</h5></th>
						</tr>
					</thead>
	 				<tbody> 					
	 					<%@ page import="com.grab.hospital.vo.HospitalNotice" %>
						<% 
							List<HospitalNotice> hospitalNotices = (List<HospitalNotice>)request.getAttribute("hospitalNotices"); 
							for(int i = hospitalNotices.size() - 1; i >= 0; i--) {
						%>
						<tr>
							<td style="padding: 10px"><%= i + 1%></td>
							<td style="padding: 10px"><%= hospitalNotices.get(i).getNotice_title()%></td>
							<td style="padding: 10px"><%= hospitalNotices.get(i).getNotice_reg_date().getYear() %>-<%= hospitalNotices.get(i).getNotice_reg_date().getMonthValue() %>-<%= hospitalNotices.get(i).getNotice_reg_date().getDayOfMonth() %></td>
							<td style="padding: 10px"><%= hospitalNotices.get(i).getNotice_view()%></td>
						</tr>
						<%}%>
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
						<div class="hompage_url__item" id="addr"> <%=h.getHospital_addr()%> </div>
						<div class="hompage_url__item" id="map" style="padding: 158px 100px"></div>
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
	<% Map<String, Integer> map = (Map<String, Integer>) request.getAttribute("keyword"); %>
	
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
							<th style="width: 5em;">친절</th>
							<td><progress value="<%= map.get("1")%>" max="<%= reviews.size() %>"></progress></td>
						</tr>
						<% %>
						<tr>
							<th>위생</th>
							<td><progress value="<%= map.get("2")%>" max="<%= reviews.size() %>"></progress></td>
						</tr>
						<tr>
							<th>시설</th>
							<td><progress value="<%= map.get("3")%>" max="<%= reviews.size() %>"></progress></td>
						</tr>
						<tr>
							<th>꼼꼼함</th>
							<td><progress value="<%= map.get("4")%>" max="<%= reviews.size() %>"></progress></td>
						</tr>
						<tr>
							<th>대기</th>
							<td><progress value="<%= map.get("5")%>" max="<%= reviews.size() %>"></progress></td>
						</tr>
					</table>
				</div>
			</div>
			<div>
		</section>
		
		
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
            <div id="reviewContainer">
                <!-- Ajax로 리뷰 데이터를 로드할 영역 -->
            </div>
            <div class="pagination" id="pagination">
                <!-- Ajax로 페이징 버튼을 로드할 영역 -->
            </div>
        </div>
    </section>
	
	
	

	<%@ include file="../include/footer.jsp"%>

	<script src="../../resources/js/common/jquery-3.7.1.js"></script>
	<script src="../../resources/js/common/bootstrap.min.js"></script>
	<script src="../../resources/js/common/jquery.slicknav.js"></script>
	<script src="../../resources/js/common/owl.carousel.min.js"></script>
	<script src="../../resources/js/common/main.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4f36ed28a98f155fac9a64b707114d9c"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services"></script>
	
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
        $(document).ready(function() {
            loadReviews(1);

            function loadReviews(page) {
                $.ajax({
                    url: '/hospital/get_reviews',
                    type: 'GET',
                    data: { nowPage: page },
                    success: function(data) {
                        renderReviews(data.reviews);
                        renderPagination(data.pagination);
                    }
                });
            }

            function renderReviews(reviews) {
                var reviewHtml = '<div class="review__table"><table class="col-lg-12" style="padding: 20px 180px"><thead><colgroup><col width="10%"><col width="50%"><col width="20%"><col width="20%"></colgroup><tr><th style="padding: 10px;"><h5 style="text-decoration: underline #f8dd11 3px;">별점</h5></th><th style="padding: 10px"><h5 style="text-decoration: underline #f8dd11 3px;">리뷰</h5></th><th style="padding: 10px"><h5 style="text-decoration: underline #f8dd11 3px;">작성자</h5></th><th style="padding: 10px"><h5 style="text-decoration: underline #f8dd11 3px;">작성일</h5></th></tr></thead><tbody>';

                reviews.forEach(function(review) {
                    reviewHtml += '<tr>';
                    reviewHtml += '<td style="padding: 10px">' + review.review_score + '</td>';
                    reviewHtml += '<td style="padding: 10px">' + review.review_content + '</td>';
                    reviewHtml += '<td style="padding: 10px">' + review.member_no + '</td>';
                    reviewHtml += '<td style="padding: 10px">' + review.reg_date + '</td>';
                    reviewHtml += '</tr>';
                });

                reviewHtml += '</tbody></table></div>';
                $('#reviewContainer').html(reviewHtml);
            }

            function renderPagination(pagination) {
                var paginationHtml = '';

                if (pagination.isPrev) {
                    paginationHtml += '<a href="#" class="page-link" data-page="' + (pagination.pageBarStart - 1) + '">&laquo;</a>';
                }

                for (var i = pagination.pageBarStart; i <= pagination.pageBarEnd; i++) {
                    paginationHtml += '<a href="#" class="page-link" data-page="' + i + '">' + i + '</a>';
                }

                if (pagination.isNext) {
                    paginationHtml += '<a href="#" class="page-link" data-page="' + (pagination.pageBarEnd + 1) + '">&raquo;</a>';
                }

                $('#pagination').html(paginationHtml);

                $('.page-link').click(function(e) {
                    e.preventDefault();
                    var page = $(this).data('page');
                    loadReviews(page);
                });
            }
        });
    </script>
</body>
</html>