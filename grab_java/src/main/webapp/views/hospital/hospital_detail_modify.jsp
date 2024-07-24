<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원정보수정요청</title>
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
.form__label--file {
	display: inline-block;
	font-size: 14px;
	color: #333;
	font-weight: 700;
	text-transform: uppercase;
	display: inline-block;
	padding: 4px 15px 4px;
	background: #f8dd11;
	border: none;
	border-radius: 50px;
	text-align: center;
	height: 35px;
	width: 120px;
	margin: 5px;
}

.checkLabel {
	font-size: 15px;
	width: 5px;
	/* padding: 14px 10px 12px; */
	padding: 7px 0px;
	color: #000000;
	background-color: #ffffff;
	font-weight: 700;
	border-radius: 50px;
	text-decoration: none;
	float: right;
	align-items: center;
	cursor: pointer;
	user-select: none;
	border: 2px solid #ececec;
	text-align: center;
	flex: 1 1 calc(50% - 5px); /* 4개씩 한 줄에 배치, 간격 조절을 위해 10px 뺌 */
    box-sizing: border-box;
}

.checkLabel input[type="checkbox"] {
	display: none;
}

.checkedLabel {
	background-color: #f8dd11;
	color: 000000;
	border: 2px solid #f8dd11;
}

.keywords {
    display: flex;
    flex-wrap: wrap;
    gap: 3px; /* 간격 조절 */
}
</style>
</head>
<body>
	<%@ include file="../include/hospital_nav.jsp"%>
	<%@ page import="com.grab.hospital_detail.vo.HospitalType,java.util.*"%>
	<%@ page import="com.grab.hospital_detail.vo.Hospital" %>
	<% Hospital hospital = (Hospital)request.getAttribute("hospital"); %>
	
	<% List<HospitalType> hospitalTypeList = (List<HospitalType>)request.getAttribute("hospitalTypeList");%>

	<section class="feature-section about__spad"
		style="background-color: white; margin-top: 50px;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="select__div">
						<h3>병원 정보 변경</h3>
						<hr>
						<form action="/hospital/hospital_detail_select_modify" name="modify_hospital_select_detail" method="post">
							<div class="essentail__btn">
								<input type="button" value="수정하기" class="searchBtn" onclick="selectModify();"> 
								<input type="reset" value="다시쓰기" class="searchBtn">
							</div>
							<input type="hidden" name="hospital_no" value="<%=hospital.getHospital_no() %>">
							<table class="select__table">
							<colgroup>
								<col width="20%">
								<col width="70%">
							</colgroup>
								<tr>
									<th>진료시간</th>
									<td><input type="text" placeholder="<%=hospital.getHospital_time() %>" name="hospital_time"></td>
								</tr>
								<tr>
									<th>점심시간</th>
									<td><input type="text" placeholder="<%=hospital.getHospital_lunch_time() %>" name="hospital_lunch_time"></td>
								</tr>
								<tr>
									<th>의사수</th>
									<td><input type="text" placeholder="<%=hospital.getHospital_doctor_num() %>" name="doctor_num"></td>
								</tr>
								<tr>
									<th>진료정보</th>
									<td>
										<div class="request__element" style="margin: 10px 0px; padding: 0px;">
											<div class="keywords">
												<% for(int i = 0; i < hospitalTypeList.size(); i++) {%>
													<label class="checkLabel"><input type="checkbox" onclick="changeLabelColor(this)" value="<%=i+1 %>" name="type_no"><%= hospitalTypeList.get(i).getType_content() %></label>
													
												<%} %>
											</div>
										</div>	
									</td>
								</tr>
								<tr>
									<th>연락처</th>
									<td><input type="text" placeholder="<%=hospital.getHospital_phone() %>" name="hospital_phone"></td>
								</tr>
							</table>
						</form>
					</div>
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

	<script>
		// Function to enable/disable time inputs and set their value to null
		function changeLabelColor(checkbox) {
			if (checkbox.checked) {
				checkbox.parentNode.classList.add('checkedLabel');
			} else {
				checkbox.parentNode.classList.remove('checkedLabel');
			}
		}
	</script>


	<script src="../../resources/js/common/jquery-3.7.1.js"></script>
	<script src="../../resources/js/common/bootstrap.min.js"></script>
	<script src="../../resources/js/common/jquery.slicknav.js"></script>
	<script src="../../resources/js/common/owl.carousel.min.js"></script>
	<script src="../../resources/js/common/main.js"></script>

	<script>
  	function selectModify() {
  		const form = document.modify_hospital_select_detail;
  		if(!form.hospital_time.value) {
  			alert("병원 진료시간을 입력하세요!");
				form.hospital_time.focus();
  		} else if (!form.hospital_lunch_time.value) {
  			alert("병원 점심시간를 입력하세요!");
				form.doctor_num.focus();
  		} else if (!form.doctor_num.value) {
  			alert("병원 의사 수를 입력하세요!");
  			form.doctor_num.focus();
  		} else {
  			const selectedCheckboxes = form.querySelectorAll('input[type="checkbox"]:checked');
  	        const selectedCount = selectedCheckboxes.length;
  	        
  	        if (selectedCount < 1 || selectedCount > 3) {
  	            alert("체크박스를 1개 이상 3개 이하로 선택해주세요!");
  	        } else {
  	            form.submit();
  	        }
  		}
  		
  	}
  </script>
</body>
</html>