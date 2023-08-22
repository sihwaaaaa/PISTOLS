<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
<%@ include file="../common/head.jsp" %>
  </head>
  <body>

<%@ include file="../common/header.jsp" %>
 <main class="detail">
      <a href="${pageContext.request.contextPath}/board/list">

        <h1>PISTOLS</h1>
      </a>
      <section>
        <div class="title clearfix" tabindex="0">
          <h4>${board.title}</h4>
          <h3>${board.writer}</h3>
          <br>
          <h5>${board.regdate}</h5>
          <h5>조회수${board.hitcount}&nbsp&nbsp</h5>
        </div>
        <div class="content" tabindex="0">
          <h5>
            ${board.content}
          </h5>
        </div>
      </section>
  
      <section class="buttons">
        <div class="button">
          <a href="modify?bno=${board.bno}&${cri.fullQueryString}" class="mod" alt="수정">
            <h1>MODIFY</h1>
          </a>
        </div>
        <div class="button">
          <a href="remove?bno=${board.bno}&${cri.fullQueryString}" class="rem" alt="삭제">
            <h1>REMOVE</h1>
          </a>
        </div>
        <div class="button">
          <a href="list?${cri.fullQueryString}" alt="목록">
            <h1>LIST</h1>
          </a>
        </div>
      </section>
      <section class="replies">
        <h1>REPLIES</h1>
        <form>
          <div>
            <textarea class="content" id="commentArea" placeholder="Enter comments"></textarea>
            <button type="button"><i class="fas fa-paper-plane"></i></button>
          </div>
        </form>
        <div class="repliseArea clearfix">
        
        </div>

      </section>
    </main>
<%@ include file="../common/footer.jsp" %>
   
    <script>
    
   
    //글 삭제
	let contextPath = '${pageContext.request.contextPath}/';
	let replyPath = contextPath + "/reply"
	let bno = '${board.bno}';
	let writer ='${member.id}';
	let writed = '${board.writer}'
	
	$(".rem").click(function() {
		if(!(writer == writed)){
			alert("삭제 권한이 없습니다")
			location.reload(true);
		}else{
		return confirm("정말 삭제 하시겠습니까?");
			
		}
	});
	$(".mod").click(function() {
		if(!(writer == writed)){
			alert("수정 권한이 없습니다")
			location.reload(true);
			return;
		}
	});
	
	showList();
	function showList(){
		
		$.ajax({
			url : replyPath,
			data : {bno : bno},
			success : list
		})
	}
	//댓글 목록
	function list(replies) {
	
	let str ="";
	if(!replies.length){
		str = `<div class="list reply none clearfix">
            <h4>댓글이 없습니다.</h4>
	        </div>`;
		$(".repliseArea").html(str);
		return;
	}
	for(let i in replies){
		let r = replies[i];
		let isMine = writer === r.writer;
		//let isMine = true;
		str += `
	          <div class="list reply clearfix "data-rno="\${r.rno}">
	            <h4>\${r.content}</h4>
	            <h3>\${r.writer}</h3>
	            <br>`;
	    str += isMine ? '<a href="" ><i class="fas fa-eraser"></i></a>':''
	    str += `
	    		<h5>\${r.regDate}</h5>
	          </div>
	        `;
	
	}
	$(".repliseArea").html(str);
}
//댓글작성
$("#commentArea").next().click(function(){
	let content = $("#commentArea").val();
	if(!writer){
		alert("로그인 후 작성하세요")
		location.href = contextPath + "/member/login?href=" + encodeURIComponent(location.pathname + location.search  + '#replyArea');
		return;
	}
	else if(!content){
		alert("댓글 내용을 작성하세요")
		return;
	}
	$.ajax({
		url : replyPath,
		data : {bno : bno, content : content, writer:writer},
		method:"POST",
		success : function(data){
			alert("댓글이 성공적으로 작성되었습니다")
			$("#commentArea").val("");
			showList();
			
		}
		
	})
})
//댓글삭제
$(".repliseArea").on("click", ".reply a" , function(){
	event.preventDefault();
	if(!confirm("댓글을 삭제하시겠습니까?")){
		return false;
	}
	let rno = $(".reply").data("rno");
	$.ajax({
		url : replyPath + "?rno=" + rno,
		method:"DELETE",
		success : function(data){
			if(data == 1){
			alert("댓글이 성공적으로 삭제되었습니다")
			showList();
			}else{
			alert("댓글 삭제를 실패했습니다")
			showList();
				
			}
			
			
		}
		
	})
	
})
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
