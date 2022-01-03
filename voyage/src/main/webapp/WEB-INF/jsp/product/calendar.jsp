<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="no-js">
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>VOYAGE | addAccomBuilding</title>
		<meta name="description" content="">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="shortcut icon" type="image/x-icon" href="${contextPath}/assets/img/favicon.ico">

		<!-- CSS here -->
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/owl.carousel.min.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/slicknav.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/flaticon.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/price_rangs.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/animate.min.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/magnific-popup.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/fontawesome-all.min.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/themify-icons.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/slick.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/nice-select.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
            
        <!-- calendar CSS -->
			<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
			<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
			<link rel="stylesheet" href="${contextPath}/calendar/css/style.css">
            
      		<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
      		<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
		
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
		
    </head>
    
    <body>
    <!-- Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="${contextPath}/assets/img/logo/loder.jpg" alt="">
                </div>
            </div>
        </div>
    </div>
    
   	<c:import url="/WEB-INF/jsp/partial/banner.jsp"/>
   	
	<main>
	
	<!-- Hero Start-->
    <div class="hero-area3 hero-overly2 d-flex align-items-center ">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-8 col-lg-9">
                    <div class="hero-cap text-center pt-50 pb-20">
                        <h2>객실 상세</h2>
                    </div>
                    <!--Hero form -->
                
                </div>
            </div>
        </div>
    </div>
    <!--Hero End -->
	
	<section class="ftco-section">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-6 text-center mb-5">
						<h2 class="heading-section">Calendar #03</h2>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="calendar-section">
			        <div class="row no-gutters">
			          <div class="col-md-6">
	
			            <div class="calendar calendar-first" id="calendar_first">
			              <div class="calendar_header">
			                <button class="switch-month switch-left">
			                  <i class="fa fa-chevron-left"></i>
			                </button>
			                <h2></h2>
			                <button class="switch-month switch-right">
			                  <i class="fa fa-chevron-right"></i>
			                </button>
			              </div>
			              <div class="calendar_weekdays"></div>
			              <div class="calendar_content"></div>
			            </div>
	
			          </div>
			          <div class="col-md-6">
	
			            <div class="calendar calendar-second" id="calendar_second">
			              <div class="calendar_header">
			                <button class="switch-month switch-left">
			                  <i class="fa fa-chevron-left"></i>
			                </button>
			                <h2></h2>
			                <button class="switch-month switch-right">
			                  <i class="fa fa-chevron-right"></i>
			                </button>
			              </div>
			              <div class="calendar_weekdays"></div>
			              <div class="calendar_content"></div>
			            </div>            
	
			          </div>
	
			        </div> <!-- End Row -->
			            
			      </div> <!-- End Calendar -->
					</div>
				</div>
			</div>
		</section>
	
	</main>
	<!--footer.jsp 시작  -->
    	<c:import url="/WEB-INF/jsp/partial/footer.jsp"/>
    <!--footer.jsp 끝  -->
    
    <!-- Scroll Up -->
    <div id="back-top" >
        <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
    </div>
    
    <!-- JS here -->
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>    
    
		<!-- All JS Custom Plugins Link Here here -->
<%--         <script src="${pageContext.request.contextPath}/assets/js/vendor/modernizr-3.5.0.min.js"></script> --%>
		<!-- Jquery, Popper, Bootstrap -->
<%-- 		<script src="${pageContext.request.contextPath}/assets/js/vendor/jquery-1.12.4.min.js"></script> --%>
<%--         <script src="${pageContext.request.contextPath}/assets/js/popper.min.js"></script> --%>
<%--         <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script> --%>
	    <!-- Jquery Mobile Menu -->
<%--         <script src="${pageContext.request.contextPath}/assets/js/jquery.slicknav.min.js"></script> --%>

		<!-- Jquery Slick , Owl-Carousel Plugins -->
<%--         <script src="${pageContext.request.contextPath}/assets/js/owl.carousel.min.js"></script> --%>
<%--         <script src="${pageContext.request.contextPath}/assets/js/slick.min.js"></script> --%>
		<!-- One Page, Animated-HeadLin -->
        <script src="${pageContext.request.contextPath}/assets/js/wow.min.js"></script>
<%--         <script src="${pageContext.request.contextPath}/assets/js/price-range.js"></script> --%>
<%-- 		<script src="${pageContext.request.contextPath}/assets/js/animated.headline.js"></script> --%>
<%--         <script src="${pageContext.request.contextPath}/assets/js/jquery.magnific-popup.js"></script> --%>

		<!-- Nice-select, sticky -->
<%--         <script src="${pageContext.request.contextPath}/assets/js/jquery.nice-select.min.js"></script> --%>
<%-- 		<script src="${pageContext.request.contextPath}/assets/js/jquery.sticky.js"></script> --%>
        
        <!-- contact js -->
<%--         <script src="${pageContext.request.contextPath}/assets/js/contact.js"></script> --%>
<%--         <script src="${pageContext.request.contextPath}/assets/js/jquery.form.js"></script> --%>
<%--         <script src="${pageContext.request.contextPath}/assets/js/jquery.validate.min.js"></script> --%>
<%--         <script src="${pageContext.request.contextPath}/assets/js/mail-script.js"></script> --%>
<%--         <script src="${pageContext.request.contextPath}/assets/js/jquery.ajaxchimp.min.js"></script> --%>
        
		<!-- Jquery Plugins, main Jquery -->	
        <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
      
    <!-- calendar JS -->
      	<script src="${pageContext.request.contextPath}/calendar/js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/calendar/js/popper.js"></script>
		<script src="${pageContext.request.contextPath}/calendar/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/calendar/js/main.js"></script>
      
      	<script type="text/javascript">
      	(function($) {

      		"use strict";

      		$( document ).ready(function() {
      			function c(passed_month, passed_year, calNum) {
      				var calendar = calNum == 0 ? calendars.cal1 : calendars.cal2;
      				makeWeek(calendar.weekline);
      				calendar.datesBody.empty();
      				var calMonthArray = makeMonthArray(passed_month, passed_year);
      				var r = 0;
      				var u = false;
      				while(!u) {
      					if(daysArray[r] == calMonthArray[0].weekday) { u = true } 
      					else { 
      						calendar.datesBody.append('<div class="blank"></div>');
      						r++;
      					}
      				} 
      				for(var cell=0;cell<42-r;cell++) { // 42 date-cells in calendar
      					if(cell >= calMonthArray.length) {
      						calendar.datesBody.append('<div class="blank"></div>');
      					} else {
      						var shownDate = calMonthArray[cell].day;
      						// Later refactiroing -- iter_date not needed after "today" is found
      						var iter_date = new Date(passed_year,passed_month,shownDate); 
      						if ( 
      							(
      								( shownDate != today.getDate() && passed_month == today.getMonth() ) 
      								|| passed_month != today.getMonth()
      							) 
      								&& iter_date < today) {						
      							var m = '<div class="past-date">';
      						} else {
      							var m = checkToday(iter_date)?'<div class="today">':"<div>";
      						}
      						calendar.datesBody.append(m + shownDate + "</div>");
      					}
      				}

      				// var color = o[passed_month];
      				calendar.calHeader.find("h2").text(i[passed_month]+" "+passed_year);
      							//.css("background-color",color)
      							//.find("h2").text(i[passed_month]+" "+year);

      				// find elements (dates) to be clicked on each time
      				// the calendar is generated
      				
      				//clickedElement = bothCals.find(".calendar_content").find("div");
      				var clicked = false;
      				selectDates(selected);

      				clickedElement = calendar.datesBody.find('div');
      				clickedElement.on("click", function(){
      					clicked = $(this);
      					if (clicked.hasClass('past-date')) { return; }
      					var whichCalendar = calendar.name;
      					console.log(whichCalendar);
      					// Understading which element was clicked;
      					// var parentClass = $(this).parent().parent().attr('class');
      					if (firstClick && secondClick) {
      						thirdClicked = getClickedInfo(clicked, calendar);
      						var firstClickDateObj = new Date(firstClicked.year, 
      													firstClicked.month, 
      													firstClicked.date);
      						var secondClickDateObj = new Date(secondClicked.year, 
      													secondClicked.month, 
      													secondClicked.date);
      						var thirdClickDateObj = new Date(thirdClicked.year, 
      													thirdClicked.month, 
      													thirdClicked.date);
      						if (secondClickDateObj > thirdClickDateObj
      							&& thirdClickDateObj > firstClickDateObj) {
      							secondClicked = thirdClicked;
      							// then choose dates again from the start :)
      							bothCals.find(".calendar_content").find("div").each(function(){
      								$(this).removeClass("selected");
      							});
      							selected = {};
      							selected[firstClicked.year] = {};
      							selected[firstClicked.year][firstClicked.month] = [firstClicked.date];
      							selected = addChosenDates(firstClicked, secondClicked, selected);
      						} else { // reset clicks
      							selected = {};
      							firstClicked = [];
      							secondClicked = [];
      							firstClick = false;
      							secondClick = false;
      							bothCals.find(".calendar_content").find("div").each(function(){
      								$(this).removeClass("selected");
      							});	
      						}
      					}
      					if (!firstClick) {
      						firstClick = true;
      						firstClicked = getClickedInfo(clicked, calendar);
      						selected[firstClicked.year] = {};
      						selected[firstClicked.year][firstClicked.month] = [firstClicked.date];
      					} else {
      						console.log('second click');
      						secondClick = true;
      						secondClicked = getClickedInfo(clicked, calendar);
      						//console.log(secondClicked);

      						// what if second clicked date is before the first clicked?
      						var firstClickDateObj = new Date(firstClicked.year, 
      													firstClicked.month, 
      													firstClicked.date);
      						var secondClickDateObj = new Date(secondClicked.year, 
      													secondClicked.month, 
      													secondClicked.date);

      						if (firstClickDateObj > secondClickDateObj) {

      							var cachedClickedInfo = secondClicked;
      							secondClicked = firstClicked;
      							firstClicked = cachedClickedInfo;
      							selected = {};
      							selected[firstClicked.year] = {};
      							selected[firstClicked.year][firstClicked.month] = [firstClicked.date];

      						} else if (firstClickDateObj.getTime() ==
      									secondClickDateObj.getTime()) {
      							selected = {};
      							firstClicked = [];
      							secondClicked = [];
      							firstClick = false;
      							secondClick = false;
      							$(this).removeClass("selected");
      						}


      						// add between dates to [selected]
      						selected = addChosenDates(firstClicked, secondClicked, selected);
      					}
      					// console.log(selected);
      					selectDates(selected);
      				});			

      			}
      			function selectDates(selected) {
      				if (!$.isEmptyObject(selected)) {
      					var dateElements1 = datesBody1.find('div');
      					var dateElements2 = datesBody2.find('div');

      					function highlightDates(passed_year, passed_month, dateElements){
      						if (passed_year in selected && passed_month in selected[passed_year]) {
      							var daysToCompare = selected[passed_year][passed_month];
      							// console.log(daysToCompare);
      							for (var d in daysToCompare) {
      								dateElements.each(function(index) {
      									if (parseInt($(this).text()) == daysToCompare[d]) {
      										$(this).addClass('selected');
      									}
      								});	
      							}
      							
      						}
      					}

      					highlightDates(year, month, dateElements1);
      					highlightDates(nextYear, nextMonth, dateElements2);
      				}
      			}

      			function makeMonthArray(passed_month, passed_year) { // creates Array specifying dates and weekdays
      				var e=[];
      				for(var r=1;r<getDaysInMonth(passed_year, passed_month)+1;r++) {
      					e.push({day: r,
      							// Later refactor -- weekday needed only for first week
      							weekday: daysArray[getWeekdayNum(passed_year,passed_month,r)]
      						});
      				}
      				return e;
      			}
      			function makeWeek(week) {
      				week.empty();
      				for(var e=0;e<7;e++) { 
      					week.append("<div>"+daysArray[e].substring(0,3)+"</div>") 
      				}
      			}

      			function getDaysInMonth(currentYear,currentMon) {
      				return(new Date(currentYear,currentMon+1,0)).getDate();
      			}
      			function getWeekdayNum(e,t,n) {
      				return(new Date(e,t,n)).getDay();
      			}
      			function checkToday(e) {
      				var todayDate = today.getFullYear()+'/'+(today.getMonth()+1)+'/'+today.getDate();
      				var checkingDate = e.getFullYear()+'/'+(e.getMonth()+1)+'/'+e.getDate();
      				return todayDate==checkingDate;

      			}
      			function getAdjacentMonth(curr_month, curr_year, direction) {
      				var theNextMonth;
      				var theNextYear;
      				if (direction == "next") {
      					theNextMonth = (curr_month + 1) % 12;
      					theNextYear = (curr_month == 11) ? curr_year + 1 : curr_year;
      				} else {
      					theNextMonth = (curr_month == 0) ? 11 : curr_month - 1;
      					theNextYear = (curr_month == 0) ? curr_year - 1 : curr_year;
      				}
      				return [theNextMonth, theNextYear];
      			}
      			function b() {
      				today = new Date;
      				year = today.getFullYear();
      				month = today.getMonth();
      				var nextDates = getAdjacentMonth(month, year, "next");
      				nextMonth = nextDates[0];
      				nextYear = nextDates[1];
      			}

      			var e=480;

      			var today;
      			var year,
      				month,
      				nextMonth,
      				nextYear;

      			//var t=2013;
      			//var n=9;
      			var r = [];
      			var i = ["January","February","March","April","May",
      					"June","July","August","September","October",
      					"November","December"];
      			var daysArray = ["Sunday","Monday","Tuesday",
      							"Wednesday","Thursday","Friday","Saturday"];
      			var o = ["#16a085","#1abc9c","#c0392b","#27ae60",
      					"#FF6860","#f39c12","#f1c40f","#e67e22",
      					"#2ecc71","#e74c3c","#d35400","#2c3e50"];
      			
      			var cal1=$("#calendar_first");
      			var calHeader1=cal1.find(".calendar_header");
      			var weekline1=cal1.find(".calendar_weekdays");
      			var datesBody1=cal1.find(".calendar_content");

      			var cal2=$("#calendar_second");
      			var calHeader2=cal2.find(".calendar_header");
      			var weekline2=cal2.find(".calendar_weekdays");
      			var datesBody2=cal2.find(".calendar_content");

      			var bothCals = $(".calendar");

      			var switchButton = bothCals.find(".calendar_header").find('.switch-month');

      			var calendars = { 
      							"cal1": { 	"name": "first",
      										"calHeader": calHeader1,
      										"weekline": weekline1,
      										"datesBody": datesBody1 },
      							"cal2": { 	"name": "second",
      										"calHeader": calHeader2,
      										"weekline": weekline2,
      										"datesBody": datesBody2	}
      							}
      			

      			var clickedElement;
      			var firstClicked,
      				secondClicked,
      				thirdClicked;
      			var firstClick = false;
      			var secondClick = false;	
      			var selected = {};

      			b();
      			c(month, year, 0);
      			c(nextMonth, nextYear, 1);
      			switchButton.on("click",function() {
      				var clicked=$(this);
      				var generateCalendars = function(e) {
      					var nextDatesFirst = getAdjacentMonth(month, year, e);
      					var nextDatesSecond = getAdjacentMonth(nextMonth, nextYear, e);
      					month = nextDatesFirst[0];
      					year = nextDatesFirst[1];
      					nextMonth = nextDatesSecond[0];
      					nextYear = nextDatesSecond[1];

      					c(month, year, 0);
      					c(nextMonth, nextYear, 1);
      				};
      				if(clicked.attr("class").indexOf("left")!=-1) { 
      					generateCalendars("previous");
      				} else { generateCalendars("next"); }
      				clickedElement = bothCals.find(".calendar_content").find("div");
      				console.log("checking");
      			});


      			//  Click picking stuff
      			function getClickedInfo(element, calendar) {
      				var clickedInfo = {};
      				var clickedCalendar,
      					clickedMonth,
      					clickedYear;
      				clickedCalendar = calendar.name;
      				//console.log(element.parent().parent().attr('class'));
      				clickedMonth = clickedCalendar == "first" ? month : nextMonth;
      				clickedYear = clickedCalendar == "first" ? year : nextYear;
      				clickedInfo = {"calNum": clickedCalendar,
      								"date": parseInt(element.text()),
      								"month": clickedMonth,
      								"year": clickedYear}
      				//console.log(clickedInfo);
      				return clickedInfo;
      			}


      			// Finding between dates MADNESS. Needs refactoring and smartening up :)
      			function addChosenDates(firstClicked, secondClicked, selected) {
      				if (secondClicked.date > firstClicked.date || 
      					secondClicked.month > firstClicked.month ||
      					secondClicked.year > firstClicked.year) {

      					var added_year = secondClicked.year;
      					var added_month = secondClicked.month;
      					var added_date = secondClicked.date;
      					console.log(selected);

      					if (added_year > firstClicked.year) {	
      						// first add all dates from all months of Second-Clicked-Year
      						selected[added_year] = {};
      						selected[added_year][added_month] = [];
      						for (var i = 1; 
      							i <= secondClicked.date;
      							i++) {
      							selected[added_year][added_month].push(i);
      						}
      				
      						added_month = added_month - 1;
      						console.log(added_month);
      						while (added_month >= 0) {
      							selected[added_year][added_month] = [];
      							for (var i = 1; 
      								i <= getDaysInMonth(added_year, added_month);
      								i++) {
      								selected[added_year][added_month].push(i);
      							}
      							added_month = added_month - 1;
      						}

      						added_year = added_year - 1;
      						added_month = 11; // reset month to Dec because we decreased year
      						added_date = getDaysInMonth(added_year, added_month); // reset date as well

      						// Now add all dates from all months of inbetween years
      						while (added_year > firstClicked.year) {
      							selected[added_year] = {};
      							for (var i=0; i < 12; i++) {
      								selected[added_year][i] = [];
      								for (var d = 1; d <= getDaysInMonth(added_year, i); d++) {
      									selected[added_year][i].push(d);
      								}
      							}
      							added_year = added_year - 1;
      						}
      					}
      					
      					if (added_month > firstClicked.month) {
      						if (firstClicked.year == secondClicked.year) {
      							console.log("here is the month:",added_month);
      							selected[added_year][added_month] = [];
      							for (var i = 1; 
      								i <= secondClicked.date;
      								i++) {
      								selected[added_year][added_month].push(i);
      							}
      							added_month = added_month - 1;
      						}
      						while (added_month > firstClicked.month) {
      							selected[added_year][added_month] = [];
      							for (var i = 1; 
      								i <= getDaysInMonth(added_year, added_month);
      								i++) {
      								selected[added_year][added_month].push(i);
      							}
      							added_month = added_month - 1;
      						}
      						added_date = getDaysInMonth(added_year, added_month);
      					}

      					for (var i = firstClicked.date + 1; 
      						i <= added_date;
      						i++) {
      						selected[added_year][added_month].push(i);
      					}
      				}
      				return selected;
      			}
      	});

      	})(jQuery);

      	</script>
    

</body>
</html>