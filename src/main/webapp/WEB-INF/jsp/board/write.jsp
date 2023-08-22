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
          <h1>WRITING</h1>
          
            <input
              id="title"
              name="title"
              placeholder="제목을 입력하세요"
            />
            <textarea
              name="content"
              id="content"
              placeholder="내용을 입력하세요"
            ></textarea>
            <div class="writer" >
              <i class="fas fa-pen"></i>
              <input type="text" id="writer"name="writer" value="${member.id}" readonly>
		<input type="hidden" id="category" name="category" value="1">
            </div>
        </section>
        <section>
          <div class="button">
            <button type="submit">
              <a href="#" alt="글쓰기" >
                <h1>WRITE</h1>
              </a>

            </button>
          </div>
          <div class="button">
            <a href="javascript:history.back()" alt="목록으로">
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
