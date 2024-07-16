<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원상세페이지</title>
  <!-- Google Font -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,600,700,800,900&display=swap" rel="stylesheet">

  <!-- Css Styles -->
  <link rel="stylesheet" href="../../resources/css/common/폰트.css">
  <link rel="stylesheet" href="../../resources/css/common/bootstrap.min.css" type="text/css">
  <link rel="stylesheet" href="../../resources/css/common/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="../../resources/css/common/elegant-icons.css" type="text/css">
  <link rel="stylesheet" href="../../resources/css/common/flaticon.css" type="text/css">
  <link rel="stylesheet" href="../../resources/css/common/owl.carousel.min.css" type="text/css">
  <link rel="stylesheet" href="../../resources/css/common/slicknav.min.css" type="text/css">
  <link rel="stylesheet" href="../../resources/css/common/style.css" type="text/css">
</head>
<body>
	<%@ include file="../include/hospital_nav.jsp" %>
	
	<section class="about-section about__spad">
    <div class="container">
      <div class="row">
        <div class="col-lg-10">
          <div class="about__wrapper">
            <h3>가남이비인후과</h3>
            <div class="type__div">이비인후과</div>
            <div class="type__div">이비인후과</div>
            <div class="type__div">이비인후과</div>
          </div>
          <div class="row">
            <div class="about__addr col-lg-8">
              <div>별점</div>
              <div>주소</div>
            </div>
            <div class="col-lg-4">
              <a href="/hospital/hospital_request" class="request-btn" style="position: relative; left: 180px;">정보 정정 요청</a>
            </div>
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
      <div class="row">

      </div>
    </div>
  </section>
  <!-- Team Section End -->

  <!-- 홈페이지 및 전화번호 -->
  <section class="team-section about__spad">
    <div class="container">
      <div class="row">
        <div class="col-lg-6">
          <div class="homeUrl-title normal-title">
            <h3>홈페이지</h3>
          </div>
          <div class="hompage_url__item">
            <p>URL</p>
          </div>
        </div>
        <div class="col-lg-6">
          <div class="homeUrl-title normal-title">
            <h3>전화번호</h3>
          </div>
          <div class="hompage_url__item">
            <p>010-1111-2222</p>
          </div>
        </div>
      </div>
    </div>
  </section>

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
      <div class="row">

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
          <div>
            <div class="hompage_url__item" id="map" style="padding: 200px 100px">
            	
          	</div>	
          </div>
        </div>
        <div class="col-lg-6">
          <div class="homeUrl-title normal-title">
            <h3>의사 수</h3>
          </div>
          <div class="hompage_url__item">
            <p>3</p>
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
      <div class="create__review">
        <a href="#">리뷰작성</a>
      </div>
      <div class="table__margin">
        <div class="about__table">
          <table>
            <tr>
              <th style="width: 5em;">친절</td>
              <td><progress value="20" max="100"></progress></td>
            </tr>
            <tr>
              <th>위생</td>
              <td><progress value="20" max="100"></progress></td>
            </tr>
            <tr>
              <th>시설</td>
              <td><progress value="20" max="100"></progress></td>
            </tr>
            <tr>
              <th>꼼꼼함</td>
              <td><progress value="20" max="100"></progress></td>
            </tr>
            <tr>
              <th>대기</td>
              <td><progress value="20" max="100"></progress></td>
            </tr>
          </table>
        </div>
      </div>
      <div class="row">

      </div>
    </div>
  </section>
  
  <%@ include file="../include/footer.jsp" %>
	
	<script src="../../resources/js/common/jquery-3.7.1.js"></script>
  <script src="../../resources/js/common/bootstrap.min.js"></script>
  <script src="../../resources/js/common/jquery.slicknav.js"></script>
  <script src="../../resources/js/common/owl.carousel.min.js"></script>
  <script src="../../resources/js/common/main.js"></script>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4f36ed28a98f155fac9a64b707114d9c"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
	</script>
</body>
</html>