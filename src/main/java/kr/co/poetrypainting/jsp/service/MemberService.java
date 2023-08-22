package kr.co.poetrypainting.jsp.service;

import kr.co.poetrypainting.jsp.domain.Board;
import kr.co.poetrypainting.jsp.domain.Member;

public interface MemberService {
	//회원가입
	void register(Member member);
	//로그인
	int login(String id, String pw);
	
	//회원단일 조회
	
	Member get(String id);
	//수정
	void update(Member member);
	
	//탈퇴
	void delete(String id);
}
