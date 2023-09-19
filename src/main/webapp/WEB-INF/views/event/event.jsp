<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         language="java"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/min.css">
    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/board.css">
    <link rel="stylesheet" href="resources/css/event.css">
    <script src="https://kit.fontawesome.com/1652357a48.js" crossorigin="anonymous"></script>
    <title>Document</title>


</head>
<body>
<jsp:include page="../top_menu.jsp"></jsp:include>




<div class="event">
    <div class="event_top">
        <h1>${vo2.title}</h1>
    </div>

    <div class="event_content">
        <img src="resources/uploadimg/${vo2.save_name}" alt="이벤트 사진">

        <p>${vo2.content}
            <br><br>
            <span>참여기간</span> : ${vo2.start_events} ~ ${vo2.end_date}
            <br><br>
            <span>당첨자 발표</span> : ${vo2.end_date}
            <br><br>
            <span>이벤트 대상</span> : ${vo2.event_target}
            <br><br>
            <span>상품 및 당첨인원</span> :${vo2.present} / ${vo2.winner}
        </p>
        <br>
        <br>
        <br>
        <c:if test="${not empty user_id and user_id eq 'tester'}">
            <a href="InsertEvents.do"><button>작성</button></a>
            <a href="updateEvents.do?num=${vo2.num}"><button>수정</button></a>
            <a href="deleteOKEvents.do?num=${vo2.num}"><button>삭제</button></a>
        </c:if>
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