<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
<%@ include file="../common/head.jsp" %>
  </head>
  <body>
<%@ include file="../common/header.jsp" %>
     <main class="signup">
          <a href="login">
          Welcome!
        </a>
        <section class="clearfix">
          <form name="title" method="post">
            <div class="sign clearfix">
              <label for="id">ID</label>
              <input id="id" name="id" placeholder="아이디를 입력하세요" />
              <label for="pw">PASSWORD</label><br />
              <input
                type="password"
                id="pw"
                name="pw"
                placeholder="비밀번호를 입력하세요"
              />
              <h3>${param.msg}</h3>
              <div class="login">
                <input type="submit" value="LOGIN" />
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
  </body>
</html>
