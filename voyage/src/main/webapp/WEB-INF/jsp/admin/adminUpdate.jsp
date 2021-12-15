<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<head>
	<title>관리자 정보 수정</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
	<meta name="author" content="AdminKit">
	<meta name="keywords" content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link rel="shortcut icon" href="img/icons/icon-48x48.png" />

	<link rel="canonical" href="https://demo-basic.adminkit.io/" />
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
		background-color:black;
		font-family: 'SpoqaHanSansNeo-Regular';
	}
	
	.container{
		font-size: 18px;
	}
	.form-control {
		font-size: 13px;
	}

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
		
		
	<!-- Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
       
                </div>
            </div>
        </div>
    </div>
			<main class="content">
			<div class="container-fluid p-0">
            <div class="container-fluid p-0">
                <div class="row">
                    <div class="content">
                        <h1 class="page-title">관리자 : <span class="orange strong">${adminSession.getAdminId()}</span></h1>               
                    </div>
                </div>
            </div>
        </div>
        <!-- End page header --> 

        <!-- property area -->
        <div class="content-area user-profiel" style="background-color: #FCFCFC;">&nbsp;
            <div class="container">   
                <div class="row">
                    <div class="col-sm-10 col-sm-offset-1 profiel-container">
                            <div class="profiel-header">
                                <h2>
                                    관리자 정보 수정 <br>
                                </h2>
                                <hr>
                            </div>
              	<form name="AdminUpdate" action="${pageContext.request.contextPath}/admin/adminUpdate" method="post">
                            <div class="clear" style="margin-left: 8%;">
                                <div class="col-sm-3 padding-top-25">

                                    <div class="form-group">
                                        <label>First Name</label>
                                        <input name="firstname" type="text" class="form-control" id="firstname" placeholder="성">
                                    </div>
                                    <div class="form-group">
                                        <label>Last Name</label>
                                        <input name="lastname" type="text" class="form-control" id="lastname" placeholder="이름">
                                    </div> 
                                    <div class="form-group">
                                        <label>Phone</label>
                                        <input name="phone" type="text" class="form-control" id="phone" placeholder="010-0000-0000">
                                    </div>
                                    <div class="form-group">
                                        <label>Email</label>
                                        <input name="email" type="email" class="form-control" id="email" placeholder="andrew@email@email.com.com">
                                    </div> 
                            </div>
                            </div>
                            <br>
   							 <div class="col-sm-5">
	                                <div class="form-group">
	                                  <input type="button" class="btn btn-primary")
	                                  onclick="execDaumPostcode()" value="우편번호">
	                                  <input type="number" class="form-control" id="adminAddressPostalCode" name="adminAddressPostalCode" placeholder="우편번호" value="${adminSession.adminAddress.adminAddressPostalCode}" readonly="readonly">
	                             	</div>
	                            	<div class="form-group">
	                             		<br>  
	                                  <input type="text" class="form-control" id="adminRoadAddress" name="adminRoadAddress" placeholder="도로명주소" value="${adminSession.adminAddress.adminAddressZip}" readonly="readonly">
	                            	</div>
	                            	<div class="form-group">
	                            	 	<br>     
	                                  <input type="text" class="form-control" id="adminDetailAddress" name="adminDetailAddress" placeholder="상세주소" value="${adminSession.adminAddress.adminAddressDetail}">
	                              </div>
	                            </div>  
                            <div class="col-sm-5 col-sm-offset-1">
                                <br>
                               <button type="button" class="btn btn-finish btn-primary" onclick="adminUpdate()">수정</button>  
                            </div>
                            </form>
                </div>
            </div><!-- end row -->
		</div>
    </div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
         <script>
         	// 다음(카카오) 주소 api
			                            function execDaumPostcode() {
			                                new daum.Postcode({
			                                    oncomplete: function(data) {
			                                        // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
			                                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			                                        var roadAddr = data.roadAddress; // 도로명 주소 변수
			                                        var extraRoadAddr = ''; // 참고 항목 변수
	
			                                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
			                                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			                                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
			                                            extraRoadAddr += data.bname;
			                                        }
			                                        // 건물명이 있고, 공동주택일 경우 추가한다.
			                                        if(data.buildingName !== '' && data.apartment === 'Y'){
			                                           extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			                                        }
			                                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			                                        if(extraRoadAddr !== ''){
			                                            extraRoadAddr = ' (' + extraRoadAddr + ')';
			                                        }
	
			                                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
			                                        document.getElementById('adminAddressPostalCode').value = data.zonecode;
			                                        document.getElementById('adminRoadAddress').value = roadAddr;
			                                    }
			                                }).open();
			                            }
			
         	
         // 유효성 검사
            function adminUpdate(){
				if($("#firstname").val() == ""){
					alert('성을 입력해주세요.');
					return;
				} else if($("#lastname").val() == ""){
					alert('이름을 입력해주세요');
					return;
				} else if($("#email").val() == ""){
					alert('이메일 주소를 입력해주세요');
					return;
				} else if($("#phone").val() == ""){
					alert('전화번호를 입력해주세요');
					return;
				} else {
					AdminUpdate.submit();
				}
			};
     </script>


	
	</main>
</div>
</div>
    <!-- adminFooter : 시작 -->
    	<c:import url="partial\\adminFooter.jsp"/>
    <!-- adminFooter : 끝 -->

    
    <!-- Scroll Up -->
    <div id="back-top" >
        <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
    </div>
	<script src="${pageContext.request.contextPath}/admin/js/app.js"></script>
	
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
				labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
				datasets: [{
					label: "Sales ($)",
					fill: true,
					backgroundColor: gradient,
					borderColor: window.theme.primary,
					data: [
						2115,
						1562,
						1584,
						1892,
						1587,
						1923,
						2566,
						2448,
						2805,
						3438,
						2917,
						3327
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
				labels: ["Chrome", "Firefox", "IE"],
				datasets: [{
					data: [4306, 3801, 1689],
					backgroundColor: [
						window.theme.primary,
						window.theme.warning,
						window.theme.danger
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
		// Bar chart
		new Chart(document.getElementById("chartjs-dashboard-bar"), {
			type: "bar",
			data: {
				labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
				datasets: [{
					label: "This year",
					backgroundColor: window.theme.primary,
					borderColor: window.theme.primary,
					hoverBackgroundColor: window.theme.primary,
					hoverBorderColor: window.theme.primary,
					data: [54, 67, 41, 55, 62, 45, 55, 73, 60, 76, 48, 79],
					barPercentage: .75,
					categoryPercentage: .5
				}]
			},
			options: {
				maintainAspectRatio: false,
				legend: {
					display: false
				},
				scales: {
					yAxes: [{
						gridLines: {
							display: false
						},
						stacked: false,
						ticks: {
							stepSize: 20
						}
					}],
					xAxes: [{
						stacked: false,
						gridLines: {
							color: "transparent"
						}
					}]
				}
			}
		});
	});
	</script>
	<script>
	document.addEventListener("DOMContentLoaded", function() {
		var markers = [{
				coords: [31.230391, 121.473701],
				name: "Shanghai"
			},
			{
				coords: [28.704060, 77.102493],
				name: "Delhi"
			},
			{
				coords: [6.524379, 3.379206],
				name: "Lagos"
			},
			{
				coords: [35.689487, 139.691711],
				name: "Tokyo"
			},
			{
				coords: [23.129110, 113.264381],
				name: "Guangzhou"
			},
			{
				coords: [40.7127837, -74.0059413],
				name: "New York"
			},
			{
				coords: [34.052235, -118.243683],
				name: "Los Angeles"
			},
			{
				coords: [41.878113, -87.629799],
				name: "Chicago"
			},
			{
				coords: [51.507351, -0.127758],
				name: "London"
			},
			{
				coords: [40.416775, -3.703790],
				name: "Madrid "
			}
		];
		var map = new jsVectorMap({
			map: "world",
			selector: "#world_map",
			zoomButtons: true,
			markers: markers,
			markerStyle: {
				initial: {
					r: 9,
					strokeWidth: 7,
					stokeOpacity: .4,
					fill: window.theme.primary
				},
				hover: {
					fill: window.theme.primary,
					stroke: window.theme.primary
				}
			},
			zoomOnScroll: false
		});
		window.addEventListener("resize", () => {
			map.updateSize();
		});
	});
	</script>
	<script>
	document.addEventListener("DOMContentLoaded", function() {
		var date = new Date(Date.now() - 5 * 24 * 60 * 60 * 1000);
		var defaultDate = date.getUTCFullYear() + "-" + (date.getUTCMonth() + 1) + "-" + date.getUTCDate();
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