package kr.co.poetrypainting.jsp.member.controller;

import static kr.co.poetrypainting.jsp.util.paramSolver.getParams;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.poetrypainting.jsp.dao.MemberDao;
import kr.co.poetrypainting.jsp.domain.Board;
import kr.co.poetrypainting.jsp.domain.Member;
import kr.co.poetrypainting.jsp.service.MemberService;
import kr.co.poetrypainting.jsp.service.MemberServiceImpl;
import kr.co.poetrypainting.jsp.util.paramSolver;



@WebServlet("/member/join")
public class join extends HttpServlet{
	private MemberService memberService = new MemberServiceImpl();
	
	
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/jsp/member/join.jsp").forward(req, resp);
		
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		Member member = getParams(req, Member.class);
		memberService.register(member);

		
		resp.sendRedirect("login");
		
	}

}
	