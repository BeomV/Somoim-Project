<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page session="true" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/min.css">
    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/board.css">
    <link rel="stylesheet" href="resources/css/pay.css">
    <link rel="stylesheet" href="resources/css/board_min.css">
    <script src="https://kit.fontawesome.com/1652357a48.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>Document</title>
</head>
<body>
<jsp:include page="../top_menu.jsp"></jsp:include>

<div class="join_section">
    <jsp:include page="./som_top_menu.jsp"></jsp:include>

    <div class="payment_section">
        <ul class="payment_main_grid">
            <c:forEach items="${vos}" var="vo">
                <li>
                    <div class="payment_left">
                    <span>
                        <input type="hidden" value="${vo.num}" id="pay_num">
                        <input type="hidden" value="${vo.som_member_num}" id="pay_som_num">
                        <h3>일정 제목: ${vo.schedule_title}</h3>
                        <p>총 금액:  <fmt:formatNumber value="${vo.money}" maxFractionDigits="0" /></p>
                        <c:set var="participantCount" value="${fn:length(fn:split(vo.participant, '/'))}" />
                        <c:set var="moneyPerPerson" value="${vo.money / participantCount}" />
                        <p>1인당 금액: <fmt:formatNumber value="${moneyPerPerson}" maxFractionDigits="0" /></p>
<%--                        <button type="button" id="payment_btn" onclick="schedule_payment(this)">--%>
<%--                            <img src="resources/uploadimg/btn_request_tiny.png">--%>
<%--                        </button>--%>
                    </span>
                    </div>
                    <div class="payment_right">
                        <h3>참여 멤버</h3>
                        <ul id="member-list">
                            <c:forEach items="${fn:split(vo.participant, '/')}" var="participant">
                                <li>
                                    <input type="hidden" value="${participant}" class="participant_mine">
                                    <img src="resources/uploadimg/${saveNamesMap[participant].save_name}" style="width: 50px; height: 50px; border-radius: 25px">
                                </li>
                            </c:forEach>



                        </ul>
                        <div class="show-more-div">
                        </div>

                    </div>
                </li>
            </c:forEach>

        </ul>
        <div class="Join_Paging">

            <a href="<c:url value='join_pay.do'>
                <c:param name='somoim_num' value='${num}'/>
                <c:param name='pageNo' value='${(param.pageNo > 1) ? param.pageNo - 1 : param.pageNo}'/>

                <c:param name='pageSize' value='${empty param.pageSize ? 5 : param.pageSize}'/>
                </c:url>"><i class="fa-solid fa-angle-left"></i></a>



            <c:forEach var="i" begin="1" end="${totalPage}">
                <a href="<c:url value='join_pay.do'>
                    <c:param name='somoim_num' value='${num}'/>
                    <c:param name='pageNo' value='${i}'/>
                    <c:param name='pageSize' value='${empty param.pageSize ? 5 : param.pageSize}'/>
                    </c:url>">${i}</a>
            </c:forEach>



            <a href="<c:url value='join_pay.do'>
                <c:param name='somoim_num' value='${num}'/>
                <c:param name='pageNo' value='${(param.pageNo < totalPage) ? param.pageNo + 1 : param.pageNo}'/>
                <c:param name='pageSize' value='${empty param.pageSize ? 5 : param.pageSize}'/>
                </c:url>"><i class="fa-solid fa-angle-right"></i></a>

        </div>
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
<script src="resources/js/pay.js"></script>
<script>

</script>
</html>
