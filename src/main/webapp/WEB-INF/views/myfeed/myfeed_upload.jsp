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
    <link rel="stylesheet" href="resources/css/gallery.css">
    <script src="https://kit.fontawesome.com/1652357a48.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>Document</title>
</head>
<body>
<jsp:include page="../top_menu.jsp"></jsp:include>

<div class="join_section">
    <%--     <jsp:include page="./som_top_menu.jsp"></jsp:include> --%>



    <div class="gallery_insert_section">
        <form action="myfeed_feed_mine.do?user_id=${param.user_id}">
            <div class="gallery_insert_top_func">
                <h2>
                    <i class="far fa-image"></i>
                    이미지
                </h2>
                <%--                 <input type="hidden" value="${num}" name="somoim_num"> --%>
                <input type="file" name="file" id="imageUpload" accept="image/*" onchange="previewImage();" />
                <input type="hidden" name="user_id" value="${param.user_id }">
            </div>
            <div class="gallery_img_box">
                <img id="imagePreview" src="" alt="Image Preview" style="display: none;"/>

            </div>
            <button type="submit" id="image_btn">피드 등록</button>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>


    $("#image_btn").on("click", function(){
        console.log('누ㅡㄹㄹ밈');
        var file = document.querySelector('#imageUpload').files[0];
        var fileName = file.name;
        console.log('할렐루야 : ', fileName);
        $.ajax({
            url : 'myfeed_uploadOK.do',
            type: 'POST',
            data: {
                fileName: fileName,
                user_id:'${user_id}'
            },
            success : function(response) {
                console.log('file name ....', fileName);
            },
            error : function(xhr, status, error){
                console.log('xhr.status : ', xhr.status);
            }
        });

    });

    function previewImage() {
        var file = document.querySelector('#imageUpload').files[0];
        var reader = new FileReader();

        reader.addEventListener("load", function () {
            // 변환된 이미지 URL을 img 태그의 src 속성에 할당
            document.querySelector('#imagePreview').src = reader.result;
            document.querySelector('#imagePreview').style.display = 'block';




        }, false);

        if (file) {
            reader.readAsDataURL(file);
        }
    }
</script>
</html>