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

    <div class="img_info">

        <img style="width: 100%; height: 100%;" src="resources/uploadimg/${somoim_img}">

    </div>

    <div class="insert_func">
            <span>
                <i class="fas fa-vote-yea"><a id="vote_link">투표</a></i>
                <i class="fas fa-image"><a href="#" id="imageUploadLink">이미지</a></i>
            </span>
    </div>
    <div class="join_insert_secction">
        <form id="insert_form" enctype="multipart/form-data" method="POST">
            <span>

                    <h2>제목</h2>
                    <input type="text" placeholder="제목을 입력하세요" id="insert_title" name="title">

                    <h2>내용</h2>
                    <div contenteditable="true"
                         style="width: 100%; height: 620px; border-radius:5px; padding: 8px; border: #ccc solid 1px; outline: none; resize: none; text-align: left;margin-top: 20px;"
                         id="insert_content" name="content">




                    </div> <%--contenteditable 종료 부분--%>

                    <h2>작성자</h2>
                    <input type="text" style="background-color: #ccc;" value="${user_id}" id="insert_id" name="user_id" readonly/>


                    <input type="file" name="file" id="insert_imageUpload" style="display: none;">
                    <input type="hidden" value="${num}" id="insert_num" name="somoim_num">
                    <input type="hidden" id="vote_num">



            </span>
            <div class="form_span">
                <button type="button" id="join_insertOK">작성완료</button>
            </div>
        </form>


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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="resources/js/board.js"></script>
<script src="resources/js/vote.js"></script>

<script>
    $(document).ready(function() {
        $("#imageUploadLink").click(function(event) {
            event.preventDefault();  // 기본 동작(여기서는 페이지 이동)을 중지시킵니다.
            $("#insert_imageUpload").click();  // '#insert_imageUpload'를 클릭한 것처럼 만듭니다.
        });
    });
</script>

</html>