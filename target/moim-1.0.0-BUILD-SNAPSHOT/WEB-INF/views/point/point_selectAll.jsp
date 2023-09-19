<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/min.css">
    <link rel="stylesheet" href="resources/css/point.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<jsp:include page="../top_menu.jsp"></jsp:include>

<div class="point_category">
    <a class="point_acitve" id="point_payment">유료결제</a>
    <a>포인트</a>
    ${message}
</div>
<div class="point_list">
    <ul class="point_somoim">
        <strong>소모임</strong>
        <br>
        <p class="sub_txt">(모임장 권한을 가진 사용자만 이용이 가능합니다.)</p>
        <c:forEach items="${vos}" var="vo">
            <c:if test="${vo.category == '소모임'}">
                <li>
                    <p>${vo.item}</p>
                    <input type="hidden" value="${vo.item}" class="point_item" style="display: none">
                    <input type="hidden" value="${vo.cash}" class="point_cash" style="display: none">
                    <button type="button" class="purchase-btn">${vo.cash}원</button>
                </li>
            </c:if>
        </c:forEach>
    </ul>

    <ul class="point_somoim">
        <strong>내 피드</strong>
        <br>
        <p class="sub_txt">(모든 이용자가 구매 가능합니다.)</p>
        <c:forEach items="${vos}" var="vo">
            <c:if test="${vo.category == '내피드'}">
                <li>
                    <p>${vo.item}</p>
                    <input type="hidden" value="${vo.item}" class="point_item" style="display: none">
                    <input type="hidden" value="${vo.cash}" class="point_cash" style="display: none">
                    <button type="button" class="purchase-btn">${vo.cash}원</button>
                </li>
            </c:if>
        </c:forEach>
    </ul>

    <ul class="point_somoim">
        <strong>유저 관리</strong>
        <br>
        <p class="sub_txt">(모든 이용자가 구매 가능합니다.)</p>
        <c:forEach items="${vos}" var="vo">
            <c:if test="${vo.category == '유저관리'}">
                <li>
                    <p>${vo.item}</p>
                    <input type="hidden" value="${vo.item}" class="point_item" style="display: none">
                    <input type="hidden" value="${vo.cash}" class="point_cash" style="display: none">
                    <button type="button" class="purchase-btn">${vo.cash}원</button>
                </li>
            </c:if>
        </c:forEach>
    </ul>

</div>

<div class="point_list2">
    <ul class="point_somoim">
        <strong>소모임</strong>
        <br>
        <p class="sub_txt">(모임장 권한을 가진 사용자만 이용이 가능합니다.)</p>
        <c:forEach items="${vos}" var="vo">
            <c:if test="${vo.category == '소모임'}">
                <li>
                    <p>${vo.item}</p>
                    <input type="hidden" value="${vo.item}" class="point_item" style="display: none">
                    <input type="hidden" value="${vo.point}" class="point_point" style="display: none">
                    <button type="button" class="purchase-btn">${vo.point}p</button>
                </li>
            </c:if>
        </c:forEach>
    </ul>

    <ul class="point_somoim">
        <strong>내 피드</strong>
        <br>
        <p class="sub_txt">(모든 이용자가 구매 가능합니다.)</p>
        <c:forEach items="${vos}" var="vo">
            <c:if test="${vo.category == '내피드'}">
                <li>
                    <p>${vo.item}</p>
                    <input type="hidden" value="${vo.item}" class="point_item" style="display: none">
                    <input type="hidden" value="${vo.point}" class="point_point" style="display: none">
                    <button type="button" class="purchase-btn">${vo.point}p</button>
                </li>
            </c:if>
        </c:forEach>
    </ul>

    <ul class="point_somoim">
        <strong>유저 관리</strong>
        <br>
        <p class="sub_txt">(모든 이용자가 구매 가능합니다.)</p>
        <c:forEach items="${vos}" var="vo">
            <c:if test="${vo.category == '유저관리'}">
                <li>
                    <p>${vo.item}</p>
                    <input type="hidden" value="${vo.item}" class="point_item" style="display: none">
                    <input type="hidden" value="${vo.point}" class="point_point" style="display: none">
                    <button type="button" class="purchase-btn">${vo.point}p</button>
                </li>
            </c:if>
        </c:forEach>
    </ul>
</div>

<div class="premium_section" style="border-top: #ccc solid 1px;">
    <i class="fa-solid fa-crown"></i>
    <strong>프리미엄 회원권</strong>
    <div class="point_main_title">
        "이런 분들에게 추천해요!"
    </div>

    <div class="point_sub_title">
        제한 없이 모임을 만들고 <strong>소모임을</strong> 즐기고 싶은 분
    </div>

    <div class="premium_item_list">
        <a>1. 모임 이름 변경 1회 무료</a>
        <a>2. 모임 인원수 제한 해제</a>
        <a>3. 매달 소정의 모임 증정품 제공!</a>
        <a>4. 소모임에서 제공하는 '장소' 무료 대여 (연3회)</a>


    </div>
    <div class="premium_button_sec">
        <button type="button"> 프리미엄 회원권 구매하기</button>
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
<c:if test="${not empty point}">
    <script>
        alert("${point}");
    </script>
</c:if>

</body>
<script src="resources/js/point.js"></script>


</html>