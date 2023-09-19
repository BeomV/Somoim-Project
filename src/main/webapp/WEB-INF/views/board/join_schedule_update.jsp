<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/min.css">
    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/board.css">
    <link rel="stylesheet" href="resources/css/board_min.css">
    <script src="https://kit.fontawesome.com/1652357a48.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="resources/js/board.js"></script>
    <script src="resources/js/board02.js"></script>
    <title>Document</title>
</head>
<body>
<jsp:include page="../top_menu.jsp"></jsp:include>

<div class="join_section">
    <jsp:include page="./som_top_menu.jsp"></jsp:include>
    <div class="img_info">
        이미지
    </div>

    <div class="schedule_insert_section" style="margin-top: 50px;">
        <div class="schedule_insert_section_box">
            <input type="hidden" value="${vo2.num}" id="update_num">
            <input type="hidden" value="${vo2.somoim_num}" id="somoim_num">
            <h2>제목</h2>
            <input type="text" placeholder="모임 제목을 입력하세요." id="sch_insert_title" value="${vo2.schedule_title}">
            <h2>날짜</h2>
            <input type="date" id="shc_insert_date" value="${vo2.schedule_date}">
            <h2>시간</h2>
            <input type="time" id="shc_insert_time" value="${vo2.schedule_time}">
            <h2>장소</h2>
            <input type="text" id="sch_insert_place" value="${vo2.place}">
            <h2>회비</h2>
            <input type="text" placeholder="회비" id="sch_insert_money" value="${vo2.money}" }>
            <h2>참여 인원</h2>
            <input type="range" value="${vo2.max_participant}" min="1" max="300" id="sch_insert_max_member">

            <%--                <input type="hidden" value="${user_id}" id="user_id">--%>
            <span>
                <p>0명</p>
                <p id="range_text">${vo2.max_participant}명</p>
                <p>300명</p>
                </span>

        </div>
        <button type="button" id="btn_shcedule_insert" onclick="join_schedule_updateOK()">수정 완료</button>

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











