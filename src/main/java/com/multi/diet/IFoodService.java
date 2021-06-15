package com.multi.diet;

import java.util.List;
import java.util.Map;

public interface IFoodService {
	//전체 내용 조회
	public List<FoodVO> getList();
	
	// 상세 조회
	public FoodVO getDetail(String fCode);
	
	// 식품 총 갯수
	public int countFood();

	//검색
	//목록 (페이지 나누기, 검색 기능을 포함)
    //매개변수는 시작 레코드 번호, 끝번호, 옵션과 키워드가 들어간다.
    public List<FoodVO> listAll(String search_option, String keyword, int start, int end)throws Exception;
    

	
}
