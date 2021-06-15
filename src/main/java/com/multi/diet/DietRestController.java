package com.multi.diet;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.multi.member.MemberService;
import com.multi.member.MemberVO;

@RestController

public class DietRestController {
	
	@Autowired
	private OCRService ocrService;
	
	@Autowired
	private CalendarService calendarService;
	
	@Autowired
	MemberService memservice;
	
	
	@RequestMapping("/dietOCR")
	public NutriFactVO dietOCR(@RequestParam("uploadFile") MultipartFile file) {
		/* String result = ""; */
		NutriFactVO nfvo = new NutriFactVO();		
		
		  try {
			  String uploadPath =  "c:/ai/";
			  
			  String originalFileName = file.getOriginalFilename();  
			  
			  String filePathName = uploadPath + originalFileName;
			  File file1 = new File(filePathName);
			  
			  file.transferTo(file1);
			  
			  // result = ocrService.clovaOCRService(filePathName);
			  nfvo = ocrService.clovaOCRService(filePathName);
			  
		} catch (IOException e) {
			e.printStackTrace();
		}
		  
		return nfvo;
	}
	
	@RequestMapping("/byDateDietList")
	public ArrayList<CalendarVO> viewDietListByDate(HttpServletRequest requst,
													HttpSession session,
												    @RequestParam Map<String, Object> map) {
		ArrayList<CalendarVO> dietList = null;
		
		String condId = (String)session.getAttribute("loginId");
		String condYear = (String)map.get("condYear");
		String condMonth = (String)map.get("condMonth");
		String condDate = (String)map.get("condDate");
		
		// int로 변환: int intObj = Integer.parseInt((String)map.get("ObjectObj"));
		 
		try {
			dietList = calendarService.byDateDietList(condId, condYear, condMonth, condDate);
		} catch (Exception e) {
			System.out.println("DB 불러오기 실패 :( - AIRestController.byDateDietList -");
		}
		return dietList;
	}
	
	@RequestMapping("/byTimeDietList")
	public ArrayList<CalendarVO> viewDietListByTime(HttpServletRequest requst,
													@RequestParam Map<String, Object> map,
													HttpSession session) {
		ArrayList<CalendarVO> dietList = null;
		
		String condId = (String)session.getAttribute("loginId");
		String condYear = (String)map.get("condYear");
		String condMonth = (String)map.get("condMonth");
		String condDate = (String)map.get("condDate");
		String condTime = (String)map.get("condTime");
		// int로 변환: int intObj = Integer.parseInt((String)map.get("ObjectObj"));
		 
		try {
			dietList = calendarService.byTimeDietList(condId, condYear, condMonth, condDate, condTime);
		} catch (Exception e) {
			System.out.println("DB 불러오기 실패 :( - AIRestController.byTimeDietList -");
		}
		return dietList;
	}
	
	@RequestMapping("/getMemberInfo")
	public MemberVO myPage(Model model, HttpServletRequest request, HttpSession session) {
		String loginId = (String)session.getAttribute("loginId");
		MemberVO mem = memservice.myPage(loginId);
		return mem;
	}
	
	@RequestMapping("/insertFoodData")
	public void insertFoodData(Model model, @RequestParam Map<String, Object> map, HttpServletRequest request) {
		FoodVO foodVo = new FoodVO();
		
		foodVo.setfCode((String)map.get("condFCode"));
		foodVo.setfName((String)map.get("condFName"));
		foodVo.setF_category((String)map.get("condF_category"));
		foodVo.setServings(Double.parseDouble((String)map.get("condServings")));
		foodVo.setKcal(Double.parseDouble((String)map.get("condKcal")));
		foodVo.setKcal_per_100(Double.parseDouble((String)map.get("condKcal_per_100")));
		
		calendarService.insertFoodVO(foodVo);
	}
	
	@RequestMapping("/insertCalendarData")
	public void insertCalendarData(Model model, @RequestParam Map<String, Object> map, HttpServletRequest request, HttpSession session) {
		CalendarVO calVo = new CalendarVO();
		
		calVo.setCalCode((String)map.get("condCalCode"));
		calVo.setId((String)session.getAttribute("loginId"));
		calVo.setfCode((String)map.get("condFCode"));
		calVo.seteYear((String)map.get("condEYear"));
		calVo.seteMonth((String)map.get("condEMonth"));
		calVo.seteDate((String)map.get("condEDate"));
		calVo.seteAmt(Double.parseDouble((String)map.get("condEAmt")));
		calVo.seteTime((String)map.get("condETime"));
		
		calendarService.insertCalendarVO(calVo);
	}
	
	@RequestMapping("/deleteCalendarData")
	public void deleteCalendarData(@RequestParam(value="deleteList[]") List<String> delCalList, HttpServletRequest request) {
		String calCode = "";
		
		for (String singleCode : delCalList) {
			try {
				calCode = singleCode;
				calendarService.deleteCalendarVO(calCode);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	
	}
	
	@RequestMapping("/SearchWithText")
	public ArrayList<FoodVO> viewSearchResult(@RequestParam(value="keyword") String keyword, HttpSession session, HttpServletRequest request) {
		ArrayList<FoodVO> foodList = new ArrayList<FoodVO>();
		
		try {
			foodList = calendarService.viewSearchResult(keyword);
		} catch (Exception e) {
			System.out.println("DB 불러오기 실패 :( - AIRestController.SearchWithText -");
		}
		
		return foodList;
	}
	
	
	
}
