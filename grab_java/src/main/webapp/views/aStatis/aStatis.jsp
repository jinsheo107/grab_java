<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>여기아파_관리자_통계</title>
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
      #basic-datatables1 {border-collapse: collapse; border: 1px solid rgb(150, 150, 150); text-align: center;}
      #basic-datatables2 {border-collapse: collapse; border: 1px solid rgb(150, 150, 150); text-align: center;}
      
      .btnBox{
        text-align: right;
        margin:10px;
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
                <!-- <div class="collapse" id="tables">
                  <ul class="nav nav-collapse">
                    <li>
                      <a href="aStatPeri.html">
                        <span class="sub-item">기간별 통계</span>
                      </a>
                    </li>
                    <li>
                      <a href="tables/datatables.html">
                        <span class="sub-item">시간별 통계</span>
                      </a>
                    </li>
                  </ul>
                </div> -->
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
              <h3 class="fw-bold mb-3">통계 관리</h3>
            </div>
            <div class="col-md-12">
              <div class="card">
                <div class="card-header">
                  <h4 class="card-title">기간별 통계</h4>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table
                      id="basic-datatables1"
                      class="display table table-striped table-hover">
                      <thead>
                        <tr>
                          <th rowspan="2">일자</th>
                          <th colspan="3">신규 가입 회원 수</th>
                          <th colspan="3">방문 회원 수</th>
                        </tr>
                        <tr>
                          <th>일반 회원</th>
                          <th>병원 회원</th>
                          <th>모든 회원</th>
                          <th>일반 회원</th>
                          <th>병원 회원</th>
                          <th>모든 회원</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>어제와 오늘 비교</td>
                          <td>+1%</td>
                          <td>+25%</td>
                          <td>+10%</td>
                          <td>+10%</td>
                          <td>+15%</td>
                          <td>+12%</td>
                        </tr>
                        <tr>
                          <td>2024-07-16(화)</td>
                          <td>100</td>
                          <td>5</td>
                          <td>105</td>
                          <td>20,000</td>
                          <td>100</td>
                          <td>20,100</td>
                        </tr>
                        <tr>
                          <td>2024-07-15(월)</td>
                          <td>99</td>
                          <td>4</td>
                          <td>103</td>
                          <td>19,000</td>
                          <td>99</td>
                          <td>19,099</td>
                        </tr>
                        <tr>
                          <td>2024-07-14(일)</td>
                          <td>98</td>
                          <td>2</td>
                          <td>100</td>
                          <td>18,000</td>
                          <td>98</td>
                          <td>18,098</td>
                        </tr>
                        <tr>
                          <td>2024-07-13(토)</td>
                          <td>100</td>
                          <td>5</td>
                          <td>105</td>
                          <td>20,000</td>
                          <td>100</td>
                          <td>20,100</td>
                        </tr>
                        <tr>
                          <td>2024-07-12(금)</td>
                          <td>100</td>
                          <td>5</td>
                          <td>105</td>
                          <td>20,000</td>
                          <td>100</td>
                          <td>20,100</td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div class="btnBox">
                    <button class="btn btn-warning"><b>그래프 보기</b></button>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-12">
              <div class="card">
                <div class="card-header">
                  <h4 class="card-title">시간별 통계</h4>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table
                      id="basic-datatables2"
                      class="display table table-striped table-hover"
                    >
                      <thead>
                        <tr>
                          <th rowspan="2">시간</th>
                          <th colspan="3">접속 회원 수</th>
                        </tr>
                        <tr>
                          <th>일반 회원</th>
                          <th>병원 회원</th>
                          <th>모든 회원</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>00~01</td>
                          <td>1</td>
                          <td>0</td>
                          <td>1</td>
                        </tr>
                        <tr>
                          <td>01~02</td>
                          <td>2</td>
                          <td>0</td>
                          <td>2</td>
                        </tr>
                        <tr>
                          <td>02~03</td>
                          <td>3</td>
                          <td>1</td>
                          <td>4</td>
                        </tr>
                        <tr>
                          <td>03~04</td>
                          <td>5</td>
                          <td>3</td>
                          <td>8</td>
                        </tr>
                        <tr>
                          <td>04~05</td>
                          <td>6</td>
                          <td>4</td>
                          <td>10</td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  <div class="btnBox">
                    <button class="btn btn-warning"><b>그래프 보기</b></button>
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
    <script src="../resources/js/core/jquery-3.7.1.min.js"></script>
    <script src="../resources/js/core/popper.min.js"></script>
    <script src="../resources/js/core/bootstrap.min.js"></script>

    <!-- jQuery Scrollbar -->
    <script src="../resources/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
    <!-- Datatables -->
    <script src="../resources/js/plugin/datatables/datatables.min.js"></script>
    <!-- Kaiadmin JS -->
    <script src="../resources/js/kaiadmin.min.js"></script>
    <!-- Kaiadmin DEMO methods, don't include it in your project! -->
    <script src="../resources/js/setting-demo2.js"></script>
    <script>
      $(document).ready(function () {
        $("#basic-datatables").DataTable({});

        $("#multi-filter-select").DataTable({
          pageLength: 5,
          initComplete: function () {
            this.api()
              .columns()
              .every(function () {
                var column = this;
                var select = $(
                  '<select class="form-select"><option value=""></option></select>'
                )
                  .appendTo($(column.footer()).empty())
                  .on("change", function () {
                    var val = $.fn.dataTable.util.escapeRegex($(this).val());

                    column
                      .search(val ? "^" + val + "$" : "", true, false)
                      .draw();
                  });

                column
                  .data()
                  .unique()
                  .sort()
                  .each(function (d, j) {
                    select.append(
                      '<option value="' + d + '">' + d + "</option>"
                    );
                  });
              });
          },
        });

        // Add Row
        $("#add-row").DataTable({
          pageLength: 5,
        });

        var action =
          '<td> <div class="form-button-action"> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-primary btn-lg" data-original-title="Edit Task"> <i class="fa fa-edit"></i> </button> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-danger" data-original-title="Remove"> <i class="fa fa-times"></i> </button> </div> </td>';

        $("#addRowButton").click(function () {
          $("#add-row")
            .dataTable()
            .fnAddData([
              $("#addName").val(),
              $("#addPosition").val(),
              $("#addOffice").val(),
              action,
            ]);
          $("#addRowModal").modal("hide");
        });
      });
    </script>
  </body>
</html>
    