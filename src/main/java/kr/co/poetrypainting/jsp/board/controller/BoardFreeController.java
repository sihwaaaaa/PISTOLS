package kr.co.poetrypainting.jsp.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.poetrypainting.jsp.domain.Criteria;
import kr.co.poetrypainting.jsp.domain.PageDto;
import kr.co.poetrypainting.jsp.service.BoardService;
import kr.co.poetrypainting.jsp.service.BoardServiceImpl;
import kr.co.poetrypainting.jsp.util.paramSolver;

@WebServlet("/board/free")
public class BoardFreeController extends HttpServlet{
	private BoardService boardService = new BoardServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Criteria criteria = paramSolver.getParams(req, Criteria.class);
		
		criteria.setCategory(2);
		req.setAttribute("boards", boardService.list(criteria));
		req.setAttribute("page", new PageDto(boardService.listCount(criteria),criteria));
		req.getRequestDispatcher("/WEB-INF/jsp/board/free.jsp").forward(req, resp);
	}
	
}
