<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         language="java" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="UTP-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        var currentPage = 1; // 시작 페이지 번호
        var itemsPerPage = 9; // 표시 항목 수

        // 스크롤 이벤트 추가
        $(window).scroll(function () {
            if ($(window).scrollTop() + $(window).height() >= $(document).height()) {
                // 사용자가 페이지의 끝에 도달하면 더 많은 항목을 로드합니다.
                currentPage++;
                loadMoreItems();
            }
        });

        function loadMoreItems() {
            $.ajax({
                url: "json_community_selectAll.do", // json 목록 가져오기
                method: "GET",
                data: {page: currentPage, itemsPerPage: itemsPerPage},
                dataType: "json",
                success: function (response) {
                    // 불러온 항목 처리 및 가공, 출력(html에 추가)
                    var items = response;
                    var html = "";
                    var startIndex = (currentPage - 1) * itemsPerPage;
                    var endIndex = startIndex + itemsPerPage;
                    if (startIndex >= items.length) {
                        // 요청한 페이지에 추가 항목이 없는 경우
                        $(".more_but").hide();
                        alert("더 이상 피드가 없습니다.");
                        return;
                    }
                    if (endIndex > items.length) {
                        // 마지막 페이지에서 아이템의 인덱스 조정
                        endIndex = items.length;
                    }
                    for (var i = startIndex; i < endIndex; i++) {
                        var vo = items[i];
                        html += '<div><a href="community_selectOne.do?num=' + vo.num + '">';
                        html += '<img src="resources/uploadimg/' + vo.save_img + '">';
                        html += '<br>';
                        html += '<strong>' + vo.title + '</strong>';
                        html += '</a></div>';
                    }
                    $(".ajaxLoop").append(html); // 가져온 항목을 추가합니다
                },
                error: function (xhr, status, error) {
                    console.error(error);
                }
            });
        }
    });
</script>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/min.css">
    <link rel="stylesheet" href="resources/css/community.css">
</head>
<body>
<jsp:include page="../top_menu.jsp"></jsp:include>
<body>
<div class="community_section_top">
    <div class="community_title">
        <h2>
            비슷한 관심사를 가진 <br> 멤버들의 취향 피드 구독하기
        </h2>
        <p>
            나와 비슷한 멤버를 찾아 팔로우하면 <br> 언제 어디서나 더 가볍게 연결할 수 있어요.
        </p>
    </div>
</div>
<div class="community_navigation">
    <div class="community_navigation_func">
        <a></a> <a></a>
    </div>
</div>
<div class="community_navigation_upload">
    <button type="button">
        <a href="community_insert.do">피드 작성</a>
    </button>
</div>
<div class="community_review_section">
    <div class="community_review_view">
        <div>
            <div class="review_grid">
                <c:forEach var="vo" items="${vos}" varStatus="loop">
                    <c:if test="${loop.index < 9}">
                        <div><a href="community_selectOne.do?num=${vo.num}">
                            <img src="resources/uploadimg/${vo.save_img}">
                            </br>
                            <strong>${vo.title}</strong>
                        </a></div>
                    </c:if>
                </c:forEach>
            </div>
            <div class="ajaxLoop"></div>
        </div>
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