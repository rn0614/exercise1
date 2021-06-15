package com.multi.diet;

import java.util.ArrayList;

public interface ICalendarDAO {
	public ArrayList<CalendarVO> byDateDietList(String condId, String condYear, String condMonth, String condDate);
	public ArrayList<CalendarVO> byTimeDietList(String condId, String condYear, String condMonth, String condDate, String condTime);
	public void insertFoodVO(FoodVO foodVo);
	public void insertCalendarVO(CalendarVO calVo);
	public void deleteCalendarVO(String calCode);
	public ArrayList<FoodVO> viewSearchResult(String keyword);


	/*
	 * public List<FoodVO> searchListFood(String search_option, String keyword)
	 * throws Exception;
	 */
}