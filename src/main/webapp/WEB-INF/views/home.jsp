<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>On&Off</title>
    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/min.css">

    <script src="https://kit.fontawesome.com/1652357a48.js" crossorigin="anonymous"></script>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
   $(document).ready(function() {
      var currentPage = 1; // 시작 페이지 번호
      var itemsPerPage = 4; //표시 항목 수
      $("#more_info").click(function() {
         currentPage++; // 페이지 번호 증가
         loadMoreItems();
      });
      function loadMoreItems() {
          if (currentPage > 2) {
              // Redirect to som_selectAll.do
              window.location.href = "som_selectAll.do";
              return;
          }
         $.ajax({
            url: "json_somoim_selectAll.do", // json 목록 가져오기
            method: "GET",
            data: { page: currentPage, itemsPerPage: itemsPerPage },
            dataType: "json",
            success: function(response) {
               console.log("ajax on");
               console.log("response", response);
               //불러온 항목 처리 및 가공, 출력(html에 추가)
               var items = response;
               var html = "";
               var startIndex = (currentPage - 1) * itemsPerPage;
               var endIndex = startIndex + itemsPerPage;
               if (startIndex >= items.length) {
                  // 요청한 페이지에 추가 항목이 없는 경우
                  $(".more_but").hide();
                  alert("모든 게시글을 표시했습니다!");
                  return;
               }
               if (endIndex > items.length) {
                  // 마지막 페이지에서 아이템의 인덱스 조정
                  endIndex = items.length;
               }
               for (var i = startIndex; i < endIndex; i++) {
                  var vo = items[i];
                  console.log("vo[i]...{}", vo);
                  console.log("vo.save_img...{}", vo.somoim_img);
                  console.log("o.som_member_num...{}", vo.category);
                  console.log("vo.title...{}", vo.som_title);
                  console.log("vo.write_date...{}", vo.create_date);
                  html += '<li>';
                  html += ' <div class="moimst_list_01_img_box">';
                  html += ' <img style="height: 100%" src="resources/uploadimg/' + vo.somoim_img + '">';
                  html += ' </div>';
                  html += ' <div class="main_selectList">';
                  html += ' <p class="hashtag">' + vo.category + '</p>';
                  html += ' <h1>' + vo.som_title + '</h1>';
                  html += ' <p class="sub_tit">' + vo.som_title + '</p>';
                  html += ' </div>';
                  html += '</li>';
               }
               $(".selectAJAX").append(html);
            },
            error: function(xhr, status, error) {
               console.error(error);
            }
         });
      }
   });
   // josn comu// josn comu// josn comu// josn comu// josn comu// josn comu// josn comu// josn comu// josn comu
   //
   $(document).ready(function() {
       var currentPage = 1; // 시작 페이지 번호
       var itemsPerPage = 4; //표시 항목 수
       $("#more_info_comu").click(function() {
           currentPage++; // 페이지 번호 증가
           loadMoreItems2();
       });
       function loadMoreItems2() {
           if (currentPage > 2) {
               // Redirect to som_selectAll.do
               window.location.href = "community_selectAll.do";
               return;
           }
           $.ajax({
               url: "json_community_selectAll.do", // json 목록 가져오기
               method: "GET",
               data: { page: currentPage, itemsPerPage: itemsPerPage },
               dataType: "json",
               success: function(response) {
                   console.log("ajax on");
                   console.log("response", response);
                   //불러온 항목 처리 및 가공, 출력(html에 추가)
                   var items = response;
                   var html = "";
                   var startIndex = (currentPage - 1) * itemsPerPage;
                   var endIndex = startIndex + itemsPerPage;
                   if (startIndex >= items.length) {
                       // 요청한 페이지에 추가 항목이 없는 경우
                       $(".more_but").hide();
                       alert("모든 게시글을 표시했습니다!");
                       return;
                   }
                   if (endIndex > items.length) {
                       // 마지막 페이지에서 아이템의 인덱스 조정
                       endIndex = items.length;
                   }
                   for (var i = startIndex; i < endIndex; i++) {
                       var vo = items[i];
                       console.log("vo[i]...{}", vo);
                       console.log("vo.save_img...{}", vo.save_img);
                       console.log("vo.title...{}", vo.som_title);
                       console.log("vo.write_date...{}", vo.write_date);
                       html += '<li>';
                       html += ' <div class="moimst_list_02_img_box">';
                       html += ' <img style="height: 100%" src="resources/uploadimg/' + vo.save_img + '">';
                       html += ' </div>';
                       html += ' <div class="main_selectList">';
                       html += ' <h1>' + vo.title + '</h1>';
                       html += ' <p class="sub_tit">' + vo.write_date + '</p>';
                       html += ' </div>';
                       html += '</li>';
                   }
                   $(".selectAJAX_comu").append(html);
               },
               error: function(xhr, status, error) {
                   console.error(error);
               }
           });
       }
   });
</script>
<body>
<jsp:include page="top_menu.jsp"></jsp:include>
<div class="main_container">
    <div class="img_banner">
       <img src="resources/uploadimg/onandoff_bg.png">
        <div>
            <h2 class="title">ONANDOFF</h2>
        </div>
    </div>
    <div class="main_pictogram">
       <ul>
          <li><a href="eventsSelctOne.do?num=41"><i class="fa-solid fa-plane-departure"></i></a></li>
           <li><a href="eventsSelctOne.do?num=42"><i class="fa-solid fa-person-running"></i></a></li>
          <li><a href="eventsSelctOne.do?num=43"><i class="fa-solid fa-people-group"></i></a></li>
          <li><a href="eventsSelctOne.do?num=44"><i class="fa-solid fa-gamepad"></i></a></li>
          <li><a href="eventsSelctOne.do?num=45"><i class="fa-solid fa-person-hiking"></i></a></li>
          <li><a href="eventsSelctOne.do?num=46"><i class="fa-solid fa-paw"></i></a></li>
          <li><a href="eventsSelctOne.do?num=47"><i class="fa-solid fa-laptop-file"></i></a></li>
          <li><a href="eventsSelctOne.do?num=48"><i class="fa-solid fa-language"></i></a></li>
       </ul>
    </div>
    <div class="moim_list01" style="height: auto">
       <strong>소모임</strong>
        <ul>
<%--       소모임 디스플레이 파트--%>
        <c:forEach items="${vos}" var="vo" varStatus="loop">
        <c:if test="${loop.index < 4}">
                <li>
                    <a href="som_selectOne.do?num=${vo.num}">
                    <div class="moimst_list_01_img_box">
                       <img style="height: 100%;" src="resources/uploadimg/${vo.somoim_img}"></div>
                    <div class="main_selectList">
                        <p class="hashtag">${vo.category}</p>
                        <h1>${vo.som_title}</h1>
                        <p class="sub_tit">${vo.som_title}</p>
                    </div>
                    </a>
                </li>
        </c:if>
        </c:forEach></ul>
       <ul class ="selectAJAX" style="margin-top: 0px; padding-top: 0px;">
       </ul>
          <button id="more_info" style="margin-bottom: 1%;">더보기 ></button>
    </div>
    <div class="moim_list02" style="height: auto;">
       <strong>커뮤니티</strong>
       <ul>
           <c:forEach items="${comu_vos}" var="comu_vo" varStatus="loop_comu">
               <c:if test="${loop_comu.index < 4}">
                   <li>
                       <a href="community_selectOne.do?num=${comu_vo.num}">
                       <div class="moimst_list_02_img_box">
                             <img style="height: 100%" src="resources/uploadimg/${comu_vo.save_img}">
                       </div>
                       <div class="main_selectList">
                           <h1>${comu_vo.title}</h1>
                           <p class="sub_tit">${comu_vo.write_date}</p>
                       </div>
                       </a>
                   </li>
               </c:if>
           </c:forEach>
       </ul>
        <ul class ="selectAJAX_comu" style="margin-top: 0px; padding-top: 0px;">
        </ul>
       <button id="more_info_comu" style="margin-bottom: 2%">더보기 ></button>
    </div>
    <div class="main_section05">
       <img  src="resources/uploadimg/On&Off_home_foot_img.png">
    </div>
    <div class="main_section05" style="background-color: #FDF6F6; height: auto;">
        <img  src="resources/uploadimg/home_foot_img2.png">
    </div>
</div>
<div class="footer">
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
</body>
</html>