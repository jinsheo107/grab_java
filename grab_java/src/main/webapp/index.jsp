<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여기아파</title>
  <!-- Google Font -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

  <!-- Css Styles -->
  <link rel="stylesheet" href="폰트.css">
  <link rel="stylesheet" href="resources/css/common/bootstrap.min.css" type="text/css">
  <link rel="stylesheet" href="resources/css/common/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="resources/css/common/elegant-icons.css" type="text/css">
  <link rel="stylesheet" href="resources/css/common/flaticon.css" type="text/css">
  <link rel="stylesheet" href="resources/css/common/owl.carousel.min.css" type="text/css">
  <link rel="stylesheet" href="resources/css/common/slicknav.min.css" type="text/css">
  <link rel="stylesheet" href="resources/css/common/style.css" type="text/css">
</head>
<body>
	<%@ include file="views/include/hospital_nav.jsp" %>
<%-- 	<% session.setAttribute("member_type", 1); %>
	<% session.setAttribute("member_no", 1); %>
	<% session.setAttribute("member_id", "admin"); %> --%>
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
      </div>
    </div>
  </section>
  
  <section class="services-section spad">
    <div class="container">
      <div class="row">
        <div class="col-lg-8">
          <div class="section-title">
            <h3>원하시는 과를 선택하세요!</h3>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-8">
          <div class="row">
            <div class="col-lg-3 col-md-3 col-sm-6">
              <div class="services__item">
                <h5 style="margin: 0px;">안과</h5>
              </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6">
              <div class="services__item">
                <h5 style="margin: 0px;">치과</h5>
              </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6">
              <div class="services__item">
                <h5 style="margin: 0px;">성형외과</h5>
              </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6">
              <div class="services__item">
                <h5 style="margin: 0px;">피부과</h5>
              </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6">
              <div class="services__item">
                <h5 style="margin: 0px;">한의원</h5>
              </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6">
              <div class="services__item">
                <h5 style="margin: 0px;">비뇨기과</h5>
              </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6">
              <div class="services__item">
                <h5 style="margin: 0px;">산부인과</h5>
              </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6">
              <div class="services__item">
                <h5 style="margin: 0px;">내과</h5>
              </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6">
              <div class="services__item">
                <h5 style="margin: 0px;">정신건강의학과</h5>
              </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6">
              <div class="services__item">
                <h5 style="margin: 0px;">이비인후과</h5>
              </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6">
              <div class="services__item">
                <h5 style="margin: 0px;">가정의학과</h5>
              </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6">
              <div class="services__item">
                <h5 style="margin: 0px;">정형외과</h5>
              </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6">
              <div class="services__item">
                <h5 style="margin: 0px;">재활의학과</h5>
              </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6">
              <div class="services__item">
                <h5 style="margin: 0px;">신경외과</h5>
              </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6">
              <div class="services__item">
                <h5 style="margin: 0px;">마취통증의학과</h5>
              </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6">
              <div class="services__item">
                <h5 style="margin: 0px;">외과</h5>
              </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6">
              <div class="services__item">
                <h5 style="margin: 0px;">신경과</h5>
              </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6">
              <div class="services__item">
                <h5 style="margin: 0px;">영상의학과</h5>
              </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6">
              <div class="services__item">
                <h5 style="margin: 0px;">소아과</h5>
              </div>
            </div>
          </div>
        </div>
        
        <%if(m == null) {%>
        <div class="col-lg-3">
          <div class="row">
            <div class="col-lg-12 col-md-3 col-sm-6">
            <a href="views/member/memberLogin/login.jsp">
              <div class="log__item">
                <h5>로그인</h5>       
              </div>
              </a>
            </div>
          </div>
        </div>
        <%} else if(m.getMember_type() == 2) {%>
        	<div class="col-lg-3">
          <div class="row">
            <div class="col-lg-12 col-md-3 col-sm-6">
              <div class="log__item">
                <h5><%=m.getMember_id() %>님 환영합니다!</h5>
              </div>
            </div>
          </div>
        </div>
        <%} else if(m.getMember_type() == 3) {%>
        <%@ page import="com.grab.hospital_detail.vo.Hospital" %>
        <% Hospital hospital = (Hospital)session.getAttribute("hospital"); %>
        <div class="col-lg-3">
          <div class="row">
            <div class="col-lg-12 col-md-3 col-sm-6">
              <div class="log__item">
                <h5><%=hospital.getHospital_name() %>님 환영합니다!</h5>
              </div>
            </div>
          </div>
        </div>
        <%} else {%>
        <div class="col-lg-3">
          <div class="row">
            <div class="col-lg-12 col-md-3 col-sm-6">
              <div class="log__item">
                <h5>관리자님 환영합니다!</h5>
              </div>
            </div>
          </div>
        </div>
        <%} %>
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
  
  <script src="resources/js/common/jquery-3.7.1.js"></script>
  <script src="resources/js/common/bootstrap.min.js"></script>
  <script src="resources/js/common/jquery.slicknav.js"></script>
  <script src="resources/js/common/owl.carousel.min.js"></script>
  <script src="resources/js/common/main.js"></script>
  
</body>

</html>