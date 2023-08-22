<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
<%@ include file="../common/head.jsp" %>
  </head>
  <body>
<%@ include file="../common/header.jsp" %>
      <main class="signup">
        <a href="${pageContext.request.contextPath}/member/join">
          Welcome to join us!
        </a>
        <section class="clearfix">
          <form name="title" method="post">
            <div class="sign">
              <label for="id">ID</label>
              <input id="id" name="id" placeholder="아이디를 입력하세요" />
              <label for="pw">PASSWORD</label><br />
              <input
                type="password"
                id="pw"
                name="pw"
                placeholder="비밀번호를 입력하세요"
              />
              <label for="pwch">PASSWORD CHECK</label><br />
              <input
                type="password"
                id="pwch"
                name="pwch"
                placeholder="비밀번호를 입력하세요"
              />
              <label for="name">NAME</label><br />
              <input
                id="name"
                name="name"
                placeholder="이름을 입력하세요"
              />
              <output class="result" name="result"></output>
              <div class="join">
                <input type="submit" value="JOIN" />
              </div>
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
       });
   </script>
    <script>
    let frm = document.title;
frm.addEventListener("submit", function (e) {
  frm.result.innerHTML = "";
  event.preventDefault();
  if (!frm.id.value.trim()) {
    frm.result.innerHTML = "아이디를 입력하세요";
  } else if (frm.id.value.trim().length < 4) {
    frm.result.innerHTML = "아이디는 4글자 이상입니다";
  } 
  else if (!frm.pw.value.trim()) {
   frm.result.innerHTML = "비밀번호를 입력하세요";
 }
  else if (frm.pw.value.trim().length < 4) {
    frm.result.innerHTML = "비밀번호는 4글자 이상입니다";
  }
   else if (!frm.pwch.value.trim()) {
    frm.result.innerHTML = "비밀번호를 확인해주세요";
  } else if (frm.pwch.value.trim() != frm.pw.value.trim()) {
    frm.result.innerHTML = "비밀번호가 다릅니다";
  } else if (!frm.name.value.trim()) {
    frm.result.innerHTML = "이름을 입력하세요";
  } else {
	alert("회원가입이 완료되었습니다");
    frm.submit();
  }
  
  
})
   </script>
  </body>
</html>
