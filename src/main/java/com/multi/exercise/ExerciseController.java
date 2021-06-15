package com.multi.exercise;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ExerciseController {
	@Autowired
	ExerciseService service;
	
	@Autowired
	private STTService sttService;
	
	
	 // 운동 관리 페이지
	@RequestMapping("exerMain")
	public String viewExerMain() {
		return "exerMain";
	}
		
	// 전체 운동 기록 조회
	@RequestMapping("/exer/exerciseListView")
	public String viewExerciseList(Model model, HttpSession session) {
		String loginId=(String) session.getAttribute("loginId");
		if(loginId==null) {
			return "loginForm";
		}
		ArrayList<ExerciseVO> exerciseList = service.exerciseList(loginId);
		model.addAttribute("exerciseList", exerciseList);
		return "exer/exerciseListView";
	}

	// 운동 기록 화면으로 이동
	@RequestMapping("/exer/exerciseNewForm")
	public String viewExerciseForm(HttpSession session) {
		String loginId=(String) session.getAttribute("loginId");
		if(loginId==null) {
			return "loginForm";
		}
		return "exer/exerciseNewForm";
	}

	// 운동 기록 : DB 저장
	@RequestMapping("/exer/insert")
	public String insertExercise(ExerciseVO DayExercise) {
		service.insertExercise(DayExercise);
		return "redirect:./exerciseNewForm";
	}

	// 운동 상세 기록 조회
	@RequestMapping("/exer/exerciseDetailView/{dayNo}")
	public String detailViewExercise(@PathVariable String dayNo, Model model) {
		ExerciseVO DayExercise = service.exerciseDetailView(dayNo);
		model.addAttribute("DayExercise", DayExercise);
		return "exer/exerciseDetailView";
	}

	// 운동 기록 수정화면으로 이동
	@RequestMapping("/exer/exerciseUpdateForm/{dayNo}")
	public String updateExerciseForm(@PathVariable String dayNo, Model model) {
		ExerciseVO DayExercise = service.exerciseDetailView(dayNo);
		model.addAttribute("DayExercise", DayExercise);
		return "exer/exerciseUpdateForm";
	}

	// 운동 기록 수정
	@RequestMapping("/exer/update")
	public String updateExercise(ExerciseVO DayExercise) {
		service.updateExercise(DayExercise);
		return "redirect:./exerciseListView";
	}

	// 운동 기록 삭제
	@RequestMapping("/exer/delete/{dayNo}")
	public String deleteExercise(@PathVariable String dayNo) {
		service.deleteExercise(dayNo);
		return "redirect:/exer/exerciseListView";
	}
		
	// 음성 파일 등록
	@RequestMapping("/stt")
	public String STT(HttpSession session) {
		String loginId=(String) session.getAttribute("loginId");
		if(loginId==null) {
			return "loginForm";
		}
		return "sttResult";
	}
	
	// 음성 녹음
	@RequestMapping("voiceRecord")
	 public String voiceRecord(HttpSession session) {
		String loginId=(String) session.getAttribute("loginId");
		if(loginId==null) {
			return "loginForm";
		}
		return "voiceRecord"; // voiceRecord.jsp
	 }
}