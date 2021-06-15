/**
 * 
 */
 
    var today = new Date(); // 오늘 날짜
    var date = new Date();

 	
	function beforem() { //이전 달을 today에 값을 저장
        today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
        build(); //만들기
    }
    
    function nextm() {  //다음 달을 today에 저장
        today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
        build();
    }
    
    function build() {
		$("#greetings").empty();
		var greetingsStr = "";
		var recommendCal;
		var userActIdx;
		var userId;
		/*25, 33, 40*/
        $.ajax({
			type: "post",
			async: false, 
			url: "getMemberInfo",  // AIRestController에서 받을 주소
			success:function(memberVO){
				userActIdx = memberVO.activityIndex;
				userId = memberVO.id;
				recommendCal = memberVO.activityIndex * (memberVO.height - 100) * 0.9;
			},
			error:function(e) {
				alert("getMemberInfo에서 오류 발생 :<\n" + "e");
			}
		});
		
		
		if (userActIdx == 40) {
			greetingsStr += "<i class='fas fa-laugh-beam' style='color:#7f888f;'></i>  폭발적인 활동량  <i class='fas fa-laugh-beam' style='color:#7f888f;'></i>  의  ";
		} else if (userActIdx == 33) {
			greetingsStr += "<i class='fas fa-smile-beam' style='color:#7f888f;'></i>  건강하고 밝은  <i class='fas fa-smile-beam' style='color:#7f888f;'></i>  ";
		} else if (userActIdx == 25) {
			greetingsStr += "<i class='fas fa-grin-beam-sweat' style='color:#7f888f;'></i>  지적 활동이 활발한 <i class='fas fa-grin-beam-sweat' style='color:#7f888f;'></i>  ";
		}
		greetingsStr += userId + " 님의 <div id='tooltip'> \
											<div> <span style='font-size: 25px; margin-bottom:2px;'>하루 권장 칼로리는" + recommendCal + "Kcal 입니다</span> \
												<p class='arrow_box'> \
													하루 권장 칼로리 <br>  - 표준 체중(kg) X 활동 지수 <br><br> \
													표준 체중 <br>  - (자신의 키 - 100) X 0.9 <br><br> \
													활동 지수  <br> \
													  - 적은 활동량: 25 <br> \
													  - 중간 활동량: 30 ~ 35 <br> \
													  - 많은 활동량: 40 <br> \
												</p> \
											</div></div>";
		
		$('#greetings').append(greetingsStr);
		
        var nMonth = new Date(today.getFullYear(), today.getMonth(), 1); //현재달의 첫째 날
        var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0); //현재 달의 마지막 날
        var tbcal = document.getElementById("calendar"); // 테이블 달력을 만들 테이블
        var yearmonth = document.getElementById("yearmonth"); //  년도와 월 출력할곳
        var monthday = document.getElementById("monthday"); //  년도와 월 출력할곳
        
        yearmonth.innerHTML = today.getFullYear() + " . "+ (today.getMonth() + 1); //년도와 월 출력
        /*monthday.innerHTML = (today.getMonth() + 1) + " . " + today.getDate();*/ //년도와 월 출력
        before.innerHTML= "<i class='fas fa-caret-square-left'></i>";
        next.innerHTML= "<i class='fas fa-caret-square-right'></i>";
        
        // 남은 테이블 줄 삭제
        while (tbcal.rows.length > 2){
            tbcal.deleteRow(tbcal.rows.length - 1);
        }
        var row = null;
        row = tbcal.insertRow();
        var cnt = 0;
 
        // 1일 시작칸 찾기
        for (i = 0; i < nMonth.getDay(); i++) {
            cell = row.insertCell();
            cnt = cnt + 1;
        }
 
        // 달력 출력
        for (i = 1; i <= lastDate.getDate(); i++) { // 1일부터 마지막 일까지
        	
            cell = row.insertCell();
            var mon = (today.getMonth() + 1);
            var dat = i;

            
            cnt = cnt + 1;
            
            if (cnt % 7 == 0) { // 1주일이 7일 이므로 토요일 계산
                row = calendar.insertRow();// 줄 추가
            }
            /*font-weight:bold*/
            cell.innerHTML = 
            	" \
            		<div class='flip-card'> \
	            		<div class='flip-card-inner'> \
						    <div class='flip-card-front' id='flip-card-front" + i + "'> \
						        <h2 class='front' id='frontDate" + i + "'>" + 
						        mon + "." + dat + 
						        "</h2> \
						        <div class= 'cal' id='cal" + i + 
						        "' style='font-size:25px; text-align:center;'></div>" 
						         + "<p id='kcal" + i + "' style='font-size:15px; margin-bottom: 2px;'><p id='kcalUnit" + i + "' style='font-size:20px;'></p>" + 
						    "</div> \
						    <div class='flip-card-back'> \
						        <h2 style='color:white;' id='backDate" + i + "'>" +
						        mon + "." + dat + 
						        "</h2> \
						        <div class= 'cal' id='backUserCal" + i + 
						        "' style='font-size:12.5px; text-align:center;'></div>" +
						        "<div class= 'cal' id='backRecommCal" + i + 
						        "' style='font-size:12.5px; text-align:center;'></div>" 
						    "</div> \
						</div> \
					</div> \
				"
            if (today.getFullYear()==date.getFullYear() && today.getMonth()==date.getMonth() && i==date.getDate()) {
                /*cell.bgColor = "#FCABB9";*/ // 오늘 색상 변경
                $('#flip-card-front' + i).css({"background-color":"#FCABB9"});
                // 기존 색상 변경
                	// <div class='flip-card-front' style='background-color:#FCABB9;'>
            }

    	    var tempStrYYYYMM = $("#yearmonth").text();
			var currYear = tempStrYYYYMM.slice(0, tempStrYYYYMM.indexOf('.')).trim();
			var currMonth = mon;
			var currDate = dat;
			
			var conditionData = {};  // ajax로 보낼 데이터 만들기
			conditionData['condYear'] = currYear;
			conditionData['condMonth'] = currMonth;
			conditionData['condDate'] = currDate;

	        $.ajax({
				type: "post",
				data: conditionData,  // AIRestController로 보낼 데이터
				url: "byDateDietList",  // AIRestController에서 받을 주소
				async: false,  // 설정 안하면 셀(플립카드)에 나타나지 않음
				success:function(arrayListOfCalendarVO){
					var totalCalPerDay = 0;
					var secOperand = recommendCal * 2 / 7;
					for (var idx=0; idx<arrayListOfCalendarVO.length; idx++) {
						var calVo = arrayListOfCalendarVO[idx];
						var singleDietCal = calVo.eAmt * calVo.foodVO.kcal / calVo.foodVO.servings;
						totalCalPerDay += singleDietCal;
					}
					
					resultCalories = (totalCalPerDay - recommendCal).toFixed(0);
					var backrecommCalStr = "권장: " + recommendCal.toFixed(0) + " Kcal";
					var backuserCalStr = "섭취: " + totalCalPerDay.toFixed(0) + " Kcal";
					
					if (resultCalories >= 0) $('#cal' + i).append("+");
					
					if (resultCalories > (recommendCal - secOperand)) {
						$('#cal' + i).css({"color":"#E84F81"});
						$('#kcal' + i).css({"color":"#E84F81"}); 
						$('#frontDate' + i).css({"color":"#E84F81"}); 
						$('#kcalUnit' + i).css({"color":"#E84F81"}); 
						
					} else if ((recommendCal - secOperand) >= resultCalories && 
							   (recommendCal - 2 * secOperand) <= resultCalories) {
						$('#cal' + i).css({"color":"#CE6192"});
						$('#kcal' + i).css({"color":"#CE6192"}); 
						$('#frontDate' + i).css({"color":"#CE6192"}); 
						$('#kcalUnit' + i).css({"color":"#CE6192"}); 
 
						
					} else if ((recommendCal - 2 *secOperand) >= resultCalories && 
							   (recommendCal - 3 * secOperand) <= resultCalories) {
						$('#cal' + i).css({"color":"#B574A3"});
						$('#kcal' + i).css({"color":"#B574A3"});  
						$('#frontDate' + i).css({"color":"#B574A3"});
						$('#kcalUnit' + i).css({"color":"#B574A3"}); 
						
					} else if ((recommendCal - 3 * secOperand) >= resultCalories && 
							   (recommendCal - 4 * secOperand) <= resultCalories) {
						$('#cal' + i).css({"color":"#9B87B4"});
						$('#kcal' + i).css({"color":"#9B87B4"});
						$('#frontDate' + i).css({"color":"#9B87B4"}); 
						$('#kcalUnit' + i).css({"color":"#9B87B4"}); 
						 
					} else if ((recommendCal - 4 * secOperand) >= resultCalories && 
							   (recommendCal - 5 * secOperand) <= resultCalories) {
						$('#cal' + i).css({"color":"#8299C5"});
						$('#kcal' + i).css({"color":"#8299C5"});  
						$('#frontDate' + i).css({"color":"#8299C5"});
						$('#kcalUnit' + i).css({"color":"#8299C5"}); 
						
					} else if ((recommendCal - 5 * secOperand) >= resultCalories && 
							   (recommendCal - 6 * secOperand) <= resultCalories) {
						$('#cal' + i).css({"color":"#68ACD6"});
						$('#kcal' + i).css({"color":"#68ACD6"});  
						$('#frontDate' + i).css({"color":"#68ACD6"});
						$('#kcalUnit' + i).css({"color":"#68ACD6"}); 
						
					} else {
						$('#cal' + i).css({"color":"#4FBFE8"});
						$('#kcal' + i).css({"color":"#4FBFE8"});  
						$('#frontDate' + i).css({"color":"#4FBFE8"});
						$('#kcalUnit' + i).css({"color":"#4FBFE8"}); 
					}
					
					// 칼로리 입력란
					
					if (totalCalPerDay == 0) {
						$('#cal' + i).append('<i class="far fa-edit"></i>');
						$('#cal' + i).css({'color':'#8E756F'});
						$('#frontDate' + i).css({"color":"#8E756F"});
						$('#backUserCal' + i).append("식단을");
						$('#backRecommCal' + i).append("입력해주세요");

					} else {
						$('#cal' + i).append(resultCalories);
						$('#kcalUnit' + i).append('&nbsp;&nbsp;Kcal');
						$('#backUserCal' + i).append(backrecommCalStr);
						$('#backRecommCal' + i).append(backuserCalStr);
					}
					
				},
				error:function(e) {
					alert("simpleCalendar.js에서 오류 발생 :<\n" + "e");
				}
			});  // ajax 종료
			

    }  // for 문 종료
    
    

}