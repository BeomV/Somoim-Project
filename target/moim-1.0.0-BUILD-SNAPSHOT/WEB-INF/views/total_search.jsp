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
    <link rel="stylesheet" href="resources/css/board.css">
    <link rel="stylesheet" href="resources/css/board_min.css">
<%--    <link rel="stylesheet" href="resources/css/searching.css">--%>


    <script src="https://kit.fontawesome.com/1652357a48.js" crossorigin="anonymous"></script>
</head>
<style>
    .rec_list_grid {
        /*display: flex;*/
        flex-wrap: wrap;
        list-style: none;
        padding: 0;
        margin: 0;
    }

    .rec_list_grid li {
        width: calc(25% - 10px); /* 각 항목의 너비를 25%로 설정 (4개씩 보이도록) */
        margin-bottom: 20px;
    }

    .rec_list_grid li .moim_img {
        width: 90%;
    }

    .rec_list_grid li .moim_img .img_box {
        /*position: relative;*/
    }

    .rec_list_grid li .moim_img .img_box img {
        /*display: block;
        /*width: 100%; !* 이미지가 부모 요소에 꽉 차도록 설정 *!*/
    }
</style>


<body class="body">

<jsp:include page="top_menu.jsp"></jsp:include>

<c:if test="${empty com_vos && empty som_vos && empty cs_vos}">
    <div style="margin-top: 10%">
    <div style="text-align: center;">
    <h1>검색결과가 없습니다</h1>

    </div>
    </div>
</c:if>
<c:if test="${not empty som_vos}">
<div class="rec_list" style="width: 1440px">
    <div class="rec_list_top">
        <h1>🔥 모임 리스트 🔥</h1>

    </div>

    <ul class="rec_list_grid">
        <c:forEach items="${som_vos}" var="som_vo">
            <li>
                <a href="som_selectOne.do?num=${som_vo.num}">
                    <input type="hidden" value="${som_vo.num}">
                    <input type="hidden" value="${som_vo.create_date}">
                    <div class="moim_img" style="width: 340px">
                        <div class="img_box" style="width: 90%;">
                            <img  src="resources/uploadimg/${som_vo.somoim_img}">
                            <span>
                <p class="hashtag">${som_vo.category}</p>
                <h1>${som_vo.som_title}</h1>
                <p class="sub_tit">소셜링 ${som_vo.area} ${som_vo.create_date}</p>
              </span>
                        </div>
                    </div>
                </a>
            </li>
        </c:forEach>
    </ul>




</div>
</c:if>
<c:if test="${not empty com_vos}">

<div class="rec_list" style="width: 1440px">
    <div class="rec_list_top">
        <h1>🔥 커뮤니티 🔥</h1>

    </div>

    <ul class="rec_list_grid">
        <c:forEach items="${com_vos}" var="com_vo">
            <li >
            <a href="community_selectOne.do?num=${com_vo.num}">
                <input type="hidden" value="${com_vo.num}">
                <input type="hidden" value="${com_vo.write_date}">
                <div class="moim_img">
                    <div class="img_box" >
                        <img  src="resources/uploadimg/${com_vo.save_img}"></div>
                    <span >
									<h1>"${com_vo.title}</h1>
									<p style="color: red" class="hashtag">♥ ${com_vo.good_count}</p>
									<p class="sub_tit">조회수:${com_vo.view_count}</p>
								</span>

                </div>
            </a>
        </li>
        </c:forEach>
    </ul>

</div>
</c:if>

<c:if test="${not empty cs_vos}">

<div class="rec_list" style="width: 1440px">
    <div class="rec_list_top">
        <h1>🔥 공지사항 🔥</h1>

    </div>

    <ul class="rec_list_grid">
        <c:forEach items="${cs_vos}" var="cs_vo">
            <li >
                <a href="cs_notice_selectOne.do?num=${cs_vo.num}">
                    <input type="hidden" value="${cs_vo.num}">
                    <input type="hidden" value="${cs_vo.write_date}">
                    <div class="moim_img" style="width: 340px">
                        <div class="img_box" >
                            <img  src="resources/uploadimg/${cs_vo.save_name}"></div>
                        <span>
									<h3>${cs_vo.title}</h3>
								</span>

                    </div>
                </a>
            </li>
        </c:forEach>
    </ul>

</div>
</c:if>

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
