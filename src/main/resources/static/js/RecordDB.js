/**
 * RecordDB.js
 */

$(function() {
	/* 음성 질문 녹음 */
	const record = document.getElementById("record");
    const stop = document.getElementById("stop");
    const soundClips = document.getElementById("sound-clips");

    const audioCtx = new(window.AudioContext || window.webkitAudioContext)(); // 오디오 컨텍스트 정의

    if (navigator.mediaDevices) {
        var constraints = {
            audio: true
        }
         let chunks = [];

        navigator.mediaDevices.getUserMedia(constraints)
            .then(stream => {
        const  mediaRecorder = new MediaRecorder(stream);
      
            record.onclick = () => {
                mediaRecorder.start();
                record.style.background = "red";
                record.style.color = "black";
            }

            stop.onclick = () => { // 정지 버튼 클릭 시
                mediaRecorder.stop(); // 녹음 정지                       
                record.style.background = "";
                record.style.color = "";
            }
            
            mediaRecorder.onstop = e => {
                
                const clipName = "voiceMsg"; // 파일명 : 확장자 안 붙었음
				// 태그 3개 생성
                const clipContainer = document.createElement('article');                     
                //const audio = document.createElement('audio');
                const a = document.createElement('a');
				// 속성 컨텐츠 설정
                //clipContainer.classList.add('clip');
                //audio.setAttribute('controls', '');                        
                //clipContainer.appendChild(audio);
               
                clipContainer.appendChild(a);
                soundClips.appendChild(clipContainer);                        
				
                // chunks에 저장된 녹음 데이터를 audio 양식으로 설정
               	// audio.controls = true;
                const blob = new Blob(chunks, {
                    'type': 'audio/mp3 codecs=opus'
                }); 
                
                chunks = [];
                const audioURL = URL.createObjectURL(blob);
                //audio.src = audioURL;
                //a.href=audio.src;
                //blob:http://localhost:8011/6377d19d-2ca8-49b1-a37f-068d602ceb60    
                a.href=audioURL;                   
                a.download = clipName;                      
                //a.innerHTML = "DOWN"
				//a.click(); // 다운로드 폴더에 저장하도록 클릭 이벤트 발생
				// -> 다운로드 안되도록 코드 삭제!!
				
				// 서버로 업로드: 다운로드 후 1초 대기
				/*setTimeout(function(){
					fileUpload(clipName + ".mp3"); //파일명
				}, 1000);*/
				// 파일 다운로드 하지 않으니까 1초 대기할 필요 없음
				fileUpload(blob, clipName); // 파일 데이터와 파일명 전달
								
            } //mediaRecorder.onstop

            // 녹음 시작시킨 상태가 되면 chunks에 녹음 데이터를 저장하라 
            mediaRecorder.ondataavailable = e => {
            chunks.push(e.data)
            }
            
        })
        .catch(err => {
         console.log('The following error occurred: ' + err)
        })
	}
	//-------------------------------------------------------------	
	/* 서버에 업로드 */
	/* 음성을 텍스트로 변환한 결과가 콘솔에 출력됨 */
	function fileUpload(blob, clipName){
		event.preventDefault();
		var formData = new FormData($('#recForm')[0]);
		
		formData.append('uploadFile', blob, clipName+".mp3");
		
		$.ajax({
			type:"post",
			enctype:"multipart/form-data",
			url:"ExerSTT",
			data: formData, // 폼 데이터 전송
			processData:false, // 필수
			contentType:false, // 필수
			success:function(exerVO){		 
				$("#exName").val(exerVO.exName); // 운동명
				$("#exWeight").val(exerVO.exWeight); // 무게
				$("#exCount").val(exerVO.exCount); // 횟수
				$("#exMeter").val(exerVO.exMeter); // 거리
				$("#exTime").val(exerVO.exTime); // 시간
			},
			error:function(e){
				alert("에러 발생" + e);
			}
		});
	}
	
	$('#recForm').on('submit', function(event){	
		event.preventDefault();
		var today = new Date();
		var exYear = today.getFullYear();
		var exMonth = today.getMonth() + 1;
		var exDate = today.getDate();
		
/*		private int dayNo; 시퀀스로 생성
		private String id; AIRestController에서 Session으로 받아옴
*/
		exerciseData = {};
		exerciseData['year'] = exYear;
		exerciseData['month'] = exMonth;
		exerciseData['exdate'] = exDate;
		exerciseData['exName'] = $("#exName").val();
		exerciseData['exWeight'] = $("#exWeight").val();
		exerciseData['exCount'] = $("#exCount").val();
		exerciseData['exMeter'] = $("#exMeter").val();
		exerciseData['exTime'] = $("#exTime").val();
		alert(exerciseData['year'] + "/" +
			  exerciseData['month']+ "/" +
			  exerciseData['exdate']+ "/" +
			  exerciseData['exName']+ "/" +
			  exerciseData['exWeight']+ "/" +
			  exerciseData['exCount']+ "/" +
			  exerciseData['exMeter']+ "/" +
			  exerciseData['exTime'] 
			  );
		$.ajax({
			type:"post",
			url:"insertExerciseVO",
			data: exerciseData, // 폼 데이터 전송
/*			processData:false, // 필수
			contentType:false, // 필수*/
			success:function(result){		 
				alert("운동 데이터를 성공적으로 저장했습니다 :) ");
			},
			error:function(e){
				alert("운동 데이터를 저장하지 못했습니다 :(" + e);
			}
			});
		
	});

	
}); // $(function()) 끝