package com.multi.member;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class MemberService  {
	
	@Autowired
	@Qualifier("IMemberDAO")
	IMemberDAO memdao;

	public MemberVO loginCheck(String id, String pwd) {
		//Mapper에게 값을 2개 이상 전달할 때 HashMap 사용
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("pwd", pwd);
		return memdao.loginCheck(map);
	}
	
	/*
	 * @Override public MemberVO idCheck(String id) { return dao.idCheck(id); }
	 */
	
	public int idCheck(String id) {
		return memdao.idCheck(id);
	}
	
	public MemberVO join(String id, String pwd, String name, String email, int age, String gender, float height, float weight, int activityIndex) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("pwd", pwd);
		map.put("name", name);
		map.put("email", email);
		map.put("age", age);
		map.put("gender", gender);
		map.put("height", height);
		map.put("weight", weight);
		map.put("activityIndex", activityIndex);
		
		return memdao.join(map);
	}
	
	public MemberVO myPage(String id) {
		return memdao.myPage(id);
		// 뷰페이지 이름 반환 (views 폴더 안의 product 폴더 안의 productListView.jsp
	}
	public void updateMember(MemberVO mem) {
		memdao.updateMember(mem);
	}
}