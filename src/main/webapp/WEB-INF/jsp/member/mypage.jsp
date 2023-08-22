<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
<%@ include file="../common/head.jsp" %>
  </head>
  <body>
<%@ include file="../common/header.jsp" %>
      <main class="signup">
        <a href="${pageContext.request.contextPath}/member/mypage">
          MYPAGE
        </a>
        <section class="clearfix">
          <form name="title" method="post" class="clearfix">
            <div class="sign">
              <label for="id">ID</label>
              <input id="id" name="id" value="${member.id}" readonly/>
           
              <label for="pw">PASSWORD</label><br />
              <input
                type="password"
                id="pw"
                name="pw"
                placeholder="변경할 비밀번호를 입력하세요"
                style="background-color: unset; border: 1px solid #bbb;"
              />
              <label for="pwch">PASSWORD CHECK</label><br />
              <input
                type="password"
                id="pwch"
                name="pwch"
                placeholder="변경할 비밀번호를 입력하세요"
                style="background-color: unset; border: 1px solid #bbb;"
              />
              <label for="name">NAME</label><br />
              <input
                id="name"
                name="name"
                value="${member.name }"
                placeholder="변경할 이름을 입력하세요"
                style="background-color: unset; border: 1px solid #bbb;"
              />
            
              <output class="result" name="result"></output>
              <div class="join">
                <input type="submit" value="MODIFY" />
              </div>
            </div>
          </form>
          <form id="delete" method="delete">
              <div class="join">
                <input type="submit" value="DELETE ACCOUNT" style="background-color: unset;color: rgb(204, 54, 54); font-size: 15px; font-weight: bold;"/>
              </div>
          </form>
        </section>
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
          $("#delete").submit(function () {
        	  let check = prompt("비밀번호를 입력해주세요");
          	if(!(check === "${member.pw}")) {
          		alert("비밀번호가 틀립니다.")
          		event.preventDefault();
          		return;
          	}
        	  
        	  if(confirm("정말 삭제 하시겠습니까?")){
	      			alert("삭제가 완료되었습니다");
        		  submit();
        	  }else {
        		  event.preventDefault();
				return ;
			}
        	  
			
		})
       });
   </script>
    <script>
    let frm = document.title;
frm.addEventListener("submit", function (e) {
  frm.result.innerHTML = "";
  event.preventDefault();
  if (!frm.pw.value.trim()) {
   frm.result.innerHTML = "변경할 비밀번호를 입력하세요";
 }
  else if (frm.pw.value.trim().length < 4) {
    frm.result.innerHTML = "비밀번호는 4글자 이상입니다";
  }
   else if (!frm.pw.value.trim()) {
    frm.result.innerHTML = "비밀번호를 확인해주세요";
  } else if (frm.pwch.value.trim() != frm.pw.value.trim()) {
    frm.result.innerHTML = "비밀번호가 다릅니다";
  } else if (!frm.name.value.trim()) {
    frm.result.innerHTML = "이름을 입력하세요";
  } else {
    	let check = prompt("변경전 비밀번호를 입력해주세요");
    	if(!(check === "${member.pw}")) {
    		alert("비밀번호가 틀립니다.")
    		event.preventDefault();
    		return;
    	}
		alert("회원정보 변경이 완료되었습니다");
		frm.submit();
	}
  
  
  
})
   </script>
  </body>
</html>
