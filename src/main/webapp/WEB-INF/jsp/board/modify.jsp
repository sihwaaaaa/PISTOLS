<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
<%@ include file="../common/head.jsp" %>
  </head>
  <body>

<%@ include file="../common/header.jsp" %>
      <main class="write">
          <form method="post">
        <section class="clearfix">
          <h1>MODIFY</h1>
            <input
              id="title"
              name="title"
              placeholder="제목을 입력하세요"
              value="${board.title}"
            />
            <textarea
              name="content"
              id="content"
              placeholder="내용을 입력하세요"
              
            >${board.content}</textarea>
            <div class="writer" >
              <i class="fas fa-pen"></i>
              <input type="text" id="writer"name="writer" value="${member.id}" readonly>
	
            </div>
        </section>
        <section>
                <input type="hidden" name="bno" value="${board.bno}">
		        <input type="hidden" name="pageNum" value="${cri.pageNum }">
		        <input type="hidden" name="amount" value="${cri.amount}">
		        <input type="hidden" name="category" value="${cri.category}">
		        <c:if test="${not empty cri.type}">
		        <c:forEach items="${cri.type}" var="type">
		        <input type="hidden" name="type" value="${type}">
		        </c:forEach>
		        <input type="hidden" name="keyword" value="${cri.keyword}">
		        </c:if>
          <div class="button">
   
            <button>
              <a href="" alt="수정하기">
                <h1>MODIFY</h1>
              </a>

            </button>
          </div>
          <div class="button">
            <a href="javascript:history.back()" alt="취소">
              <h1>CANCEL</h1>
            </a>
          </div>
        </section>
          </form>
      </main>
<%@ include file="../common/footer.jsp" %>
<script>
$(function () {
    $(".top-menu li:nth-child(2)")
      .hover(
        function () {
          $(".toggle").stop().slideDown(300);
        },
        function () {
          $(".toggle").stop().slideUp(300);
        }
      );
    $(".top-menu li:nth-child(2) a")
      .css("display", 'block').attr('tabindex','0').focus(
      function () {
        $(".toggle").slideDown(300)
        
      })
    $(".toggle li:last-child a")
      .css("display", 'block').attr('tabindex','0').blur(
      function () {
        $(".toggle").slideUp(300);
      })      
  });
   </script>
  </body>
</html>
