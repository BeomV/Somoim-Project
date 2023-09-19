<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/min.css">
    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/board.css">
    <link rel="stylesheet" href="resources/css/board_min.css">
    <script src="https://kit.fontawesome.com/1652357a48.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="resources/js/schedule.js"></script>
    <title>Document</title>
</head>
<body>
<jsp:include page="../top_menu.jsp"></jsp:include>

<div class="join_section">
    <jsp:include page="./som_top_menu.jsp"></jsp:include>


    <div class="top_func">
        <button type="button" style="padding: 5px 12px;"><a href="join_schedule_insert.do" style="color: white">일정 만들기</a></button>
    </div>

    <div class="schedule_box">
        <ul class="sch_grid">
            <c:forEach items="${vos}" var="vo">
                <li>
                    <div class="sch_func">
                            <span>
                                <input type="hidden" value="${vo.num}" class="PART_UPDATE_NUM">
                                <input type="hidden" value="${vo.somoim_num}" id="somoim_num">
                                <input type="hidden" value="${vo.participant}" class="PART_UPDATE_Participant">
                                <input type="hidden" value="${user_id}" class="PART_UPDATE_USER_ID">
                                <button type="button" class="participant_btn" onclick="Participant_UpdateOK(this)">참석</button>
                                <button type="button" class="participant_cancle_btn" onclick="Participant_Cancle(this)">취소</button>
                            </span>
                        <span>

                                <c:if test="${vo.user_id == user_id}">
                                <button type="button">
                                    <a href="join_schedule_update.do?num=${vo.num}"><i class="fas fa-edit"></i></a>
                                </button>
                                 <button type="button" onclick="join_schedule_deleteOK()">
                                    <i class="fas fa-trash-alt"></i>
                                </button>
                                </c:if>
                            </span>

                    </div>
                    <div class="sch_content">
                        <div class="sch_info" style="text-align: left">

                            <h2>${vo.schedule_date}</h2>
                            <strong style="font-size: 20px;" >${vo.schedule_title}</strong>
                            <p>일시: ${vo.schedule_date}</p>
                            <p>장소: ${vo.place}</p>
                            <p>회비: ${vo.money}</p>

                        </div>
                        <div class="sch_member">
                            <h2 style="padding-bottom: 10px">참석 멤버</h2>
                            <ul class="schm_grid">

                                <c:forEach items="${fn:split(vo.participant, '/')}" var="participant">
                                <li>
                                    <input type="hidden" value="${participant}" class="participant_mine">
                                    <img src="resources/uploadimg/${saveNamesMap[participant].save_name}" style="width: 50px; height: 50px; border-radius: 25px">
                                </li>
                                </c:forEach>


                        </div>

                    </div>

                </li>
            </c:forEach>
        </ul>
    </div>

    <div class="Join_Paging">

        <a href="<c:url value='join_schedule.do'>
                <c:param name='somoim_num' value='${num}'/>
                <c:param name='pageNo' value='${(param.pageNo > 1) ? param.pageNo - 1 : param.pageNo}'/>

                <c:param name='pageSize' value='${empty param.pageSize ? 5 : param.pageSize}'/>
                </c:url>"><i class="fa-solid fa-angle-left"></i></a>



        <c:forEach var="i" begin="1" end="${totalPage}">
            <a href="<c:url value='join_schedule.do'>
                    <c:param name='somoim_num' value='${num}'/>
                    <c:param name='pageNo' value='${i}'/>
                    <c:param name='pageSize' value='${empty param.pageSize ? 5 : param.pageSize}'/>
                    </c:url>">${i}</a>
        </c:forEach>



        <a href="<c:url value='join_schedule.do'>
                <c:param name='somoim_num' value='${num}'/>
                <c:param name='pageNo' value='${(param.pageNo < totalPage) ? param.pageNo + 1 : param.pageNo}'/>
                <c:param name='pageSize' value='${empty param.pageSize ? 5 : param.pageSize}'/>
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

<script src="resources/js/schedule.js"></script>
<script>
    $(document).ready(function() {
        var userId = $('#login_user_id').val();
        console.log(userId);

        $('.participant_mine').each(function() {
            var participantName = $(this).val();

            if (participantName === userId) {
                var $this = $(this);
                $this.closest('li').css('border', '2px solid #1785F2');
                $this.closest('ul').prepend($this.closest('li'));
            }
        });
    });

</script>

</html>