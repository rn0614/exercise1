package com.multi.diet;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class FoodService implements IFoodService {
		//데이터 관련해서는 모두 DAO에 위임
	 	@Autowired
	 	@Qualifier("IFoodDAO")
	 	IFoodDAO foodDAO;
	 
	 	//전체 내용 조회
		@Override 
		public List<FoodVO> getList() {
		  return foodDAO.getList(); 
		}
		 

	 	//상세 조회
	 	@Override
	 	public FoodVO getDetail(String fCode) {
	 	  return foodDAO.getDetail(fCode);
	 	}

	 	
	 	//식품 총 갯수
	 	@Override
	 	public int countFood() {
	 		return foodDAO.countFood();
	 	}
	 	

	 	// 검색
	 	 @Override
	     public List<FoodVO> listAll(String search_option, String keyword,int start, int end) throws Exception {
	  
	         return foodDAO.listAll(search_option, keyword, start, end);
	     }

	
}
