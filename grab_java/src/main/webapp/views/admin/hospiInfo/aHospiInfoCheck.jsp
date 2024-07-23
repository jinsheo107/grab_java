<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.grab.ainfo.dao.HospiInfoDao"%>
<%@ page import="com.grab.ainfo.vo.HospiInfo"%>
<%@ page import="java.text.SimpleDateFormat, java.util.Date"%>
<%@ page
	import="java.time.LocalDateTime, java.time.format.DateTimeFormatter"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>여기아파_관리자_병원정보_검토</title>
<link rel="icon" href="http://www.w3.org/2000/svg" type="image/svg">
<meta content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
	name="viewport" />
<!--     <link
      rel="icon"
      href="../resources/img/kaiadmin/favicon.ico"
      type="image/x-icon"
    /> -->

<!-- Fonts and icons -->
<script src="../resources/js/plugin/webfont/webfont.min.js"></script>
<script>
	WebFont.load({
		google : {
			families : [ "Public Sans:300,400,500,600,700" ]
		},
		custom : {
			families : [ "Font Awesome 5 Solid", "Font Awesome 5 Regular",
					"Font Awesome 5 Brands", "simple-line-icons", ],
			urls : [ "../resources/css/fonts.min.css" ],
		},
		active : function() {
			sessionStorage.fonts = true;
		},
	});
</script>

<!-- CSS Files -->
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="../resources/css/plugins.min.css" />
<link rel="stylesheet" href="../resources/css/kaiadmin.min.css" />
<style>
	.page-category {
		background: #ffffff;
		padding: 15px;
		border-radius: 10px;
	}
	
	#regiTitle {
		border-bottom: 1px solid rgb(177, 177, 177);
	}
	
	.menu-box {
		width: 300px;
		background-color: #d3d3d3;
		border: 2px solid #666;
		border-radius: 10px;
		padding: 10px 20px;
		text-align: center;
		box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
	}
	
	.menu-box h1 {
		margin: 0;
		font-size: 24px;
		font-weight: bold;
	}
	
	#form1, #form2 {
		padding-top: 10px;
		padding-bottom: 30px;
	}
	
	.threeForms {
		display: flex;
		align-items: flex-end;
		height: 300px;
	}
	
	.form-group-default {
		margin: 0 20px;
	}
	
	#flexFirst1 {
		flex: 3;
		margin-right: 150px;
	}
	
	#flexSecond1, #flexThird1 {
		flex: 1;
	}
	
	#flexFirst2 {
		flex: 3;
		margin-right: 150px;
	}
	
	#flexSecond2, #flexThird2 {
		flex: 1;
	}
	
	.btnBox{
		display: flex;
    	justify-content: flex-end;
	}
	
	.form-select{
        width: 180px;
    }
    
    a {
        color: #000; 
        text-decoration: none; 
    }
   
    a:hover {
        color: #00f;
    }
    
    .imgBox{
    	border: 1px solid #f0f0f0;
    	padding: 10px;
    	margin-bottom: 30px;
    }
    
    .modal {
      display: none;
      position: fixed;
      z-index: 1;
      left: 20%;
      top: 0;
      width: 70%;
      height: 90%;
      overflow: auto;
      background-color: rgb(0,0,0);
      background-color: rgba(0,0,0,0.4);
      padding-top: 60px;
    }
    .modal-content {
      background-color: #fefefe;
      margin: 5% auto;
      padding: 20px;
      border: 1px solid #888;
      width: 40%;
    }
    .close {
      color: #aaa;
      float: right;
      font-size: 28px;
      font-weight: bold;
    }
    .close:hover,
    .close:focus {
      color: black;
      text-decoration: none;
      cursor: pointer;
    }
</style>
</head>
<body>
	<div class="wrapper">
		<!-- Sidebar -->
		<div class="sidebar" data-background-color="dark">
			<div class="sidebar-logo">
				<!-- Logo Header -->
				<div class="logo-header" data-background-color="dark">
					<a href="<%=request.getContextPath()%>/member/toMain" class="logo">
						<h2 style="color: aliceblue">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"
								width="33" height="33" fill="currentColor">
                                <path
									d="M64 32C28.7 32 0 60.7 0 96V416c0 35.3 28.7 64 64 64H384c35.3 0 64-28.7 64-64V96c0-35.3-28.7-64-64-64H64zM336 152V256 360c0 13.3-10.7 24-24 24s-24-10.7-24-24V280H160l0 80c0 13.3-10.7 24-24 24s-24-10.7-24-24l0-208c0-13.3 10.7-24 24-24s24 10.7 24 24v80H288V152c0-13.3 10.7-24 24-24s24 10.7 24 24z" />
                            </svg>
							&nbsp;여기아파
						</h2>
					</a>
					<div class="nav-toggle">
						<button class="btn btn-toggle toggle-sidebar">
							<i class="gg-menu-right"></i>
						</button>
						<button class="btn btn-toggle sidenav-toggler">
							<i class="gg-menu-left"></i>
						</button>
					</div>
					<button class="topbar-toggler more">
						<i class="gg-more-vertical-alt"></i>
					</button>
				</div>
				<!-- End Logo Header -->
			</div>
			<div class="sidebar-wrapper scrollbar scrollbar-inner">
				<div class="sidebar-content">
					<ul class="nav nav-secondary">
						<li class="nav-item active"><a
							href="<%=request.getContextPath()%>/member/toMain"
							class="collapsed" aria-expanded="false"> <i
								class="fas fa-home"></i>
								<p>Home</p>
						</a></li>
						<li class="nav-section">
							<!-- <span class="sidebar-mini-icon">
                  <i class="fa fa-ellipsis-h"></i>
                </span>--> <a
							href="<%=request.getContextPath()%>/member/logout"
							style="text-decoration: none;"><h4 class="text-section">로그아웃</h4></a>
						</li>
						<li class="nav-item"><a
							href="<%=request.getContextPath()%>/member/toHospiInfo"> <i
								class="fas fa-layer-group"></i>
								<p>병원 정보 검토</p>
						</a></li>
						<li class="nav-item"><a
							href="<%=request.getContextPath()%>/member/toReview"> <i
								class="fas fa-th-list"></i>
								<p>리뷰 관리</p>
						</a></li>
						<li class="nav-item"><a
							href="<%=request.getContextPath()%>/member/toNotice"> <i
								class="fas fa-pen-square"></i>
								<p>공지사항 관리</p>
						</a></li>
						<li class="nav-item"><a
							href="<%=request.getContextPath()%>/member/toStatis"> <i
								class="fas fa-table"></i>
								<p>통계 관리</p>
						</a></li>
						<li class="nav-item"><a href="https://www.daum.net/"
							target="_blank"> <i class="fas fa-desktop"></i>
								<p>사용자 홈페이지</p>
						</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- End Sidebar -->
		<div class="main-panel">
			<div class="main-header">
				<div class="main-header-logo">
					<!-- Logo Header -->
					<div class="logo-header" data-background-color="dark">
						<a href="index.html" class="logo"> <img
							src="../resources/img/kaiadmin/logo_light.svg" alt="navbar brand"
							class="navbar-brand" height="20" />
						</a>
						<div class="nav-toggle">
							<button class="btn btn-toggle toggle-sidebar">
								<i class="gg-menu-right"></i>
							</button>
							<button class="btn btn-toggle sidenav-toggler">
								<i class="gg-menu-left"></i>
							</button>
						</div>
						<button class="topbar-toggler more">
							<i class="gg-more-vertical-alt"></i>
						</button>
					</div>
					<!-- End Logo Header -->
				</div>
			</div>

			<div class="container">
				<div class="page-inner">
					<div class="page-header">
						<h3 class="fw-bold mb-3">병원 정보 검토</h3>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="card">
								<div class="card-header">
									<%
									HospiInfo hi =(HospiInfo)request.getAttribute("result");
									%>
									<div class="card-title"><%=hi.getHospital_name()%></div>
								</div>
								<div class="card-body">
									<table class="table table-bordered">
										<colgroup>
											<col style="width: 30%">
											<col style="width: 70%">
										</colgroup>
										<thead>
											<tr>
											<td colspan="2"><b>병원 기본 정보</b></td>
										</thead>
										<tbody>
											
											<%if (hi != null) { %>
											<tr>
												<td>병원 번호</td>
												<td><%=hi.getHospital_no()%></td>
											</tr>
											<tr>
												<td>회원 가입일</td>
												<%
												LocalDateTime regDateTime1 = hi.getHospital_reg_date();
												DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
												String formattedDate = regDateTime1.format(formatter);
												%>
												<td><%=formattedDate%></td>
											</tr>
											<tr>
												<td>전화번호</td>
												<td><%=hi.getHospital_phone()%></td>
											</tr>
											<tr>
												<td>주소</td>
												<td><%=hi.getHospital_addr()%></td>
											</tr>
											<tr>
												<td>홈페이지</td>
												<td><a href="<%= hi.getHospital_homepage() %>" target="_blank"><%=hi.getHospital_homepage()%></a></td>
											</tr>
											<%}%>
										</tbody>
									</table>
									
									<!-- 승인 여부 판별을 위한 form 태그 -->
									<form action="<%=request.getContextPath()%>/member/infoCheckEnd" name="permit_form" method="get">
										<input type="hidden" name="hospital_no" value="<%=hi.getHospital_no()%>">
										<table class="table table-bordered">
											<colgroup>
												<col style="width: 50%">
												<col style="width: 50%">
											</colgroup>
											<tbody>
												<tr>
													<td>
														<label class="mb-3"><b>의사 면허증 또는 전문의 자격증</b></label> 
														<div class="imgBox">
															<input type="button" id="myBtn1" value="<%=hi.getHospital_org_license()%>">
														</div>
														<div id="myModal1" class="modal">
														  <div class="modal-content">
														    <span class="close">&times;</span>
														    	<img src="../resources/img/licenseSample.jpg">
														  </div>
														</div>
														<div class="form-group form-group-default" id="flexSecond1" style="width:200px;">
															<select class="form-select" id="formGroupDefaultSelect1" name="answer1">
																<option value="1">미확인</option>
																<option value="2">반려</option>
																<option value="0">승인</option>
															</select>
														</div>
													</td>
													<td>
														<label class="mb-3"><b>사업자 등록증</b></label>
														<div class="imgBox">
															<input type="button" id="myBtn2" value="<%=hi.getHospital_org_registration()%>">
														</div>
														<div id="myModal2" class="modal">
														  <div class="modal-content">
														    <span class="close">&times;</span>
														    	<img src="../resources/img/registrationSample.jpg">
														  </div>
														</div>
														<div class="form-group form-group-default" id="flexSecond2" style="width:200px;">
															<select class="form-select" id="formGroupDefaultSelect2"  name="answer2">
																<option value="1">미확인</option>
																<option value="2">반려</option>
																<option value="0">승인</option>
															</select>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
										<div class="btnBox" id="flexThird2">
											<b><input type="button" value="저장" class="btn btn-warning" onclick="permitForm();"></b>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>


	<footer class="footer">
		<div class="container-fluid d-flex justify-content-between">
			<div class="copyright">2024, made by CatchJava</div>
		</div>
	</footer>
	</div>
	</div>
	<!-- 모달창 -->
	<script>
	  // 폼 태그
	  function permitForm(){
		  let form = document.permit_form;
		  let answer1 = form.answer1.value;
		  let answer2 = form.answer2.value;
		  var confirmed = confirm('저장하시겠습니까?');
		  if(confirmed == true){
			  form.submit();
		  }else{
			  event.preventDefault();
		  }
	  }
	  
	 // 모달1
	  var modal1 = document.getElementById("myModal1");
	  var btn1 = document.getElementById("myBtn1");
	  var span1 = document.getElementsByClassName("close")[0];

	  btn1.onclick = function() {
	    modal1.style.display = "block";
	  }

	  // X 버튼을 클릭하면 모달을 닫음
	  span1.onclick = function() {
	    modal1.style.display = "none";
	  }

	  // 모달 외부를 클릭하면 모달을 닫음
	  window.onclick = function(event) {
	    if (event.target == modal1) {
	      modal1.style.display = "none";
	    }
	  }
	  // 모달2
	  var modal2 = document.getElementById("myModal2");
	  var btn2 = document.getElementById("myBtn2");
	  var span2 = document.getElementsByClassName("close")[1];

	  btn2.onclick = function() {
	    modal2.style.display = "block";
	  }

	  span2.onclick = function() {
	    modal2.style.display = "none";
	  }

	  window.onclick = function(event) {
	    if (event.target == modal2) {
	      modal2.style.display = "none";
	    }
	  }
	  
	</script>
	<!--   Core JS Files   -->
	<script src="../resources/js/core/jquery-3.7.1.min.js"></script>
	<script src="../resources/js/core/popper.min.js"></script>
	<script src="../resources/js/core/bootstrap.min.js"></script>

	<!-- jQuery Scrollbar -->
	<script
		src="../resources/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>

	<!-- Chart JS -->
	<script src="../resources/js/plugin/chart.js/chart.min.js"></script>

	<!-- jQuery Sparkline -->
	<script
		src="../resources/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>

	<!-- Chart Circle -->
	<script src="../resources/js/plugin/chart-circle/circles.min.js"></script>

	<!-- Datatables -->
	<script src="../resources/js/plugin/datatables/datatables.min.js"></script>

	<!-- Bootstrap Notify -->
	<script
		src="../resources/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>

	<!-- jQuery Vector Maps -->
	<script src="../resources/js/plugin/jsvectormap/jsvectormap.min.js"></script>
	<script src="../resources/js/plugin/jsvectormap/world.js"></script>

	<!-- Google Maps Plugin -->
	<script src="../resources/js/plugin/gmaps/gmaps.js"></script>

	<!-- Sweet Alert -->
	<script src="../resources/js/plugin/sweetalert/sweetalert.min.js"></script>

	<!-- Kaiadmin JS -->
	<script src="../resources/js/kaiadmin.min.js"></script>
</body>
</html>
