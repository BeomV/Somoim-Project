<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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



<div class="event_list">
    <div class="event_list_top">
        <h1>이벤트</h1>
    </div>
    <ul class="event_list_grid" style="width: 80%;">
        <c:forEach items="${vos}" var="vo2">

        <li>
            <div class="event_img" style="align-items: center; height: 40%; background-color: transparent; display: flex; justify-content: center;">
                <a href="eventsSelctOne.do?num=${vo2.num}">
                <img style="width: 100%; height: 200px; border-radius: 5%" src="resources/uploadimg/${vo2.save_name}" >
                </a>
            </div>
            <div><a href="eventsSelctOne.do?num=${vo2.num}">${vo2.title}</a></div>
        </li>
        </c:forEach>
    <br>
        <br>

        <c:if test="${user_id eq 'tester'}">
            <a href="InsertEvents.do"><button>작성</button></a>
            관리자 계정 "tester"만 보이는 메뉴
        </c:if>
    </ul>

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