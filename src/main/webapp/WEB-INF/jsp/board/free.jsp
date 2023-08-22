<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
  <head>
<%@ include file="../common/head.jsp" %>
  </head>
  <body>

<%@ include file="../common/header.jsp" %>
  <main class="notice">
    <section>
      <a href="${pageContext.request.contextPath}/board/free">
      
	      <h1>FREE</h1>
      </a>
      <div class="list-header">
        <div>
          <select class="amount">
          <c:set var="amounts" value="10,20,30"/>
          	<c:forTokens items="${amounts}" delims="," var="amount">
           	 <option value="${amount}"${page.cri.amount == amount ? 'selected' : '' }>${amount}개씩 보기</option>
            </c:forTokens>
          </select>
          <div class="search">
          <form>
            <select class="option">
              <option>제목</option>
              <option>작성자</option>
              <option>내용</option>
              <option>제목, 작성자</option>
              <option>제목, 내용</option>
              <option>내용, 작성자</option>
              <option>제목, 작성자, 내용</option>
            </select>
            <br>
            <input type="text" placeholder="Search" name="keyword" value="${page.cri.keyword}">
            <button type="submit"><i class="fas fa-search"></i></button>
          </form>
          </div>
        </div>


      </div>
    </section>
	<section>
		<c:forEach var="board" items="${boards}" varStatus="stat">
			<div class="list clearfix">
          		<a href="view?bno=${board.bno}&${page.cri.fullQueryString}" alt="" class="clearfix">
            		<div class="clearfix">
              			<h4>${board.title}</h4>
              			<h4>[${board.replyCnt}]</h4>
              			<h3>${board.writer}</h3>
		              	<br>
		              	<h5>${board.regdate}</h5>
		              	<h5>조회수${board.hitcount}&nbsp&nbsp</h5>
		            </div>
		        </a>
			</div>
        </c:forEach>
	</section>
        <section class="clearfix">
          <div class="button wr">
            <a href="freewrite" alt="글쓰기">
              <h1>WRITE</h1>
            </a>
          </div>
        </section>
        <section>
          <div class="page clearfix">
      
           <c:if test="${page.prev}">
            <div>
              <a href="free?pageNum=${page.cri.pageNum-1}&${page.cri.queryString}">
                <img src="../img/grow-up.png"  class="prev">
              </a>
            </div>
           </c:if>
           
           <c:forEach begin="${page.startPage}" end="${page.endPage}" var="i">
            <div class="${page.cri.pageNum == i ? 'active' : ''}">
            	<a href="free?pageNum=${i}&${page.cri.queryString}"><h4>${i}</h4></a>
            </div>
          </c:forEach>
          <c:if test="${page.next}">
            <div>
            	<a href="free?pageNum=${page.cri.pageNum+1}&${page.cri.queryString}">
            	 <img src="../img/grow-up.png" class="next">
            	</a>
            </div>
          </c:if>
          
          </div>
        </section>
      </main>
<%@ include file="../common/footer.jsp" %>
   
    <script>
    $(function () {

      $(".list").hover(function () {

        $(this).css("background-color", "rgb(25, 32, 108)").find("h5, h3, h4").css("color", "white")
      }, function () {
        $(this).css("background-color", "white").find("h4").css("color", "#444").parent().find("h3").css("color", "rgb(25, 32, 108)").parent().find("h5").css("color", "#777")
      })
      $(".amount").change(function(){
		
		
		let page= '${page.cri.pageNum}';
		let amount= $(this).val();
		let category = '${page.cri.category}'
		let type = '${page.cri.typeStr}'
		let obj = {pageNum:page, amount:amount, category:category};
		location.search = $.param(obj) + type;
	  })
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
