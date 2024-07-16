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
	
	<section class="feature-section about__spad" style="background-color: white; margin-top: 50px;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
          <div class="essentail__div">
            <h3>필수정보</h3>
            <hr>
            <form action="/hospital/hospital_detail_essentail_modify" name="modify_hospital_essential_detail" method="post">
              <div class="essentail__btn">
                <input type="button" value="수정하기" class="searchBtn" onclick="essentialModify();">
                <input type="reset" value="다시쓰기" class="searchBtn">
              </div>
              <table>
                <tr>
                  <th>병원명</th>
                  <td><input type="text" placeholder="" name="hospital_name"></td>
                </tr>
                <tr>
                  <th>의사수</th>
                  <td><input type="text" placeholder="" name="doctor_num"></td>
                </tr>
                <tr>
                  <th>우편번호</th>
                  <td><input type="text" id="sample6_postcode" placeholder=""></td>
                  <td><input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="modifyBtn" name="addrBtn"></td>
                </tr>
                <tr>
                  <th>주소</th>
                  <td><input type="text" id="sample6_address" placeholder="" name="hospital_addr"></td>
                </tr>
                <tr>
                  <th></th>
                  <td><input type="text" id="sample6_detailAddress" placeholder=""></td>
                  <td><input type="hidden" id="sample6_extraAddress" placeholder=""></td>
                </tr>
              </table>
            </form>
          </div>
          <br><br>
          <div class="select__div">
            <h3>선택정보</h3>
            <hr>
            <form action="/hospital/hospital_detail_select_modify" name="modify_hospital_select_detail" method="post">
              <div class="essentail__btn">
                <input type="button" value="수정하기" class="searchBtn" onclick="">
                <input type="reset" value="다시쓰기" class="searchBtn">
              </div>
              <table class="select__table">
                <tr>
                  <th>진료시간</th>
                  <td>
                    <table class="select__time__table">
                      <tr>
                        <th>요일</th>
                        <th>진료시간</th>
                        <th>점심시간</th>
                        <th>휴일</th>
                      </tr>
                      <tr>
                        <th>월요일</th>
                        <td><input type="time"></td>
                        <td><input type="time"></td>
                        <td><input type="checkbox"></td>
                      </tr>
                      <tr>
                        <th>화요일</th>
                        <td><input type="time"></td>
                        <td><input type="time"></td>
                        <td><input type="checkbox"></td>
                      </tr>
                      <tr>
                        <th>수요일</th>
                        <td><input type="time"></td>
                        <td><input type="time"></td>
                        <td><input type="checkbox"></td>
                      </tr>
                      <tr>
                        <th>목요일</th>
                        <td><input type="time"></td>
                        <td><input type="time"></td>
                        <td><input type="checkbox"></td>
                      </tr>
                      <tr>
                        <th>금요일</th>
                        <td><input type="time"></td>
                        <td><input type="time"></td>
                        <td><input type="checkbox"></td>
                      </tr>
                      <tr>
                        <th>토요일</th>
                        <td><input type="time"></td>
                        <td><input type="time"></td>
                        <td><input type="checkbox"></td>
                      </tr>
                      <tr>
                        <th>일요일</th>
                        <td><input type="time"></td>
                        <td><input type="time"></td>
                        <td><input type="checkbox"></td>
                      </tr>
                      <tr>
                        <th>공휴일</th>
                        <td><input type="time"></td>
                        <td><input type="time"></td>
                        <td><input type="checkbox"></td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr>
                  <th>진료정보</th>
                  <td><input type="text"></td>
                </tr>
                <tr>
                  <th>연락처</th>
                  <td><input type="text"></td>
                </tr>
                <tr>
                  <th>가격표</th>
                  <td><input type="text"></td>
                </tr>
              </table>
            </form>
          </div>
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
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
    function sample6_execDaumPostcode() {
      new daum.Postcode({
        oncomplete: function (data) {

          var addr = '';
          var extraAddr = '';

          if (data.userSelectedType === 'R') {
            addr = data.roadAddress;
          } else {
            addr = data.jibunAddress;
          }

          if (data.userSelectedType === 'R') {
            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
              extraAddr += data.bname;
            }
            if (data.buildingName !== '' && data.apartment === 'Y') {
              extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            if (extraAddr !== '') {
              extraAddr = ' (' + extraAddr + ')';
            }
            document.getElementById("sample6_extraAddress").value = extraAddr;

          } else {
            document.getElementById("sample6_extraAddress").value = '';
          }

          document.getElementById('sample6_postcode').value = data.zonecode;
          document.getElementById("sample6_address").value = addr;
          document.getElementById("sample6_detailAddress").focus();
        }
      }).open();
    }
  </script>
  <script>
  	function essentialModify() {
  		const form = document.modify_hospital_essential_detail;
  		
  		if(!form.hospital_name.value) {
  			alert("병원명을 입력하세요!");
				form.hospital_name.focus();
  		} else if (!form.doctor_num.value) {
  			alert("의사수를 입력하세요!");
				form.doctor_num.focus();
  		} else if (!form.hospital_addr.value) {
  			alert("주소를 입력하세요!");
  			form.addrBtn.focus();
  		} else {
  			form.submit();
  		}
  		
  	}
  </script>
</body>
</html>