$(document).ready(function(){

	$('#keyword').on('focus', function(){
		$('#keyword').css({'border-color':'#f56a6a'});
		$('.fa-search').css({'color':'#f56a6a'});
	});
		
	$('#keyword').on('blur', function(){
		$('#keyword').css({'border-color':'#7f888f'});
		$('.fa-search').css({'color':'#7f888f'});
	});

	$('#glass').on('click', function(event){
		$('#textForm').submit();
	});
		
	$('#textForm').on('submit', function(event){
		$('#TextSeachTable').empty();
		var keywordDate = document.getElementById("keyword").value.trim();
		var conditionDate = {
			"keyword": keywordDate
		};
		event.preventDefault();

		$.ajax({

			type:"post",
			async: false, // 이거 설정 안해주면 calendar 데이터가 먼저 들어가서 fCode 없다고 난리침
			data: conditionDate,
			url: "SearchWithText",
			success:function(arrayListOfFood) {
				
				var foodHtmlStr = 
					"<table id='SearchfList' border='1' width='100%'>" +		            	
						"<tr>" +
		            		"<th style='display:none;'>음식코드</th>" +
	            			"<th>음식명</th>" +
	            			"<th>1회제공량<br>(g / ml)</th>" +
		            		"<th>칼로리<br>(Kcal)</th>" +
		            	"</tr>"; 
		            	
				for (var i=0; i<arrayListOfFood.length; i++) {
					var foodVo = arrayListOfFood[i];
					foodHtmlStr += 
						"<tr class='fDataRow' id='ftr" + i + "'>" +
							"<td style='display:none;'>" + foodVo.fCode + "</td>" + 
							"<td>" + foodVo.fName + "</td>" +
							"<td>" + foodVo.servings + "</td>" + 
							"<td>" + foodVo.kcal + "</td>" + 
						"</tr>";
				}
				foodHtmlStr += "</table>";
				$('#TextSeachTable').append(foodHtmlStr);
			},
			error:function(e) {
				alert("음식 데이터를 저장하지 못했습니다 :<\n" + e);
			}
			
		});
		
		
	});	
	$(document).on('click', '.fDataRow',function(event){
		$("#hiddenFCode").empty();		
		$('.fDataRow').css({'background-color':"#F4F1FD"});
		$(this).css({'background-color':'#f56a6a'});
		
		var foodName = $(this).children().eq(1).text().trim();
		$("#hiddenFCode").append($(this).children().eq(0).text().trim());
		$('#tFoodName').val("");
		$('#tFoodAmt').val("");
		$('#tFoodName').val(foodName);
		$('#tFoodName').css({"background":"#AAB2BD"});
	});
	
	$('#checkForm').on('submit', function(event){
		event.preventDefault();

		var randNum = Math.floor(Math.random() * 10000000000);
		var tempStrYYYYMM = $("#yearmonth").text();
		var tempStrMMDD = $("#clickDay1").text();
		var currYear = tempStrYYYYMM.slice(0, tempStrYYYYMM.indexOf('.')).trim();
		var currMonth = tempStrYYYYMM.slice(tempStrYYYYMM.indexOf('.') + 1).trim();
		var currDate = tempStrMMDD.slice(tempStrMMDD.indexOf('월') + 1, tempStrMMDD.indexOf('일')).trim();
		
		condCalenDate = {};
		condCalenDate['condCalCode'] = "C" + randNum;
		condCalenDate['condFCode'] = $("#hiddenFCode").text();
		condCalenDate['condEYear'] = currYear.trim();
		condCalenDate['condEMonth'] = currMonth.trim();
		condCalenDate['condEDate'] = currDate.trim();
		condCalenDate['condEAmt'] = document.getElementById('tFoodAmt').value.trim();
		condCalenDate['condETime'] = $("#clickTime2").text().trim();

		$.ajax({
			type:"post",
			async: false, // 이거 설정 안해주면 calendar 데이터가 먼저 들어가서 fCode 없다고 난리침
			data: condCalenDate,
			url: "insertCalendarData",
			success:function() {
				alert("식단 데이터를 성공적으로 저장했습니다리링 :>");
			},
			error:function(e) {
				alert("식단 데이터를 저장하지 못했습니다리링 :<\n" + e);
			}
		});
		
	});
});