<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ page session="true"%>

<!DOCTYPE html>
<html lang="en">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
      var currentPage = 1; // 시작 페이지 번호
      var itemsPerPage = 3; //표시 항목 수

      $(".more_but").click(function() {
        currentPage++; // 페이지 번호 증가
        loadMoreItems();
      });

      function loadMoreItems() {
        $.ajax({
          url: "json_selectAll.do", // json 목록 가져오기
          method: "GET",
          data: { page: currentPage, itemsPerPage: itemsPerPage },
          dataType: "json",
          success: function(response) {
            var items = response;
            var html = "";
            var startIndex = (currentPage - 1) * itemsPerPage;
            var endIndex = startIndex + itemsPerPage;

            if (startIndex >= items.length) {
              // 요청한 페이지에 추가 항목이 없는 경우
              $(".more_but").hide();
              alert("더 이상 공지가 없습니다.");

              return;
            }

            if (endIndex > items.length) {
              // 마지막 페이지에서 아이템의 인덱스 조정
              endIndex = items.length;
            }

            for (var i = startIndex; i < endIndex; i++) {
              var vo = items[i];

              html += '<div class="noticeOne" style="border-bottom: 1px solid rgb(207, 207, 207);">';
              html += '<div class="about_one">';
              html += '<ul>';
              html += '<li class="notice_item">';
              html += '<ul class="boarding">';
              html += '<li>';
              html += '<div>';
              html += '<h3><a href="cs_notice_selectOne.do?num=' + vo.num + '">' + vo.title + '</a></h3>';
              html += '<h5 style="height: 5px; margin-top: 10px;">' + vo.write_date + '</h5>';
              html += '</div>';
              html += '</li>';
              html += '</ul>';
              html += '<li class="notice_img_enter"><a href="cs_notice_selectOne.do?num=' + vo.num + '"><img src="resources/uploadimg/rightArrow.png"></a></li>';
              html += '</ul>';
              html += '</div>';
              html += '</div>';
            }

            $(".ajaxLoop").append(html); // 가져온 항목을 추가
          },
          error: function(xhr, status, error) {
            console.error(error);
          }
        });
      }
    });
  </script>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CS_notice_selectAll</title>
<link rel="stylesheet" href="resources/css/min.css">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/CS_FAQ.do.css">
<link rel="stylesheet" href="resources/css/CS_notice_selectAll.css">


</head>
<body >
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<jsp:include page="./notice_top_menu.jsp"></jsp:include>



	<hr style="margin-bottom: 50px;">
<body>
  <div class="notice_table_board" style="height: auto;">
    <div class="notice_List" style="height: auto;">
      <c:forEach items="${vos}" var="vo" varStatus="loop">
        <c:if test="${loop.index < 5}">
          <div class="noticeOne" style="border-bottom: 1px solid rgb(207, 207, 207);">
            <div class="about_one">
              <ul>
                <li class="notice_item">
                  <ul class="boarding">
                    <li>
                      <div>
                        <h3>
                          <a href="cs_notice_selectOne.do?num=${vo.num}">${vo.title}</a>
                            <input type="hidden" name="num" value="${vo.num}">
                        </h3>
                        <h5 style="height: 5px; margin-top: 10px;">${vo.write_date}</h5>
                      </div>
                    </li>
                  </ul>
                  <li class="notice_img_enter"><a href="cs_notice_selectOne.do?num=${vo.num}"> <img src="resources/uploadimg/rightArrow.png"></a></li>
                  <input type="hidden" name="num" value="${vo.num}">

                  </li>
              </ul>
            </div>
          </div>
        </c:if>
      </c:forEach>
      <div class="ajaxLoop">
      </div>

      <div class="more_but_position">
        <button class="more_but">더 보기 ></button>
      </div>


    </div>
      <c:if test="${user_id eq 'tester'}">
          <a href="cs_notice_insert.do"><button>Write</button></a>
      </c:if>

  </div>


</body>







<div class="footer" >
	<div>
		<strong>온앤오프</strong>
		<ul>
			<li>공지사항</li>
			<li>이벤트</li>
			<li>자주 믿는 질문</li>
		</ul>
	</div>
	<div>
		<strong>소셜 미디어</strong>
		<ul>
			<li>인스타그램</li>
			<li>네이버 블로그</li>

		</ul>
	</div>
	<div class="footer_company">
		<strong>온앤오프</strong>
		<ul>
			<li>대표: 팀404 개인정보관리책임자: 팀404</li>
			<li>이메일: Team404@Team404.com 대표번호: 123-1234-1234</li>
			<li>주소: 서울시 강남구 태헤란로 ~~~~~</li>
		</ul>
	</div>

</div>
</html>
