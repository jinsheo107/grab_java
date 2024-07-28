<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.grab.aNotice.vo.Notice"%>
<%@ page import="com.grab.aNotice.dao.NoticeDao"%>
<%@ page import="com.grab.aNotice.vo.Notice, java.util.*"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>여기아파_관리자_공지사항_생성</title>
    <link rel="icon" href="http://www.w3.org/2000/svg" type="image/svg">
    <meta
      content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
      name="viewport"
    />
<!--     <link
      rel="icon"
      href="../resources/img/kaiadmin/favicon.ico"
      type="image/x-icon"
    /> -->

    <!-- Fonts and icons -->
    <script src="../resources/js/plugin/webfont/webfont.min.js"></script>
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
          urls: ["../resources/css/fonts.min.css"],
        },
        active: function () {
          sessionStorage.fonts = true;
        },
      });
    </script>

    <!-- CSS Files -->
    <link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../resources/css/plugins.min.css" />
    <link rel="stylesheet" href="../resources/css/kaiadmin.min.css" />
    <style>
      .row{
        height: 1000px;
      }

      .card-body{
        text-align: center;
      }

      #bottomOption{
        display: flex;
        justify-content: flex-end;
      }

      .btnBox {
        position: relative;
        right: 0;
       }
	
      textarea {
         width: 100%;
         resize: none;
         color: grey;
         box-sizing: border-box;
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
                <a href="<%=request.getContextPath()%>/admin/logout" style="text-decoration: none;"><h4 class="text-section">로그아웃</h4></a>
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
                  src="../resources/img/kaiadmin/logo_light.svg"
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
              <h3 class="fw-bold mb-3">공지사항 관리</h3>
            </div>
            <div class="row">
              <div class="col-md-12">
                <div class="card">
                <form action="<%=request.getContextPath()%>/member/noticeUpdateEnd" name="update_notice_form" method="post">
                  <div class="card-header">
                    <div class="card-title">
                    <% Notice n = (Notice)request.getAttribute("notice");%>
                    	<input type="hidden" name="notice_no" value="<%= n.getNotice_no()%>">
                      <input type="text" name="notice_title" 
                      value="<%=n.getNotice_title()%>" style="width:100%; font-size:15px;">
                    </div>
                  </div>
                  <div class="card-body">
                    <textarea name="notice_content" rows="15" style="resize:none; color:grey; width:100%; padding:0;"><%=n.getNotice_content()%></textarea>
                    <div id="bottomOption">
                      <div class="btnBox">
                        <b><input type=button class="btn btn-warning" onclick="updateNoticeForm();" value="수정"></b>
                      </div>
                    </div>
                  </div>
                 </form>
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
    <script type="text/javascript">
    	function updateNoticeForm(){
    		let form = document.update_notice_form;
    		if(form.notice_title.value == ''){
    			alert('제목을 입력하세요.');
    			form.notice_title.focus();
    		}else if(form.notice_content.value == ''){
    			alert('내용을 입력하세요.');
    			form.notice_content.focus();
    		}else{
    			alert('공지사항을 성공적으로 수정하였습니다.');
    			form.submit();
    		}
    	}
    </script>
    <!--   Core JS Files   -->
    <script src="../resources/js/core/jquery-3.7.1.min.js"></script>
    <script src="../resources/js/core/popper.min.js"></script>
    <script src="../resources/js/core/bootstrap.min.js"></script>

    <!-- jQuery Scrollbar -->
    <script src="../resources/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>

    <!-- Chart JS -->
    <script src="../resources/js/plugin/chart.js/chart.min.js"></script>

    <!-- jQuery Sparkline -->
    <script src="../resources/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>

    <!-- Chart Circle -->
    <script src="../resources/js/plugin/chart-circle/circles.min.js"></script>

    <!-- Datatables -->
    <script src="../resources/js/plugin/datatables/datatables.min.js"></script>

    <!-- Bootstrap Notify -->
    <script src="../resources/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>

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
    