package com.multi.member;

import java.util.HashMap;


// MyBatis 사용하기 때문에 IMemberDAO 필수
// HashMap<String, Object> : Object는 모든 데이터형 저장 가능

public interface IMemberDAO {
	MemberVO loginCheck(HashMap<String, Object> map);
//	MemberVO idCheck(String id);
	int idCheck(String id);
	MemberVO join(HashMap<String, Object> map);
	MemberVO myPage(String id);
	void updateMember(MemberVO mem);
}
