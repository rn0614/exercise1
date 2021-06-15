$(document).ready(function() {

	$(document).on('click', '.flip-card', function(){
		
		var tempStrYYYYMM = $("#yearmonth").text();
		var tempStrMMDD = $(this).find('.front').text();
		
		var currYear = tempStrYYYYMM.slice(0, tempStrYYYYMM.indexOf('.')).trim();
		var currMonth = tempStrYYYYMM.slice(tempStrYYYYMM.indexOf('.') + 1).trim();
		var currDate = tempStrMMDD.slice(tempStrMMDD.indexOf('.') + 1).trim();
		
		var conditionData = {};
		conditionData['condYear'] = currYear;
		conditionData['condMonth'] = currMonth;
		conditionData['condDate'] = currDate;
		$('#year').val(currYear);
		$('#month').val(currMonth);
		$('#exdate').val(currDate);
		$("#byexerciseTable").empty();
		$.ajax({
			type: "post",
			data: conditionData,
			url: "/byExerciseList",
/*			processData:false,  // 필수
			contentType:false,  // 필수*/
			success:function(arrayListOfExerciseVO){
				$("#byExerciseTable").empty();
				var htmlStr = 
					"<table border='1'>" +	            	
						"<tr>" +
		            		"<th>운동이름</th>" +
	            			"<th>운동무게(kg)</th>" +
		            		"<th>횟수(개)</th>" +
		            		"<th>거리(Km)</th>" +
		            		"<th>시간(분)</th>" +
		            	"</tr>";
				for (var i=0; i<arrayListOfExerciseVO.length; i++){
					var exVo = arrayListOfExerciseVO[i];
					htmlStr += 
						"<tr>" +
							"<td>" +
							"<a href=\"exerciseUpdateForm/"+exVo.dayNo+"\">"+
							exVo.exName+"</a></td>"+
							"<td>" + exVo.exWeight + "</td>" +
							"<td>" + exVo.exCount  + "</td>" + 
							"<td>" + exVo.exMeter + "</td>" + 
							"<td>" + exVo.exTime + "</td>" + 
						"</tr>";
				}
				htmlStr += "</table>";
				$("#byExerciseTable").append(htmlStr);
			},
			error:function(e) {
				alert("subMenuEx.js에서 오류 발생 :<\n" + "e");
			} 
			
			
		});
		
		event.preventDefault();
		
		monthday.innerHTML =currYear+". "+ currMonth + ". " + currDate;
		clickDay1.innerHTML = currMonth + " 월  " + currDate + " 일";
		clickDay2.innerHTML = currMonth + " 월  " + currDate + " 일";
		
		document.querySelector('.menuwrap').classList.add('on');
	    let div = document.createElement('div');
	    div.id = 'dimmed';
	    document.body.append(div);
	
	    //페이지 스크롤 락  모바일 이벤트 차단
	    document.querySelector('#dimmed').addEventListener('scroll touchmove touchend mousewheel', function(e){
	        e.preventDefault();
	        e.stopPropagation();
	        return false;
	    });
        document.querySelector('#dimmed').addEventListener('click', function(e){
            if ( document.querySelector('.menuwrap').classList.contains('on') && 
			    document.querySelector('.OCRSearchMenuwrap').classList.contains('on') ){	
				document.querySelector('.OCRSearchMenuwrap').classList.remove('on');
            } else if ( document.querySelector('.menuwrap').classList.contains('on') && 
			    document.querySelector('.textSearchMenuwrap').classList.contains('on') ){	
				document.querySelector('.textSearchMenuwrap').classList.remove('on');
			} else if ( document.querySelector('.menuwrap').classList.contains('on') ){
	            document.querySelector('.menuwrap').classList.remove('on');
	            document.querySelector('.textSearchMenuwrap').classList.remove('on');
	            document.querySelector('#dimmed').remove();
	            document.querySelector('.textSearchMenuwrap').classList.remove('on');
	        } else {
	            document.querySelector('.menuwrap').classList.add('on');
			}
        });             

	});
	
	$(document).on('click', '#textSearch', function(){
		if ( document.querySelector('.textSearchMenuwrap').classList.contains('on') ){
			document.querySelector('.textSearchMenuwrap').classList.remove('on');
		} else {
			if (document.querySelector('.OCRSearchMenuwrap').classList.contains('on')){
				document.querySelector('.OCRSearchMenuwrap').classList.remove('on');
				document.querySelector('.textSearchMenuwrap').classList.add('on');
			} else {
				document.querySelector('.textSearchMenuwrap').classList.add('on');
			}
		}
	});
	
	$(document).on('click', '#OCRSearch', function(){
		if ( document.querySelector('.OCRSearchMenuwrap').classList.contains('on') ){
			document.querySelector('.OCRSearchMenuwrap').classList.remove('on');
		} else {
			if (document.querySelector('.textSearchMenuwrap').classList.contains('on')){
				document.querySelector('.textSearchMenuwrap').classList.remove('on');
				document.querySelector('.OCRSearchMenuwrap').classList.add('on');
			} else {
				document.querySelector('.OCRSearchMenuwrap').classList.add('on');
			}
		}
	});
	
}); //$(function() 끝
