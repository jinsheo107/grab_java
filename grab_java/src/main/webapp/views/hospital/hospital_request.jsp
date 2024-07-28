<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원정보수정요청</title>
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
  <link rel="stylesheet" href="../../resources/css/community/게시글 리스트.css" type="text/css">
</head>
<body>
	<%@ include file="../include/hospital_nav.jsp" %>
	<% int hospital_no = (int)request.getAttribute("hospital_no"); %>
	
	<section class="feature-section about__spad" style="background-color: white; margin-top: 50px;">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="essentail__div">
            <h3>정보수정요청</h3>
            <!-- <hr> -->
            <form action="/hospital/requestEnd" name="hospital_request" method="post">
              <div class="request__btn">
              	<input type="hidden" value="<%= m.getMember_no() %>" name="member_no">
              	<input type="hidden" value="<%= hospital_no %>" name="hospital_no">
                <input type="button" value="제출하기" class="searchBtn" onclick="requestHospitalForm();">
              </div>
              <div class="request__element">
                <div>
                  <h4>요소</h4>
                  <hr>
                </div>
                <div>
                  <select name="request__element" id="request_element">
                    <option value="0">선택하기</option>
                    <option value="2">의사수</option>
                    <option value="4">진료시간</option>
                    <option value="5">진료정보</option>
                    <option value="6">연락처</option>
                  </select>
                </div>
              </div>
              <div class="request__element">
                <div>
                  <h4>상세내용</h4>
                  <hr>
                </div>
                <div>
                  <textarea name="request__textarea" id="" placeholder="내용을 입력하세요!"></textarea>
                </div>
              </div>
              
            </form>
          </div>
          <br><br>

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
  <script>
  	function requestHospitalForm() {
  		const form = document.hospital_request;
  		
  		if(form.request__element.value == '0') {
  			alert("요소를 선택해주세요!");
  			form.request__element.focus();
  		} else if(!form.request__textarea.value) {
  			alert("내용을 입력해주세요!");
  			form.request__textarea.focus();
  		} else {
  			form.submit();
  		}
  		
  	}
  </script>
</body>
</html>