package com.multi.diet;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class FoodController {
	
	@Autowired
	IFoodService foodService;

	/*
	 * @Autowired IFoodDAO foodDAO;
	 */

	//전체 내용 조회
	//@RequestMapping("foodList")
	public String showList(Model model) {
	  model.addAttribute("list", foodService.getList());
	  return "food/list";
	}
	
	//상세 조회
	@RequestMapping(value="foodDetail", method=RequestMethod.GET)
	public String showDetail(Model model,
	                        @RequestParam("fCode") String fCode)throws Exception {
	  
	  model.addAttribute("food", foodService.getDetail(fCode));

	  return "food/detail";
	}
	
		 
	
	//검색
	@RequestMapping("foodList")    //세부적인 url mapping
    public ModelAndView list(//RequestParam으로 옵션, 키워드, 페이지의 기본값을 각각 설정해준다.
            
            //초기값을 설정해야 에러가 발생되지 않는다.
    		@RequestParam(defaultValue="1") int curPage,
    		@RequestParam(defaultValue="fCode") String search_option,
            @RequestParam(defaultValue="") String keyword
 
            )
             throws Exception{
        
		 
		
		
		
        //레코드 갯수를 계산
        int count = 1000;
        
        //페이지 관련 설정, 시작번호와 끝번호를 구해서 각각 변수에 저장한다.
        Pager pager = new Pager(count, curPage);
        int start = pager.getPageBegin();
        int end =  pager.getPageEnd();
        

        //map에 담기위해 리스트에 검색옵션, 키워드, 시작과 끝번호를 저장
        List<FoodVO> list = foodService.listAll(search_option, keyword, start, end);
        
        ModelAndView mav = new ModelAndView();
        Map<String,Object> map = new HashMap<>();    //넘길 데이터가 많기 때문에 해쉬맵에 저장한 후에 modelandview로 값을 넣고 페이지를 지정
        
        map.put("list", list);                         //map에 list(식품 목록)을 list라는 이름의 변수로 자료를 저장함.
        map.put("pager", pager);
        
        
        map.put("count", count);
        map.put("search_option", search_option);
        map.put("keyword", keyword);
        mav.addObject("map", map);                    //modelandview에 map를 저장
        
        mav.setViewName("food/foodPaging");                //자료를 넘길 뷰의 이름
        
        return mav;    //칼로리사전 페이지로 이동
    
    }
 
}
