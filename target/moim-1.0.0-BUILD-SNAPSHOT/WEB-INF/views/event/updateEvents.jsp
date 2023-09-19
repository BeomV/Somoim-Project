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




<div class="event">


    <div class="event_content">
        <form action="updateOKEvents.do?num=${vo2.num}" >
            작성자 :${user_id}<br><br>
        <h1>대표 사진</h1>
        <input  type="file"  name="save_name" value="${vo2.save_name}"><br><br>
        <input  type="hidden"  name="num" value="${vo2.num}"><br><br>

        <input  type="hidden"  name="user_id" value="${user_id}"><br><br>

            <span>이벤트 제목</span>:
            <input type="text"  name="title" value="${vo2.title}"><br><br>
            <label for="content">콘텐츠 내용:</label>
            <textarea name="content" id="content" rows="5" cols="50" value="${vo2.content}">${vo2.content}</textarea>

        <span>이벤트 시작기간</span>:
            <input type="date" id="start_events" name="start_events" value="${vo2.start_events}"><br><br>
        <span>이벤트 종료일자</span>:
            <input type="date" id="end_date" name="end_date" value="${vo2.end_date}"><br><br>
        <span>이벤트 대상</span>:
            <input type="text"  name="event_target" value="${vo2.event_target}"><br><br>
        <span>상품 </span>:
            <input type="text"  name="present" value="${vo2.present}"><br><br>
        <span>당첨인원</span>:
            <input type="text"  name="winner" value="${vo2.winner}"><br><br>
        <button type="submit"> 작성완료</button>


        </form>

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