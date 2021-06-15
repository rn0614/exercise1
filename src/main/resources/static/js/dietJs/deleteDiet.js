$(document).ready(function(){
	const cntArr = new Array(100);
	document.querySelector('#deleteDiet').addEventListener('click', function(e){
		
		cntArr.fill(0);
		if ($('#deleteChecker').css('display') == '') {
			$('#deleteChecker').css({display:'none'});
			$('#deleteParaphr').css({display:'none'});
			$('.dataRow').css({'background-color':'#F4F1FD'});
			$('.dataRow').css({'cursor':'default'});
		} else {
			$('#deleteChecker').css({display:''});
			$('#deleteParaphr').css({display:''});
			document.querySelector('.OCRSearchMenuwrap').classList.remove('on');  // 서브메뉴2 넣기
		    document.querySelector('.textSearchMenuwrap').classList.remove('on');  // 서브메뉴2 넣기
		    document.querySelector('.insertFoodVOwrap').classList.remove('on');
		    $('.dataRow').css({'cursor':'pointer'});
		}

	});
	cntArr.fill(0);
	
	$(document).on('click', '.dataRow', function(){
		if ($('#deleteChecker').css('display') == 'none') {
			
		} else {
			$('.dataRow').css({'cursor':'pointer'});  // 데이터행에 마우스를 가져갔을 때 손가락으로 바꾸기
			/*cntArr = new Array(dataLength);*/
			clickedIdx = $(this).closest('tr').prevAll().length -1;
			
			cntArr[clickedIdx] += 1;
			if (cntArr[clickedIdx] % 2 == 0) {
				$(this).css({'background-color':'#F4F1FD'});
			} else {
				$(this).css({'background-color':'#FF69B4'});
			}
			
		}
		

		// 어떤 것이 올라갔을 때 그게 몇 번 짼지 확인 -> 그 인덱스Arr 요소를 1 증가
		// 해당 요소가 짝수라면 원래색, 홀수면 핑크색 
		/*alert($(this).closest('tr').prevAll().length);*/ // 누른 것에 몇 번 째 인지 반환
	});
	
	
	$(document).on('click', '#deleteChecker', function(){
		
		var deleteArray = []
		
		var dataLength = $('#byDateDietTable tr').length - 1;
		for (var i=0; i<dataLength; i++){
			if (cntArr[i] % 2 == 0){
				
			} else {
				deleteArray.push($('#calTd' + i).text());
			}
		}
		var ConditionData = {};
		ConditionData["deleteList"] = deleteArray;
		
		$.ajax({
			type:"post",
			async: false, // 이거 설정 안해주면 calendar 데이터가 먼저 들어가서 fCode 없다고 난리침
			data: ConditionData,
			url: "deleteCalendarData",
			success:function() {
				alert("식단 데이터를 성공적으로 삭제했습니다 '^'\n새로고침(F5)을 눌러주세요 '^'");
			},
			error:function(e) {
				alert("식단 데이터를 삭제하지 못했습니다 '^'\n오류내용: " + e);
			}
			
		});
		
		$('.dataRow').css({'cursor':'default'});
		$('#deleteParaphr').css({display:'none'}); /* 식단 삭제 문구 없애기 */
		$('#deleteChecker').css({display:'none'});
		$('.dataRow').css({'background-color':'#F4F1FD'});
		document.querySelector('.menuwrap').classList.remove('on');
		document.querySelector('#dimmed').remove();
	});
	
});

/*#F4F1FD*/
/*#FF69B4*/