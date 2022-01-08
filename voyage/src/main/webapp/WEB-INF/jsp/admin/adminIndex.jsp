<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <meta name="description" content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
   <meta name="author" content="AdminKit">
   <meta name="keywords" content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

   <link rel="preconnect" href="https://fonts.gstatic.com">
   <link rel="shortcut icon" href="img/icons/icon-48x48.png" />

   <link rel="canonical" href="https://demo-basic.adminkit.io/" />

   <title>관리자 페이지</title>

   <link href="${pageContext.request.contextPath}/admin/css/app.css" rel="stylesheet">
   <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
</head>
  <!-- 눈누 - 한산스네오 레귤러 폰트 -->
   <style type="text/css">
   
      @font-face {
          font-family: 'SpoqaHanSansNeo-Regular';
             src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SpoqaHanSansNeo-Regular.woff') format('woff');
          font-weight: normal;
          font-style: normal;
      }
      
      body {
         font-family: 'SpoqaHanSansNeo-Regular';
      }
      
   </style>
<body>
   <div class="wrapper">
    <!-- adminKit : 시작 -->
       <c:import url="partial\\adminKit.jsp"/>
    <!-- adminKit : 끝 -->
   <div class="main">
    <!-- adminKit : 시작 -->
       <c:import url="partial\\adminBanner.jsp"/>
    <!-- adminKit : 끝 -->
      <main class="content">
         <div class="container-fluid p-0">
   
            <h1 class="h3 mb-3"><strong>관리자</strong> 메인 페이지</h1>
   
            <div class="row">   
               <div align="center">
                  <h5 class="h5 mb-3"><strong>사업자</strong> 총 수익확인 </h5>
               </div>
               <div class="col-xl-6 col-xxl-5 d-flex">
                  <div class="w-100">
                     <div class="row">
                        <div class="col-sm-6">
                           <!-- 이번달 결제 수 차트 -->
                           <div class="card">
                              <div class="card-body">
                                 <div class="row">
                                    <div class="col mt-0">
                                       <h5 class="card-title">이번달 결제 수</h5>
                                    </div>
                                    <div class="col-auto">
                                       <div class="stat text-primary">
                                          <i class="align-middle" data-feather="user"></i>
                                       </div>
                                    </div>
                                 </div>
                                 <h1 class="mt-1 mb-3">${totalPersonMonth} 회</h1>
                                 <div class="mb-0">
                                    <span class="text-muted"> <i class="mdi mdi-arrow-bottom-right"></i> ${calendarList[0]}</span>
                                    <span class="text-muted">월</span>
                                 </div>
                              </div>
                           </div>
                           <!-- 1년간 결제 수 차트 -->
                           <div class="card">
                              <div class="card-body">
                                 <div class="row">
                                    <div class="col mt-0">
                                       <h5 class="card-title">1년간 결제 수</h5>
                                    </div>
   
                                    <div class="col-auto">
                                       <div class="stat text-primary">
                                          <i class="align-middle" data-feather="users"></i>
                                       </div>
                                    </div>
                                 </div>
                                 <h1 class="mt-1 mb-3">${totalPersonYear} 회</h1>
                                 <div class="mb-0">
                                    <span class="text-muted"> <i class="mdi mdi-arrow-bottom-right"></i> ${calendarList[0]}</span>
                                    <span class="text-muted">월</span>
                                 </div>
                              </div>
                           </div>
                        </div>
                        
                        <div class="col-sm-6">
                           <!-- 이번달 수익 차트 -->
                           <div class="card">
                              <div class="card-body">
                                 <div class="row">
                                    <div class="col mt-0">
                                       <h5 class="card-title">이번 달 총 수익</h5>
                                    </div>
   
                                    <div class="col-auto">
                                       <div class="stat text-primary">
                                          <i class="align-middle" data-feather="dollar-sign"></i>
                                       </div>
                                    </div>
                                 </div>
                                 <h1 class="mt-1 mb-3">${totalPaymentMonth} &#8361</h1>
                                 <div class="mb-0">
                                    <span class="text-muted"> <i class="mdi mdi-arrow-bottom-right"></i> ${calendarList[0]}</span>
                                    <span class="text-muted">월</span>
                                 </div>
                              </div>
                           </div>
                           <!-- 1년간 총 수익 차트 -->
                           <div class="card">
                              <div class="card-body">
                                 <div class="row">
                                    <div class="col mt-0">
                                       <h5 class="card-title">1년간 총 수익</h5>
                                    </div>
   
                                    <div class="col-auto">
                                       <div class="stat text-primary">
                                          <i class="align-middle" data-feather="dollar-sign"></i>
                                       </div>
                                    </div>
                                 </div>
                                 <h1 class="mt-1 mb-3">${totalPaymentYear} &#8361</h1>
                                 <div class="mb-0">
                                    <span class="text-muted"> <i class="mdi mdi-arrow-bottom-right"></i> ${calendarList[0]}</span>
                                    <span class="text-muted">월</span>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
   
               <div class="col-xl-6 col-xxl-7">
                  <div class="card flex-fill w-100">
                     <!-- RecentMovement 선그래프 차트 -->
                     <div class="card-header">
   
                        <h5 class="card-title mb-0">월 별 수익</h5>
                     </div>
                     <div class="card-body py-3">
                        <div class="chart chart-sm">
                           <canvas id="chartjs-dashboard-line"></canvas>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            
            <div class="row">
               <div class="col-xl-6 col-xxl-5 d-flex">
                  <div class="card flex-fill w-100">
                     <!-- Browser Usage 원형차트 -->
                     <div class="card-header">
   
                        <h5 class="card-title mb-0">숙소 체험 총 결제 건수</h5>
                     </div>
                     <div class="card-body d-flex">
                        <div class="align-self-center w-100">
                           <div class="py-3">
                              <div class="chart chart-xs">
                                 <canvas id="chartjs-dashboard-pie"></canvas>
                              </div>
                           </div>
   
                           <table class="table mb-0">
                              <tbody>
                                 <tr>
                                    <td>숙소</td>
                                    <td class="text-end">${totalPersonAccom}</td>
                                 </tr>
                                 <tr>
                                    <td>체험</td>
                                    <td class="text-end">${totalPersonActivity}</td>
                                 </tr>
                              </tbody>
                           </table>
                        </div>
                     </div>
                  </div>
               </div>   
            <div class="col-xl-6 col-xxl-5">
            <div class="card flex-fill">
               <!-- Calendar 달력 차트 -->
               <div class="card-header">
               <h5 class="card-title mb-0">Calendar</h5>
               </div>
               <div class="card-body d-flex">
                  <div class="align-self-center w-100">
                     <div class="chart" style="position: relative;;">
                        <div id="datetimepicker-dashboard"></div>
                     </div>
                  </div>
               </div>
            </div>
            </div>
         </div>
   

         </main>
    <!-- adminFooter : 시작 -->
       <c:import url="partial\\adminFooter.jsp"/>
    <!-- adminFooter : 끝 -->

      </div>
   </div>
   
   <script src="${pageContext.request.contextPath}/admin/js/app.js"></script>
   <!-- 차트 값 정보 -->
   <script>
   document.addEventListener("DOMContentLoaded", function() {
      var ctx = document.getElementById("chartjs-dashboard-line").getContext("2d");
      var gradient = ctx.createLinearGradient(0, 0, 0, 225);
      gradient.addColorStop(0, "rgba(215, 227, 244, 1)");
      gradient.addColorStop(1, "rgba(215, 227, 244, 0)");
      // Line chart
      new Chart(document.getElementById("chartjs-dashboard-line"), {
         type: "line",
         data: {
            labels: ["${calendarList[11]}", "${calendarList[10]}", "${calendarList[9]}", "${calendarList[8]}", "${calendarList[7]}", "${calendarList[6]}", "${calendarList[5]}", "${calendarList[4]}", "${calendarList[3]}", "${calendarList[2]}", "${calendarList[1]}", "${calendarList[0]}"],
            datasets: [{
               label: "월 총 수익(원)",
               fill: true,
               backgroundColor: gradient,
               borderColor: window.theme.primary,
               data: [
                  ${payList[11]},
                  ${payList[10]},
                  ${payList[9]},
                  ${payList[8]},
                  ${payList[7]},
                  ${payList[6]},
                  ${payList[5]},
                  ${payList[4]},
                  ${payList[3]},
                  ${payList[2]},
                  ${payList[1]},
                  ${payList[0]}
               ]
            }]
         },
         options: {
            maintainAspectRatio: false,
            legend: {
               display: false
            },
            tooltips: {
               intersect: false
            },
            hover: {
               intersect: true
            },
            plugins: {
               filler: {
                  propagate: false
               }
            },
            scales: {
               xAxes: [{
                  reverse: true,
                  gridLines: {
                     color: "rgba(0,0,0,0.0)"
                  }
               }],
               yAxes: [{
                  ticks: {
                     stepSize: 1000
                  },
                  display: true,
                  borderDash: [3, 3],
                  gridLines: {
                     color: "rgba(0,0,0,0.0)"
                  }
               }]
            }
         }
      });
   });
   </script>
   <script>
   document.addEventListener("DOMContentLoaded", function() {
      // Pie chart
      new Chart(document.getElementById("chartjs-dashboard-pie"), {
         type: "pie",
         data: {
            labels: ["숙소", "체험"],
            datasets: [{
               data: [${totalPersonAccom}, ${totalPersonActivity}],
               backgroundColor: [
                  window.theme.primary,
                  window.theme.warning
               ],
               borderWidth: 5
            }]
         },
         options: {
            responsive: !window.MSInputMethodContext,
            maintainAspectRatio: false,
            legend: {
               display: false
            },
            cutoutPercentage: 75
         }
      });
   });
   </script>
   
   
   <script>
   document.addEventListener("DOMContentLoaded", function() {
      var date = new Date(Date.now() - 5 * 24 * 60 * 60 * 1000);
      var defaultDate = new Date(Date.now());
      document.getElementById("datetimepicker-dashboard").flatpickr({
         inline: true,
         prevArrow: "<span title=\"Previous month\">&laquo;</span>",
         nextArrow: "<span title=\"Next month\">&raquo;</span>",
         defaultDate: defaultDate
      });
   });
   
   </script>

</body>

</html>