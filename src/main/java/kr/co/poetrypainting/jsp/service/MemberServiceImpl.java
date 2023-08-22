package kr.co.poetrypainting.jsp.service;

import kr.co.poetrypainting.jsp.dao.MemberDao;
import kr.co.poetrypainting.jsp.domain.Member;

public class MemberServiceImpl implements MemberService {
	private MemberDao memberDao = new MemberDao();
	
	@Override
	public void register(Member member) {
		System.out.println(member);
		memberDao.insert(member);
	}

	@Override
	public int login(String id, String pw) {
		Member member = memberDao.selectOne(id);
		if(member == null) {
			//아이디 없음
			return 2;
		}
		else if(!member.getPw().equals(pw)) {
			//비밀번호 틀림
			return 3;
			
		}else {
			//로그인성공
			return 1;
		}
	}

	@Override
	public Member get(String id) {
		return memberDao.selectOne(id);
	}
	
	@Override
	public void update(Member member) {
		memberDao.update(member);
	}
	@Override
	public void delete(String id) {
		
		memberDao.delete(id);
	}
	
	

}
