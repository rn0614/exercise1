/**
 *  ocr.js
 */
$(document).ready(function(){
	$('#ocrForm').on('submit', function(event){
		event.preventDefault();  // submit 위에 reload 안되게
		var formData = new FormData($('#ocrForm')[0]);
		$('#imageIndicator').css({'visibility':'visible'});
     	
      
		$.ajax({
			type:"post",
			enctype:"multipart/form-data",
			url:"dietOCR",
			data:formData,
			processData:false,  // 필수
			contentType:false,  // 필수
			success:function(nfvo){
				/*var jsonNfvo = JSON.parse(nfvo)*/
/*				alert(nfvo.amountUnit);
				console.log(nfvo);*/
				/*$('#resultDiv').html(nfvo.getUnitAmount());*/
				$('#totalAmount').val(nfvo.totalAmount);
				$('.amountUnit').text(nfvo.amountUnit);
				$("#totalAmount").css({"background":"#AAB2BD"});
				
				$('#unitAmount').val(nfvo.unitAmount);
				$("#unitAmount").css({"background":"#AAB2BD"});
				
				$('#unitCalories').val(nfvo.unitcalories);
				$("#unitCalories").css({"background":"#AAB2BD"});
				
			},
			
			/*NutriFactVO [totalAmount=90.0, amountUnit=g, unitAmount=90.0, unitcalories=465.0]*/
			
			error:function(e){
				alert("에러 발생!! : " + e);
				
			}
		});
	});
	
	// food에 넣기
	$('#ocrResultForm').on('submit', function(event){
		event.preventDefault();  // submit 위에 reload 안되게
		var randNum1 = Math.floor(Math.random() * 10000000);
		var randNum2 = Math.floor(Math.random() * 10000000000);
 		var tempStrYYYYMM = $("#yearmonth").text();
		var tempStrMMDD = $("#clickDay2").text();
		
		var currYear = tempStrYYYYMM.slice(0, tempStrYYYYMM.indexOf('.')).trim();
		var currMonth = tempStrYYYYMM.slice(tempStrYYYYMM.indexOf('.') + 1).trim();
		var currDate = tempStrMMDD.slice(tempStrMMDD.indexOf('월') + 1, tempStrMMDD.indexOf('일')).trim();
		
		
		
		
		var foodConditionData = {};
		foodConditionData['condFCode'] = "O" + randNum1;
		foodConditionData['condFName'] = document.getElementById('prodName').value.trim();
		foodConditionData['condF_category'] = "OCR 입력";
		foodConditionData['condServings'] = document.getElementById('unitAmount').value.trim();
		foodConditionData['condKcal'] = document.getElementById('unitCalories').value.trim();
		foodConditionData['condKcal_per_100'] =  
			(Number(document.getElementById('unitCalories').value.trim()) * 100 /
				Number(document.getElementById('unitAmount').value.trim())).toFixed(2);
				
		var calendarConditionData = {};
		// id 는 session 으로 받아온다
		calendarConditionData['condCalCode'] = "C" + randNum2;
		calendarConditionData['condFCode'] = "O" + randNum1;
		calendarConditionData['condEYear'] = currYear.trim();
		calendarConditionData['condEMonth'] = currMonth.trim();
		calendarConditionData['condEDate'] = currDate.trim();
		calendarConditionData['condEAmt'] = document.getElementById('intake').value.trim();
		calendarConditionData['condETime'] = $("#clickTime2").text().trim();

		// food 부터 넣자 
		$.ajax({
			type:"post",
			async: false, // 이거 설정 안해주면 calendar 데이터가 먼저 들어가서 fCode 없다고 난리침
			data: foodConditionData,
			url: "insertFoodData",
			success:function() {
				alert("음식 데이터를 성공적으로 저장했습니다 :>");
			},
			error:function(e) {
				alert("음식 데이터를 저장하지 못했습니다 :<\n" + e);
			}
			
		});
		
		// calendar 차례 
		$.ajax({
			type:"post",
			async: false, // 이거 설정 안해주면 calendar 데이터가 먼저 들어가서 fCode 없다고 난리침
			data: calendarConditionData,
			url: "insertCalendarData",
			success:function() {
				alert("식단 데이터를 성공적으로 저장했습니다 :>");
			},
			error:function(e) {
				alert("식단 데이터를 저장하지 못했습니다 :<\n" + e);
			}
			
		});
		
		
		
		// 만약에 숫자가 겹쳐서 안들어가면 alert("다시 시도해주세요 :)")
	});
	
});