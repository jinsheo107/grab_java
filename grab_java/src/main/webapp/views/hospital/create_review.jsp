<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰작성</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,500,600,700,800,900&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
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
.rasting__star .star_radio {
	text-align: center;
	display: inline-block;
	direction: rtl;
	border: 0;
}

.rasting__star input[type=radio] {
	display: none;
}

.rasting__star label {
	font-size: 3em;
	color: transparent;
	text-shadow: 0 0 0 #f0f0f0;
}

.rasting__star label:hover {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

.rasting__star label:hover ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

.rasting__star input[type=radio]:checked ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

.checkLabel {
	font-size: 15px;
	width: 150px;
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
}

.checkLabel input[type="checkbox"] {
	display: none;
}

.checkedLabel {
	background-color: #f8dd11;
	color: 000000;
	border: 2px solid #f8dd11;
}
</style>
</head>
<body>
	<%@ include file="../include/hospital_nav.jsp"%>

	<section class="feature-section about__spad"
		style="background-color: white; margin-top: 50px;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="essentail__div">
						<h3>리뷰작성</h3>
						<!-- <hr> -->
						<form action="/hospital/create_review_end" name="create_review"
							method="post" enctype="multipart/form-data">
							<input type="hidden" name="selectedKeywords"
								id="selectedKeywords">
							<div class="request__btn">
								<input type="button" value="제출하기" class="searchBtn"
									onclick="createReview();"> <input type="reset"
									value="다시쓰기" class="searchBtn">
							</div>
							<div class="request__element">
								<div class="row">
									<div class="col-lg-6 rasting__star">
										<div>
											<h4>별점</h4>
											<hr>
										</div>
										<div class="star_radio">
											<input type="radio" name="reviewStar" value="5" id="rate1"><label
												for="rate1">★</label> <input type="radio" name="reviewStar"
												value="4" id="rate2"><label for="rate2">★</label> <input
												type="radio" name="reviewStar" value="3" id="rate3"><label
												for="rate3">★</label> <input type="radio" name="reviewStar"
												value="2" id="rate4"><label for="rate4">★</label> <input
												type="radio" name="reviewStar" value="1" id="rate5"><label
												for="rate5">★</label>
										</div>
									</div>
									<div class="col-lg-6">
										<div>
											<h4>영수증인증</h4>
											<hr>
										</div>
										<div class="form__input--file_wrap">
											<input class="form__input--file" id="upload1" type="file"
												name="review_file" accept=".png, .jpg, .jpeg"> <span
												class="form__span--file">선택된 파일이 없습니다.</span> <label
												class="form__label--file" for="upload1">파일선택</label>
										</div>
									</div>
								</div>
							</div>
							<div class="request__element">
								<div>
									<h4>키워드</h4>
									<hr>
								</div>
								<div class="keywords">
									<input type="hidden" name="selectedKeywords" id="selectedKeywords"> 
									<label class="checkLabel"><input type="checkbox" onclick="changeLabelColor(this)" value="1" name="keyword_1">친절</label>
									<label class="checkLabel"><input type="checkbox" onclick="changeLabelColor(this)" value="2" name="keyword_2">위생</label>
									<label class="checkLabel"><input type="checkbox" onclick="changeLabelColor(this)" value="3" name="keyword_3">시설</label>
									<label class="checkLabel"><input type="checkbox" onclick="changeLabelColor(this)" value="4" name="keyword_4">꼼꼼함</label>
									<label class="checkLabel"><input type="checkbox" onclick="changeLabelColor(this)" value="5" name="keyword_5">대기시간</label>
								</div>
							</div>
							<div class="request__element">
								<div>
									<h4>리뷰작성</h4>
									<hr>
								</div>
								<div>
									<textarea name="review_content" class="review_content"
										placeholder="1 ~ 100자 이내의 리뷰를 작성해주세요!"></textarea>
								</div>
							</div>

						</form>
					</div>
					<br> <br>

				</div>
			</div>
		</div>
	</section>
	<section class="about-section about__spad">

		<%@ include file="../include/footer.jsp"%>

		<script src="../../resources/js/common/jquery-3.7.1.js"></script>
		<script src="../../resources/js/common/bootstrap.min.js"></script>
		<script src="../../resources/js/common/jquery.slicknav.js"></script>
		<script src="../../resources/js/common/owl.carousel.min.js"></script>
		<script src="../../resources/js/common/main.js"></script>

		<script>
		    document.getElementById('upload1').addEventListener('change', function() {
		        var fileName = this.value.split("\\").pop(); // 파일 이름만 추출
		        document.querySelector('.form__span--file').textContent = fileName; // 텍스트로 파일 이름 설정
		    });

		    window.createReview = function() {
		        const form = document.create_review;
		        const star = document.querySelector('input[name=reviewStar]:checked');
		        const reviewContent = document.querySelector('.review_content');

		        if (!star) {
		            alert("별점을 입력하세요!");
		        } else if (!reviewContent.value) {
		            alert("리뷰 내용을 입력하세요!");
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
		
		function changeLabelColor(checkbox) {
			if (checkbox.checked) {
				checkbox.parentNode.classList.add('checkedLabel');
			} else {
				checkbox.parentNode.classList.remove('checkedLabel');
			}
		}

		
</script>
</body>
</html>