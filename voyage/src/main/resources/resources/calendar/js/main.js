(function($) {

	"use strict";
	
	$( document ).ready(function() {
	
	var roomNo = $('input[name=accomRoomNo]').val();
	
	// 기존 예약일을 저장하는 배열
	var reserveDays = [];
		
	// start Ajax
    $.ajax({
        type : 'GET',
        dataType : 'json',
        url : "/voyage/accomRoomReserveDay?"
            + "accomRoomNo="
            + roomNo,
            error : function(err) {
                console.log("실행중 오류가 발생하였습니다.");
            },
        async:false, // ajax 데이터 전역 변수에 저장
        success : function(data) {
        	
			$(data).each(function(index, item){ // each : JSON의 반복문
				reserveDays[index] = item;
			});
    	} 
     });
     // end Ajax
     	     
	     console.log("reserveDays"+reserveDays);
	     	
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
					var shownYear = passed_year;
					var shownDate = calMonthArray[cell].day;
					var shownMonth = calMonthArray[cell].monthday;
					
					// 월과 일이 한 자릿수면 앞에 0을 붙여줌
					if(shownMonth.toString().length < 2) {
						shownMonth = '0'+shownMonth;
					}
					if(shownDate.toString().length < 2) {
						shownDate = '0'+shownDate;
					}
					
					var dateObj = shownYear + '-' + shownMonth + '-' + shownDate;
					//console.log("dateObj"+dateObj);
					
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
						var m = checkToday(iter_date)?'<div class="today">':"<div value=" + dateObj +">";
					}
								
					// 기존 예약일은 예약 불가
					for(var d=0; d<=reserveDays.length; d++) {
						if(dateObj == reserveDays[d]) {
							var m = '<div class="past-date" style="text-decoration: line-through;">';
						} else if(checkToday(iter_date)) {
							var m = '<div class="past-date" style="text-decoration: line-through; font-weight: 700; font-size: 18px; color: #bd83ce;">';
						}
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
							//$(this).removeAttr('name');
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
							//$(this).removeAttr('name');
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
						//$(this).removeAttr('name');
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

				// 예약일 문자열 전체를 저장할 변수
				var reserveTxt = '';
				
				function highlightDates(passed_year, passed_month, dateElements){
					if (passed_year in selected && passed_month in selected[passed_year]) {
						var daysToCompare = selected[passed_year][passed_month];
						// console.log(daysToCompare);
						for (var d in daysToCompare) {
							dateElements.each(function(index) {
								if (parseInt($(this).text()) == daysToCompare[d]) {
									$(this).addClass('selected');
									reserveTxt += $(this).text();
								}
								
							});	
								
						}
						
					}
					//var checkInYear = passed_year;
					//var checkInMonth = passed_month+1;
					//console.log("passed_year"+passed_year);
					//console.log("passed_month"+(passed_month+1));
				
					// 체크인 날짜는 예약일 문자열 전체 중 앞에서 두글자
					var checkInDate = reserveTxt.substring(0, 2);
					console.log("checkInDate"+checkInDate);
					
					// 체크아웃 날짜는 예약일 문자열 전체 중 뒤에서 두글자
					var checkOutDate = reserveTxt.substring(reserveTxt.length-2, reserveTxt.length);
					console.log("checkOutDate"+checkOutDate);
					
					// 총 숙박일은 예약일 문자열 전체를 2로 나눈 값
					var days = reserveTxt.length / 2;
							
					$('#checkInDate').empty();
					$('#checkOutDate').empty();
					$('#days').empty();
						
					$('#checkInDate').append(checkInDate);
					$('#checkOutDate').append(checkOutDate);
					$('#days').append(days);
					
					//var accomCheckIn = checkInYear + '-' + checkInMonth + '-' + checkInDate;
					//var accomCheckOut = checkInYear + '-' + checkInMonth + '-' + checkOutDate;
					//console.log("accomCheckIn"+accomCheckIn);
					//console.log("accomCheckOut"+accomCheckOut);
					
					//var class_name = $('#selected').attr('class');
					//console.log("class_name"+class_name);
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
						weekday: daysArray[getWeekdayNum(passed_year,passed_month,r)],
						monthday: passed_month+1
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
				
				var checkIny = firstClicked.year;
				var checkInm = firstClicked.month+1;
				var checkInd = firstClicked.date;

				var checkOuty = secondClicked.year;
				var checkOutm = secondClicked.month+1;
				var checkOutd = secondClicked.date;
				
				// 월과 일이 한 자릿수면 앞에 0을 붙여줌
				if(checkInm < 10) {
					checkInm = '0'+checkInm;
				}
				if(checkOutm < 10) {
					checkOutm = '0'+checkOutm;
				}
				if(checkInd < 10) {
					checkInd = '0'+checkInd;
				}
				if(checkOutd < 10) {
					checkOutd = '0'+checkOutd;
				}
				
				var checkInDate = checkIny + '-' + checkInm + '-' + checkInd;
				var checkOutDate = checkOuty + '-' + checkOutm + '-' + checkOutd;
				
				console.log("checkInDate"+checkInDate);
				console.log("checkOutDate"+checkOutDate);
				
				//$('#checkIn').append(checkInDate);
				//$('#checkOut').append(checkOutDate);

				$('input[name=checkIn]').attr('value',checkInDate);
				$('input[name=checkOut]').attr('value',checkOutDate);

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

$('#nextBtn').click(function(){
});
									
