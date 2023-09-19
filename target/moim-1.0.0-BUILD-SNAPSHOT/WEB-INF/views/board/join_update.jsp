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
    <title>Document</title>
</head>
<body>
    <jsp:include page="../top_menu.jsp"></jsp:include>

<div class="join_section">
    <jsp:include page="./som_top_menu.jsp"></jsp:include>


    <div class="insert_func">
            <span>



            </span>

    </div>
    <div class="join_insert_secction">
             <span>

                 <input type="hidden" value="${vo2.num}" id="update_num" style="display: none;">
                 <input type="hidden" value="${num}" id="somoim_num" style="display: none;">
                <h2>제목</h2>
                <input type="text" placeholder="제목을 입력하세요" value="${vo2.title}" id="update_title">
                <h3>내용</h3>
<%--                <input type="text" placeholder="내용을 입력하세요" id="insert_content" value="${vo2.content}">--%>
                 <div style="width: 100%; height: 620px; border-radius:5px; padding: 8px; border: #ccc solid 1px; outline: none; resize: none; text-align: left;margin-top: 20px;" id="update_content" contenteditable="true">
                     ${vo2.content}
                 </div>
                <h2>작성자</h2>
                <input type="text" placeholder="작성자" style="background-color: #ccc;" value="${vo2.user_id}" id="update_user_id" readonly>
                <h2>작성 날짜</h2>
                <input type="text" placeholder="작성날짜" style="background-color: #ccc;" value="${vo2.write_date}" id="update_write_date" readonly>

            </span>
        <button type="button" onclick="join_updateOK()">수정완료</button>


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
<script src="resources/js/board.js"></script>
</html>