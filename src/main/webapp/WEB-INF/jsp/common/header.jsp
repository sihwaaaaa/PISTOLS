<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <header>
        <a href="${pageContext.request.contextPath}/" alt="pistols" class="logo"> </a>
        <nav>
          <ul class="top-menu">
            <li>
              <a href="${pageContext.request.contextPath}/" alt="홈" ></a>
            </li>
            <li>
              <a href="${pageContext.request.contextPath}/board/list" alt="게시판" ></a>
              <ul class="toggle">
                <li>
                  <a href="${pageContext.request.contextPath}/board/list" alt="공지사항" ></a>
                </li>
                <li>
                  <a href="${pageContext.request.contextPath}/board/free" alt="자유게시판" ></a>
                </li>
              </ul>
            </li>
          </ul>
        </nav>
      </header>