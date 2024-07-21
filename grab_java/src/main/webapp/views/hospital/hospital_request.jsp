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
</head>
<body>
	<%@ include file="../include/hospital_nav.jsp" %>
	<% Member member = (Member)session.getAttribute("member"); %>
	<% int hospital_no = (int)request.getAttribute("hospital_no"); %>
	
	<section class="feature-section about__spad" style="background-color: white; margin-top: 50px;">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="essentail__div">
            <h3>정보수정요청</h3>
            <!-- <hr> -->
            <form action="/hospital/requestEnd" name="modify_hospital_essential_detail" method="post" hi>
              <div class="request__btn">
              	<input type="hidden" value="<%= member.getMember_no() %>" name="member_no">
              	<input type="hidden" value="<%= hospital_no %>" name="hospital_no">
                <input type="button" value="제출하기" class="searchBtn" onclick="requestHospitalForm();">
                <input type="reset" value="다시쓰기" class="searchBtn">
              </div>
              <div class="request__element">
                <div>
                  <h4>요소</h4>
                  <hr>
                </div>
                <div>
                  <select name="request__element" id="request_element">
                    <option value="0">선택하기</option>
                    <option value="1">병원명</option>
                    <option value="2">의사수</option>
                    <option value="3">주소</option>
                    <option value="4">진료시간</option>
                    <option value="5">진료정보</option>
                    <option value="6">연락처</option>
                    <option value="7">가격표</option>
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
  <%@ include file="../include/footer.jsp" %>
	
	<script src="../../resources/js/common/jquery-3.7.1.js"></script>
  <script src="../../resources/js/common/bootstrap.min.js"></script>
  <script src="../../resources/js/common/jquery.slicknav.js"></script>
  <script src="../../resources/js/common/owl.carousel.min.js"></script>
  <script src="../../resources/js/common/main.js"></script>
  <script>
  	function requestHospitalForm(url) {
  		const form = document.modify_hospital_essential_detail;
  		
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