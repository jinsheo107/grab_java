<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.grab.admin.aReview.vo.Review, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>여기아파_관리자_리뷰 관리</title>
    <link rel="icon" href="http://www.w3.org/2000/svg" type="image/svg">
    <meta
      content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
      name="viewport"
    />
<!--     <link
      rel="icon"
      href="../resources/css/img/kaiadmin/favicon.ico"
      type="image/x-icon"
    /> -->

    <!-- Fonts and icons -->
    <script src="../resources/css/js/plugin/webfont/webfont.min.js"></script>
    <script>
      WebFont.load({
        google: { families: ["Public Sans:300,400,500,600,700"] },
        custom: {
          families: [
            "Font Awesome 5 Solid",
            "Font Awesome 5 Regular",
            "Font Awesome 5 Brands",
            "simple-line-icons",
          ],
          urls: ["../resources/css/css/fonts.min.css"],
        },
        active: function () {
          sessionStorage.fonts = true;
        },
      });
    </script>

    <!-- CSS Files -->
    <link rel="stylesheet" href="../resources/css/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../resources/css/css/plugins.min.css" />
    <link rel="stylesheet" href="../resources/css/css/kaiadmin.min.css" />
    <style>
      .table-bordered{
        width: 97%;
        margin: 20px;
        border-collapse: collapse;
      }

      .table-bordered th, td{
        text-align: center;
        background-color: lightgray;
      }
       
      .demo {
        text-align: center;
        padding-top: 20px;
      }

      .pagination {
        display: flex;
        justify-content: center;
        list-style-type: none;
        padding-left: 0;
      }

      .page-item {
        margin: 0 5px;
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
              <h2 style="color:aliceblue"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" width="33" height="33"
                                fill="currentColor">
                                <path
                                    d="M64 32C28.7 32 0 60.7 0 96V416c0 35.3 28.7 64 64 64H384c35.3 0 64-28.7 64-64V96c0-35.3-28.7-64-64-64H64zM336 152V256 360c0 13.3-10.7 24-24 24s-24-10.7-24-24V280H160l0 80c0 13.3-10.7 24-24 24s-24-10.7-24-24l0-208c0-13.3 10.7-24 24-24s24 10.7 24 24v80H288V152c0-13.3 10.7-24 24-24s24 10.7 24 24z" />
                            </svg>&nbsp;여기아파</h2>
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
              <li class="nav-item active">
                <a
                  href="<%=request.getContextPath()%>/member/toMain"
                  class="collapsed"
                  aria-expanded="false"
                >
                  <i class="fas fa-home"></i>
                  <p>Home</p>
                </a>
              </li>
              <li class="nav-section">
                <!-- <span class="sidebar-mini-icon">
                  <i class="fa fa-ellipsis-h"></i>
                </span>-->
                <a href="<%=request.getContextPath()%>/member/logout" style="text-decoration: none;"><h4 class="text-section">로그아웃</h4></a>
              </li>
              <li class="nav-item">
                <a href="<%=request.getContextPath()%>/member/toHospiInfo">
                  <i class="fas fa-layer-group"></i>
                  <p>병원 정보 검토</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<%=request.getContextPath()%>/member/toReview">
                  <i class="fas fa-th-list"></i>
                  <p>리뷰 관리</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<%=request.getContextPath()%>/member/toNotice">
                  <i class="fas fa-pen-square"></i>
                  <p>공지사항 관리</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="<%=request.getContextPath()%>/member/toStatis">
                  <i class="fas fa-table"></i>
                  <p>통계 관리</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="https://www.daum.net/" target="_blank">
                  <i class="fas fa-desktop"></i>
                  <p>사용자 홈페이지</p>
                </a>
              </li>
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
              <a href="index.html" class="logo">
                <img
                  src="../resources/css/img/kaiadmin/logo_light.svg"
                  alt="navbar brand"
                  class="navbar-brand"
                  height="20"
                />
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
              <h3 class="fw-bold mb-3">리뷰 관리</h3>
            </div>
            <div class="row">
              <div class="col-md-12">
                <div class="card">
                  <div class="card-body">
                    <table class="table table-bordered">
                      <colgroup>
                        <col width="10%">
                        <col width="30%">
                        <col width="10%">
                        <col width="20%">
                        <col width="20%">
                        <col width="30%">
                    </colgroup>
                      <thead>
                        <tr>
                          <th>번호</th>
                          <th>리뷰 내용</th>
                          <th>점수</th>
                          <th>회원명</th>
                          <th>작성일</th>
                          <th>태그</th>
                        </tr>
                      </thead>
                    <tbody>
                   <!--  <td><button class="btn btn-warning">완료</button></td> -->
                       
                       <%
                       	List<Review> list = (List<Review>)request.getAttribute("resultList");
                       	if(list != null){
                       		
                       	for(int i=0; i<list.size(); i++){ %>
                       		<tr>
                       			<td><%=list.get(i).getReview_no()%></td>
                       			<td><%=list.get(i).getReview_content()%></td>
                       			<td><%=list.get(i).getReview_score()%></td>
                       			<td><%=list.get(i).getReg_date()%></td>
                       			<td>button</td>
                       		</tr>
                       	<%}%>
                       <%}%>
                    </tbody>
                    </table>
                    <br>
                    <% Review paging = (Review)request.getAttribute("paging");%>
					<% if(paging != null){ %>
						<div class="center">
							<div class="pagination">
								<%if(paging.isPrev()){%>
									<a href="<%=request.getContextPath()%>/member/toReview?nowPage=<%=(paging.getPageBarStart()-1)%>">&laquo;</a>
								<%}%>
								<% for(int i=paging.getPageBarStart(); i<= paging.getPageBarEnd(); i++){ %>
									<a href="<%=request.getContextPath()%>/member/toReview?nowPage=<%=i%>"
									<%=paging.getNowPage() == i ? "class='active'" : ""%>>
										<%=i%>
									</a>
								<%}%>
								<%-- <% if(paging.isNext()){%>
									<a href="/member/toReview?nowPage=<%=(paging.getPageBarEnd()+1)%>">&raquo;</a>
								<%}%> --%>
							</div>
						</div>
					
					<%}%>
                    	
<!--                     <div class="demo">
                      <ul class="pagination pg-primary">
                        <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous">
                          <span aria-hidden="true">&laquo;</span>
                          <span class="sr-only">Previous</span>
                        </a>
                      </li>
                      <li class="page-item active">
                        <a class="page-link" href="#">1</a>
                      </li>
                      <li class="page-item">
                        <a class="page-link" href="#">2</a>
                      </li>
                      <li class="page-item">
                        <a class="page-link" href="#">3</a>
                      </li>
                      <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                          <span aria-hidden="true">&raquo;</span>
                          <span class="sr-only">Next</span>
                        </a>
                      </li>
                    </ul>
                  </div> -->
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <footer class="footer">
          <div class="container-fluid d-flex justify-content-between">
            <div class="copyright">
              2024, made by CatchJava
            </div>
          </div>
        </footer>
      </div>
    </div>
    <!--   Core JS Files   -->
    <script src="../resources/css/js/core/jquery-3.7.1.min.js"></script>
    <script src="../resources/css/js/core/popper.min.js"></script>
    <script src="../resources/css/js/core/bootstrap.min.js"></script>

    <!-- jQuery Scrollbar -->
    <script src="../resources/css/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>

    <!-- Chart JS -->
    <script src="../resources/css/js/plugin/chart.js/chart.min.js"></script>

    <!-- jQuery Sparkline -->
    <script src="../resources/css/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>

    <!-- Chart Circle -->
    <script src="../resources/css/js/plugin/chart-circle/circles.min.js"></script>

    <!-- Datatables -->
    <script src="../resources/css/js/plugin/datatables/datatables.min.js"></script>

    <!-- Bootstrap Notify -->
    <script src="../resources/css/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>

    <!-- jQuery Vector Maps -->
    <script src="../resources/css/js/plugin/jsvectormap/jsvectormap.min.js"></script>
    <script src="../resources/css/js/plugin/jsvectormap/world.js"></script>

    <!-- Google Maps Plugin -->
    <script src="../resources/css/js/plugin/gmaps/gmaps.js"></script>

    <!-- Sweet Alert -->
    <script src="../resources/css/js/plugin/sweetalert/sweetalert.min.js"></script>

    <!-- Kaiadmin JS -->
    <script src="../resources/css/js/kaiadmin.min.js"></script>
  </body>
</html>
    