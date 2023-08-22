<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
<%@ include file="common/head.jsp" %>
  </head>
  <body>
    <div class="clearfix">
<%@ include file="common/header.jsp" %>
  <main class="home">
        <section>
          <div class="slider">
            <div><img src="img/slider (2).jpg" alt="밴드 이미지"/></div>
            <div><img src="img/slider (3).jpg" alt="밴드 이미지"/></div>
            <div><img src="img/slider (1).jpg" alt="기타 이미지"/></div>
          </div>
        </section>
        <section class="multi">
          <h1>NEW</h1>
          <div class="new clearfix">
            <a href="" alt="Kurt’s alien t-shirt">
              <div>
                <div class="img-wrap">
                  <img src="img/aaa (3).png" alt="커트코베인이 생전 입었던 귀여운 티셔츠">
                </div>
                <div class="text-wrap" >
                  <h4>Kurt’s alien t-shirt</h4>
                  <h5>커트코베인이 생전 입었던 귀여운 티셔츠</h5>
                  <h3>200,000원</h3>
                </div>
              </div>
            </a>
            <a href="" alt="Kurt’s boarder – tee">
              <div class="img-wrap">
                <img src="img/aaa (10).png"alt="커트코베인이 생전 주구장창 입었던 티셔츠">
              </div>
              <div class="text-wrap">
                <h4>Kurt’s boarder – tee</h4>
                <h5>커트코베인이 생전 주구장창 입었던 티셔츠</h5>
                <h3>100,000원</h3>
              </div>
            </a>
            <a href="" alt="Kurt’s kni">
              <div class="img-wrap">
                <img src="img/aaa (9).png" alt="커트코베인이 좋아하던 니트">
              </div>
              <div class="text-wrap">
                <h4>Kurt’s knit</h4>
                <h5>커트코베인이 좋아하던 니트</h5>
                <h3>800,000원</h3>
              </div>
            </a>
            <a href="" alt="Kurt’s sunglasse">
              <div class="img-wrap">
                <img src="img/aaa (1).png" alt="커트코베인 시그니처 선글라스">
              </div>
              <div class="text-wrap">
                <h4>Kurt’s sunglasses</h4>
                <h5>커트코베인 시그니처 선글라스</h5>
                <h3>200,000원</h3>
              </a>
            </div>
          </div>
          <aside class="clearfix">
           <% if(session.getAttribute("member") == null) { %>
            <div>
              <a href="member/login" alt="로그인">
                <div class="box">
                  <h1>LOGIN</h1>
                </div>
              </a>
              <a href="" alt="아이디 비밀번호 찾기" >
                <h1>FORGET ID/PW</h1>
              </a>
              <a href="member/join" alt="회원가입" >
                <h1>JOIN US</h1>
              </a>
            </div>
             <%} else { %>
               <div class="logout" style=" margin-top: 30px;">
 			        <h3 style="  font-size: 20px;  text-align: center;">환영합니다! ${member.name}님</h3>
             	 <a href="member/mypage" style="margin-top: 30px; display: inline-block; width: 100px; float: right;"><h1 style="  font-size: 20px; color: rgb(63, 39, 195);">MYPAGE</h1></a>
             	 <a href="member/logout" style="margin-left: 90px; display: inline-block; width: 100px; float: right;"><h1 style=" color: #444;">LOGOUT</h1></a>
            </div>
             <%} %>
          </aside>
        </section>
         <section class="multi2">
          <h1>BEST</h1>
          <div class="best clearfix">
            <a href="" alt="White t-shirt">
              <div>

                <img src="img/aaa (4).png" alt="스테디한 디자인의 화이트 티셔츠">
                <br>
                <h4>White t-shirt</h4>
                <h5>스테디한 디자인의 화이트 티셔츠</h5>
                <h3>30,000원</h3>
              </div>
            </a>
            <a href="" alt="Black t-shirt">
              <div>

                <img src="img/aaa (5).png" alt="스테디한 디자인의 블랙 티셔츠">
                <br>
                <h4>Black t-shirt</h4>
                <h5>스테디한 디자인의 블랙 티셔츠</h5>
                <h3>30,000원</h3>
              </div>
            </a>
            <a href="" alt="Kurt’s glasses">
              <div>

                <img src="img/aaa (2).png" alt="커트코베인이 착용하였던 안경">
                <br>
                <h4>Kurt’s glasses</h4>
                <h5>커트코베인이 착용하였던 안경</h5>
                <h3>200,000원</h3>
              </div>
            </a>
          </div>
        </section>
        <section class="multi3">
          <h1>CONCERT</h1>
          <div class="concert">
            <a href="" alt="레드핫칠리페퍼스가 4월1일 내한한다">
              <img src="img/aaa (8).png" alt="레드핫칠리페퍼스 이미지">
              <br>
              <h4>red hot chili pepers</h4>
              <h5>레드핫칠리페퍼스가 4월1일 내한한다</h5>

            </a>
            <a href="" alt="라디오헤드가 5월18일 내한한다">
              <img src="img/aaa (7).png" alt="라디오헤드 이미지">
              <br>
              <h4>radio head</h4>
              <h5>라디오헤드가 5월18일 내한한다</h5>

            </a>
            <a href="" alt="그린데이가 12월4일 내한한다">
              <img src="img/aaa (6).png" alt="그린데이 이미지">
              <br>
              <h4>green day</h4>
              <h5>그린데이가 12월4일 내한한다</h5>

            </a>
          </div>
          
        </section>
      </main>
<%@ include file="common/footer.jsp" %>
    </div>
    <script>
    $(document).ready(function () {
        $(".slider").bxSlider({
         pager: false,
         controls: false,
         auto: true,
       });
     });
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
