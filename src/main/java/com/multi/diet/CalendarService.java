package com.multi.diet;

import java.util.ArrayList;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;


@Service 
public class CalendarService implements ICalendarService {
  
    @Autowired
    @Qualifier("ICalendarDAO") 
    ICalendarDAO dao;
  
    @Override 
    public ArrayList<CalendarVO> byDateDietList(String condId, String condYear, String condMonth, String condDate) { 
	    return dao.byDateDietList(condId, condYear, condMonth, condDate); 
    }
    
    @Override 
    public ArrayList<CalendarVO> byTimeDietList(String condId, String condYear, String condMonth, String condDate, String condTime) { 
	    return dao.byTimeDietList(condId, condYear, condMonth, condDate, condTime); 
    }
    
    @Override 
    public void insertFoodVO(FoodVO foodVo) { 
	    dao.insertFoodVO(foodVo); 
    }
    
    @Override 
    public void insertCalendarVO(CalendarVO calVo) { 
	    dao.insertCalendarVO(calVo); 
    }
    
    @Override
    public void deleteCalendarVO(String calCode) {
    	dao.deleteCalendarVO(calCode);
    }
    
    @Override
    public ArrayList<FoodVO>viewSearchResult(String keyword) {
    	return dao.viewSearchResult(keyword);
    }
    
	/*
	 * @Override public List<FoodVO> searchListFood(String search_option, String
	 * keyword) throws Exception {
	 * 
	 * return dao.searchListFood(search_option, keyword); }
	 */
	  
}
 