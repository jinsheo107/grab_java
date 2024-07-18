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
  </style>
</head>
<body>
	<%@ include file="../include/hospital_nav.jsp" %>
	
		<section class="feature-section about__spad" style="background-color: white; margin-top: 50px;">
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
							<table class="select__table">
								<tr>
									<th>진료시간</th>
									<td>
										<table class="select__time__table">
											<tr>
												<th>요일</th>
												<th>진료시작시간</th>
												<th> </th>
												<th>진료종료시간</th>
												<th>점심시작시간</th>
												<th> </th>
												<th>점심종료시간</th>
												<th>휴일</th>
											</tr>
											<tr>
												<th>월요일</th>
												<td><input type="time" name="mon_start_time"></td>
												<td style="text-align: center;">~</td>
												<td><input type="time" name="mon_end_time"></td>
												<td><input type="time" name="mon_lunch_start_time"></td>
												<td style="text-align: center;">~</td>
												<td><input type="time" name="mon_lunch_end_time"></td>
												<td><input type="checkbox" name="mon_rest"
														onchange="toggleInputs(this, ['mon_start_time', 'mon_end_time', 'mon_lunch_start_time', 'mon_lunch_end_time']);"></td>
											</tr>
											<tr>
												<th>화요일</th>
												<td><input type="time" name="tue_start_time"></td>
												<td style="text-align: center;">~</td>
												<td><input type="time" name="tue_end_time"></td>
												<td><input type="time" name="tue_lunch_start_time"></td>
												<td style="text-align: center;">~</td>
												<td><input type="time" name="tue_lunch_end_time"></td>
												<td><input type="checkbox" name="tue_rest"
														onchange="toggleInputs(this, ['tue_start_time', 'tue_end_time', 'tue_lunch_start_time', 'tue_lunch_end_time']);"></td>
											</tr>
											<tr>
												<th>수요일</th>
												<td><input type="time" name="wed_start_time"></td>
												<td style="text-align: center;">~</td>
												<td><input type="time" name="wed_end_time"></td>
												<td><input type="time" name="wed_lunch_start_time"></td>
												<td style="text-align: center;">~</td>
												<td><input type="time" name="wed_lunch_end_time"></td>
												<td><input type="checkbox" name="wed_rest"
														onchange="toggleInputs(this, ['wed_start_time', 'wed_end_time', 'wed_lunch_start_time', 'wed_lunch_end_time']);"></td>
											</tr>
											<tr>
												<th>목요일</th>
												<td><input type="time" name="thur_start_time"></td>
												<td style="text-align: center;">~</td>
												<td><input type="time" name="thur_end_time"></td>
												<td><input type="time" name="thur_lunch_start_time"></td>
												<td style="text-align: center;">~</td>
												<td><input type="time" name="thur_lunch_end_time"></td>
												<td><input type="checkbox" name="thur_rest"
														onchange="toggleInputs(this, ['thur_start_time', 'thur_end_time', 'thur_lunch_start_time', 'thur_lunch_end_time']);">
												</td>
											</tr>
											<tr>
												<th>금요일</th>
												<td><input type="time" name="fri_start_time"></td>
												<td style="text-align: center;">~</td>
												<td><input type="time" name="fri_end_time"></td>
												<td><input type="time" name="fri_lunch_start_time"></td>
												<td style="text-align: center;">~</td>
												<td><input type="time" name="fri_lunch_end_time"></td>
												<td><input type="checkbox" name="fri_rest"
														onchange="toggleInputs(this, ['fri_start_time', 'fri_end_time', 'fri_lunch_start_time', 'fri_lunch_end_time']);"></td>
											</tr>
											<tr>
												<th>토요일</th>
												<td><input type="time" name="sat_start_time"></td>
												<td style="text-align: center;">~</td>
												<td><input type="time" name="sat_end_time"></td>
												<td><input type="time" name="sat_lunch_start_time"></td>
												<td style="text-align: center;">~</td>
												<td><input type="time" name="sat_lunch_end_time"></td>
												<td><input type="checkbox" name="sat_rest"
														onchange="toggleInputs(this, ['sat_start_time', 'sat_end_time', 'sat_lunch_start_time', 'sat_lunch_end_time']);"></td>
											</tr>
											<tr>
												<th>일요일</th>
												<td><input type="time" name="sun_start_time"></td>
												<td style="text-align: center;">~</td>
												<td><input type="time" name="sun_end_time"></td>
												<td><input type="time" name="sun_lunch_start_time"></td>
												<td style="text-align: center;">~</td>
												<td><input type="time" name="sun_lunch_end_time"></td>
												<td><input type="checkbox" name="sun_rest"
														onchange="toggleInputs(this, ['sun_start_time', 'sun_end_time', 'sun_lunch_start_time', 'sun_lunch_end_time']);"></td>
											</tr>
											<tr>
												<th>공휴일</th>
												<td><input type="time" name="hol_start_time"></td>
												<td style="text-align: center;">~</td>
												<td><input type="time" name="hol_end_time"></td>
												<td><input type="time" name="hol_lunch_start_time"></td>
												<td style="text-align: center;">~</td>
												<td><input type="time" name="hol_lunch_end_time"></td>
												<td><input type="checkbox" name="hol_rest"
														onchange="toggleInputs(this, ['hol_start_time', 'hol_end_time', 'hol_lunch_start_time', 'hol_lunch_end_time']);"></td>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<th>의사수</th>
									<td><input type="text" placeholder="" name="doctor_num"></td>
								</tr>
								<tr>
									<th>진료정보</th>
									<td><input type="text" name="medical_info"></td>
								</tr>
								<tr>
									<th>연락처</th>
									<td><input type="text" name="contact_info"></td>
								</tr>
								<tr>
									<th>가격표</th>
									<td><input type="text" name="price_list"></td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

	<%@ include file="../include/footer.jsp" %>

	<script>
		// Function to enable/disable time inputs and set their value to null
		function toggleInputs(checkbox, inputNames) {
			inputNames.forEach(function (name) {
				const input = document.getElementsByName(name)[0];
				if (checkbox.checked) {
					input.value = '';
					input.disabled = true;
				} else {
					input.disabled = false;
				}
			});
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
  		if(!form.hospital_name.value) {
  			alert("병원명을 입력하세요!");
				form.hospital_name.focus();
  		} else if (!form.doctor_num.value) {
  			alert("의사수를 입력하세요!");
				form.doctor_num.focus();
  		} else if (!form.hospital_addr.value) {
  			alert("주소를 입력하세요!");
  			form.addrBtn.focus();
  		} else if () { 
  			alert("이미지를 추가해주세요!");
  			form.addrBtn.focus();
  		} else {
  			if (form.review_file.value == "") {
                form.submit();
            } else {
                const val = form.review_file.value;
                const idx = val.lastIndexOf('.');
                const type = val.substring(idx + 1, val.length);

                if (type == 'jpg' || type == 'jpeg' || type == 'png') {
                    form.submit();
                } else {
                    alert("이미지 파일만 선택할 수 있습니다!");
                    form.review_file.value = '';
                }
            }
  		}
  		
  	}
  </script>
</body>
</html>