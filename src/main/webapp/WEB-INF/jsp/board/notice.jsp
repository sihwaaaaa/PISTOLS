<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
<%@ include file="../common/head.jsp" %>
  </head>
  <body>
    <div class="clearfix">
<%@ include file="../common/header.jsp" %>
  <main class="notice">
        <section>
          <h1>NEWS</h1>
          <table>
            <tr class="division">
              <td>No</td>
              <td>Title</td>
              <td>Date</td>
            </tr>
            <tr>
              <td>8</td>
              <td>크리스마스 휴무</td>
              <td>2023.03.01</td>
            </tr>
            <tr>
              <td>7</td>
              <td>추석 연휴 배송 관련</td>
              <td>2023.03.01</td>
            </tr>
            <tr>
              <td>6</td>
              <td>추석 연휴 배송 관련</td>
              <td>2023.03.01</td>
            </tr>
            <tr>
              <td>5</td>
              <td>커트코베인 사망 30주기 피스톨즈 휴무</td>
              <td>2023.03.01</td>
            </tr>
            <tr>
              <td>4</td>
              <td>사장 생일 피스톨즈 휴무</td>
              <td>2023.03.01</td>
            </tr>
            <tr>
              <td>3</td>
              <td>설 연휴 배송 관련</td>
              <td>2023.03.01</td>
            </tr>
            <tr>
              <td>2</td>
              <td>교환 및 반품안내</td>
              <td>2023.03.01</td>
            </tr>
            <tr>
              <td>1</td>
              <td>
                <a href="../portfolio/detail.html" class="pistols">
                  Welcome to Pistols
                </a>
              </td>
              <td>2023.03.01</td>
            </tr>
          </table>
        </section>
        <section>
          <div class="write">
            <a href="../portfolio/write.html" alt="글쓰기">
              <h1>WRITE</h1>
            </a>
          </div>
        </section>
        <section>
          <div class="page">
            <div>
              <h1>&nbsp;</h1>
            </div>
            <div>
              <a href="">
                <h1>1</h1>
              </a>
            </div>
            <div>
              <a href="">
                <h1>2</h1>
              </a>
            </div>
            <div>
              <a href="">
                <h1>3</h1>
              </a>
            </div>
            <div>
              <a href="">
                <h1>4</h1>
              </a>
            </div>
            <div>
              <a href="">
                <h1>&nbsp;</h1>
              </a>
            </div>
          </div>
        </section>
      </main>
<%@ include file="../common/footer.jsp" %>
    </div>
    <script>
      $(function () {
       $(".aboard")
         .eq(0)
         .hover(
           function () {
             $(".toggle").stop().slideDown(1000);
           },
           function () {
             $(".toggle").stop().slideUp(1000);
           }
         );
     });
   </script>
  </body>
</html>
