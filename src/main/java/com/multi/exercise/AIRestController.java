package com.multi.exercise;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
public class AIRestController {
	@Autowired
	ExerciseService service;
	
	@Autowired
	private STTService sttService;
	
	@RequestMapping("/clovaSTT")
	public void STT(@RequestParam("uploadFile") MultipartFile file,
					  @RequestParam("language") String language, HttpSession session) {
		ExerciseVO result = new ExerciseVO();

		try {
			// 1. 파일 저장 경로 설정 : 실제 서비스되는 위치 (프로젝트 외부에 저장)
			String uploadPath = "c:/ai/";

			// 2. 원본 파일 이름
			String originalFileName = file.getOriginalFilename();

			// 3. 파일 생성
			String filePathName = uploadPath + originalFileName;
			File file1 = new File(filePathName);

			// 4. 서버로 전송
			file.transferTo(file1);

			result = sttService.clovaSpeechToText(filePathName, language, session);
			System.out.println(result.getId());
			service.insertExercise(result);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// --------------------------------------------
	// voiceRecord 음성 녹음 DB 저장
	@RequestMapping("/ExerSTT")
	   public ExerciseVO STT2(@RequestParam("uploadFile") MultipartFile file, HttpSession session) {
	      String result = "";
	      
	      ExerciseVO exerVO = new ExerciseVO();
	      
	      try {
	         //1. 파일 저장 경로 설정 : 실제 서비스 되는 위치 (프로젝트 외부에 저장)
	           String uploadPath =  "C:/ai/";
	           
	           //2.원본 파일 이름
	           String originalFileName = file.getOriginalFilename();  
	           
	           //3. 파일 생성 
	           String filePathName = uploadPath + originalFileName;
	           File file1 = new File(filePathName);
	           
	           //4. 서버로 전송
	           file.transferTo(file1);
	           
	           exerVO = sttService.clovaSpeechToText2(filePathName, session);
	           System.out.println(result);
	           System.out.println(originalFileName);
	           
	      }catch (IOException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      
	      return exerVO;
	  }
	
	@RequestMapping("/byExerciseList")
	public ArrayList<ExerciseVO> viewExerciseListByDate(HttpServletRequest request,
													HttpSession session,
												    @RequestParam Map<String, Object> map) {
		ArrayList<ExerciseVO> exerList = null;
		
		String loginId = (String)session.getAttribute("loginId");
		int condYear = Integer.parseInt(request.getParameter("condYear"));
		int condMonth = Integer.parseInt(request.getParameter("condMonth"));
		int condDate = Integer.parseInt(request.getParameter("condDate"));
		System.out.println(loginId+condYear+condMonth+condDate);
		
		
		// int로 변환: int intObj = Integer.parseInt((String)map.get("ObjectObj"));
		 
		try {
			exerList = service.byExerciseList(loginId, condYear, condMonth, condDate);
		} catch (Exception e) {
			System.out.println("DB 불러오기 실패 :( - AIRestController.byDateDietList -");
		}
		return exerList;
	}
	
	@RequestMapping("/insertExerciseVO")
	public void insertExercise(HttpServletRequest request,
							   HttpSession session,
							   @RequestParam Map<String, Object> map) {
		
		ExerciseVO exerVo = new ExerciseVO();	
		
		exerVo.setId((String)session.getAttribute("loginId"));
		exerVo.setYear(Integer.parseInt((String)map.get("year")));
		exerVo.setMonth(Integer.parseInt((String)map.get("month")));
		exerVo.setExdate(Integer.parseInt((String)map.get("exdate")));
		exerVo.setExName((String)map.get("exName"));
		exerVo.setExWeight(Integer.parseInt((String)map.get("exWeight")));
		exerVo.setExCount(Integer.parseInt((String)map.get("exCount")));
		exerVo.setExMeter(Integer.parseInt((String)map.get("exMeter")));
		exerVo.setExTime(Integer.parseInt((String)map.get("exTime")));
		 
		service.insertExercise(exerVo);
	}
	
}