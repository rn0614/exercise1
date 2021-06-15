package com.multi.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class MemberController {
	@Autowired
	MemberService memservice;

	// 테스트
	@RequestMapping("test")
	public String test() {
		return "test";
	}

	// 로그인 폼으로 이동
	@RequestMapping("loginForm")
	public String loginForm() {
		return "loginForm";
	}

	// 로그인 체크
	@RequestMapping("/login")
	public String loginCheck(@RequestParam("id") String id, @RequestParam("pwd") String pwd, HttpSession session) {
		// memberservice에서 로긴 체크
		MemberVO vo = memservice.loginCheck(id, pwd);

		// 결과 받아서 id와 비밀전호가 일치하면 세션 변수로 저장
		if (vo != null) {
			session.setAttribute("loginId", vo.getId());
		} else {
			session.setAttribute("ERRORMSG", true);
			return "loginForm";
		}

		return "redirect:/"; // index 페이지로 포워딩
	}

	// 로그 아웃
	@RequestMapping("/logout")
	public String userLogout(HttpSession session) {
		// 로그 아웃
		session.invalidate();
		return "redirect:/";
	}

	// 회원 가입 폼으로 이동
	@RequestMapping("joinForm")
	public String joinForm() {
		return "joinForm";
	}

	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping("idCheck")
	public int idCheck(@RequestParam("id") String id) {
		return memservice.idCheck(id);
	}

	// 회원 가입 완료
	@RequestMapping("join")
	public String join(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		// memberservice에서 로긴 체크
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("memName");
		String email = request.getParameter("email");
		int age = Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender");
		float height = Float.parseFloat(request.getParameter("height"));
		float weight = Float.parseFloat(request.getParameter("weight"));
		int activityIndex = Integer.parseInt(request.getParameter("activityIndex"));
		System.out.println("activityIndex");
		System.out.println(activityIndex);
		MemberVO vo = memservice.join(id, pwd, name, email, age, gender, height, weight, activityIndex);
		session.setAttribute("loginId", id);
		// 조인 컨펌으로 이동
		return "joinConfirm"; //
	}

	// myPage 출력
	@RequestMapping("/myPage/{loginId}")
	public String myPage(@PathVariable String loginId, Model model, HttpServletRequest request, HttpSession session) {
		MemberVO mem = memservice.myPage(loginId);
		model.addAttribute("mem", mem);
		return "myPage"; // productDetailView.jsp 상품 상제 정보 페이지
	}
	
	// myPage 정보변경
	@RequestMapping("memUpdate")
	public String updateMember(MemberVO mem) {
		memservice.updateMember(mem);
		return "redirect:/"; // 업데이트 후 원래 기본 페이지로 이동
		//return "redirect:/product/productListView";
	}	
	
}
