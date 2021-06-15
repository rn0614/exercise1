$(document).ready(function(e){

	$('ul.tabs li').click(function(){
		
		var tempStrYYYYMM = $("#yearmonth").text();
		var tempStrMMDD = $("#clickDay2").text();
		
		var currYear = tempStrYYYYMM.slice(0, tempStrYYYYMM.indexOf('.')).trim();
		var currMonth = tempStrYYYYMM.slice(tempStrYYYYMM.indexOf('.') + 1).trim();
		var currDate = tempStrMMDD.slice(tempStrMMDD.indexOf('월') + 1, tempStrMMDD.indexOf('일')).trim();
		
		var conditionData = {};
		conditionData['condYear'] = currYear;
		conditionData['condMonth'] = currMonth;
		conditionData['condDate'] = currDate;
		
		$(".byTimeDietTable").empty();

		if ($(this).text() == "아침") {
			clickTime1.innerHTML = $(this).text();  // TextSearch에 있는 XX월 XX일
			clickTime2.innerHTML = $(this).text();  // OCRSearch에 있는 XX월 XX일
			conditionData['condTime'] = $(this).text();
			$('ul.tabs li').removeClass('current');
			$(this).addClass('current');
			$('.content').css('border-top-color', '#d3e9dc');
			
		} else if ($(this).text() == "점심") {
			clickTime1.innerHTML = $(this).text();
			clickTime2.innerHTML = $(this).text();
			conditionData['condTime'] = $(this).text();
			$('ul.tabs li').removeClass('current');
			$(this).addClass('current');
			$('.content').css('border-top-color', '#72b4ce');
			
		} else if ($(this).text() == "저녁") {
			clickTime1.innerHTML = $(this).text();
			clickTime2.innerHTML = $(this).text();
			conditionData['condTime'] = $(this).text();
			$('ul.tabs li').removeClass('current');
			$(this).addClass('current');
			$('.content').css('border-top-color', '#af9cbc');
			
		} else if ($(this).text() == "야식") {
			clickTime1.innerHTML = $(this).text();
			clickTime2.innerHTML = $(this).text();
			conditionData['condTime'] = $(this).text();
			$('ul.tabs li').removeClass('current');
			$(this).addClass('current');
			$('.content').css('border-top-color', '#4a578e');
			
		} else if ($(this).text() == "간식") {
			clickTime1.innerHTML = $(this).text();
			clickTime2.innerHTML = $(this).text();
			conditionData['condTime'] = $(this).text();
			$('ul.tabs li').removeClass('current');
			$(this).addClass('current');
			$('.content').css('border-top-color', '#F080A8');
		} 
		
		
		$.ajax({
			type: "get",
			data: conditionData,
			url: "byTimeDietList",
/*			processData:false,  // 필수
			contentType:false,  // 필수*/
			success:function(arrayListOfCalendarVO){
				$(".byTimeDietTable").empty();  // 자꾸 두 번씩 뜨길래 비워놓음
				var htmlStr = 
					"<table border='1'>" +		            	
						"<tr>" +
	            			"<th>음식명</th>" +
		            		"<th>섭취량<br>(ml/g)</th>" +
		            		"<th>칼로리<br>(Kcal)</th>" +
		            	"</tr>";
					            	
				htmlStr += "<tr>";
				for (var i=0; i<arrayListOfCalendarVO.length; i++){
					var calVo = arrayListOfCalendarVO[i];
					htmlStr += 
						"<tr>" +
							"<td>" + calVo.foodVO.fName + "</td>" +
							"<td>" + calVo.eAmt + "</td>" + 
							"<td>" + 
								(calVo.eAmt * calVo.foodVO.kcal / calVo.foodVO.servings).toFixed(2) + 
								/* 사용자의 섭취량에 따른 칼로리, doubleObj.toFixed(n) -> n자리까지 표현 */
							"</td>" + 
						"</tr>";
						
				}
				htmlStr += "</table>";
				$(".byTimeDietTable").append(htmlStr);
			},
			error:function(e){
				alert("selectTimeBtn.js에서 오류 발생 :<\n" + e);
			}
		});
		
	});

});
 
 