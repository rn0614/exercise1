package com.multi.diet;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DietController {
	
	@Autowired
	CalendarService calendarService;
	
	@RequestMapping("/dietMain")
	public String viewDietMain(HttpSession session) {
		String loginId=(String) session.getAttribute("loginId");
		if(loginId==null) {
			return "loginForm";
		}
		return "diet/dietMain";
	}
	
	/*
	 * //선택하기 위한 검색
	 * 
	 * @RequestMapping("searchFoodList") public ModelAndView searchFoodlist(
	 * 
	 * //초기값을 설정해야 에러가 발생되지 않는다.
	 * 
	 * @RequestParam(defaultValue="fCode") String search_option,
	 * 
	 * @RequestParam(defaultValue="") String keyword
	 * 
	 * ) throws Exception{
	 * 
	 * 
	 * 
	 * //map에 담기위해 리스트에 검색옵션, 키워드, 시작과 끝번호를 저장 List<FoodVO> list =
	 * calendarSerive.searchListFood(search_option, keyword);
	 * 
	 * ModelAndView mav = new ModelAndView(); Map<String,Object> map = new
	 * HashMap<>(); //넘길 데이터가 많기 때문에 해쉬맵에 저장한 후에 modelandview로 값을 넣고 페이지를 지정
	 * 
	 * map.put("list", list); //map에 list(식품 목록)을 list라는 이름의 변수로 자료를 저장함.
	 * 
	 * map.put("search_option", search_option); map.put("keyword", keyword);
	 * mav.addObject("map", map); //modelandview에 map를 저장
	 * 
	 * mav.setViewName("/dietmain"); //자료를 넘길 뷰의 이름
	 * 
	 * return mav;
	 * 
	 * }
	 */

}

