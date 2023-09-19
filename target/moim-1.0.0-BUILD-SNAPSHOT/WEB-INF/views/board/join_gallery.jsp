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

    <div class="top_func">
        <button type="button" style="padding: 5px 12px;"><a href="join_gallery_insert.do" style="color: white">이미지 업로드</a></button>
    </div>


    <div class="join_imgbox">
        <ul class="img_grid">
            <c:forEach items="${list}" var="list">
                <li class="gallery_img_top" style="background-color: transparent; border: solid 1px #eee">
                    <input type="hidden" value="${list.num}">
                    <img src="resources/uploadimg/${list.image_name}">
                    <span>
                        <p>${ErrorMessage}</p>
                        <a href="join_gallery_deleteOK.do?num=${list.num}&user_id=${list.user_id}&somoim_num=${list.somoim_num}"><i class="fas fa-trash-alt"></i> 삭제</a>
                    </span>
                </li>

            </c:forEach>

        </ul>

    </div>

        <div class="Join_Paging">
    <a href="<c:url value='join_gallery.do'>
                <c:param name='somoim_num' value='${num}'/>
                <c:param name='pageNo' value='${(param.pageNo > 1) ? param.pageNo - 1 : param.pageNo}'/>


                </c:url>"><i class="fa-solid fa-angle-left"></i></a>



    <c:forEach var="i" begin="1" end="${totalPage}">
        <a href="<c:url value='join_gallery.do'>
                    <c:param name='somoim_num' value='${num}'/>
                    <c:param name='pageNo' value='${i}'/>

                    </c:url>">${i}</a>
    </c:forEach>



    <a href="<c:url value='join_gallery.do'>
                <c:param name='somoim_num' value='${num}'/>
                <c:param name='pageNo' value='${(param.pageNo < totalPage) ? param.pageNo + 1 : param.pageNo}'/>
                </c:url>"><i class="fa-solid fa-angle-right"></i></a>
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
    $(document).ready(function(){
        adjustImageHeight();

        $(window).resize(function() {
            adjustImageHeight();
        });

        function adjustImageHeight() {
            $(".img_grid li").each(function() {
                let width = $(this).width();
                $(this).height(width);
            });
        }

        var message = "${param.message}";
        if (message) {
            alert(message);
        }


    });
</script>
</html>