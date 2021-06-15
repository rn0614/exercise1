$(document).ready(function(){
	$('#insertFoodVOForm').on('submit', function(event){
		event.preventDefault();  // submit 위에 reload 안되게
		
		currFCode = "O" + Math.floor(Math.random() * 10000000);
		currFName = document.getElementById('foodName').value.trim();
		currF_category = $("#foodCateg option:selected").val();
		currServings = document.getElementById('foodServ').value.trim();
		currKcal = document.getElementById('foodCalo').value.trim();
		currKcal_per_100 = 
			(100 * currKcal / currServings).toFixed(2);
		
		
		var conditionData = {};
		
		conditionData['condFCode'] = currFCode;
		conditionData['condFName'] = currFName;
		conditionData['condF_category'] = currF_category;
		conditionData['condServings'] = currServings;
		conditionData['condKcal'] = currKcal;
		conditionData['condKcal_per_100'] = currKcal_per_100;
		
		$.ajax({
			type: "post",
			data: conditionData,
			url: "insertFoodData",
/*			processData:false,  // 필수
			contentType:false,  // 필수*/
			success:function() {
				alert("음식 데이터를 성공적으로 저장했습니다 '^'");
			},
			error:function(e) {
				alert("음식 데이터를 저장하지 못했습니다 '^'\n오류내용: " + e);
			}
			
		});
	});
});