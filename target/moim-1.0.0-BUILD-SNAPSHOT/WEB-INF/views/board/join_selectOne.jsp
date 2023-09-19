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
    <title>Document</title>
</head>

<script>
    function replaceWithForm(button) {
        var parentDiv = button.parentNode;

        var form = document.createElement('form');
        form.action = 'som_dcomm_insertOK.do';

        var div = document.createElement('div');
        div.className = 'join_commnets_insert_section';

        var inputText = document.createElement('input')
        inputText.type = 'text';
        inputText.placeholder = '대댓글 작성';
        inputText.name = 'content';
        inputText.value = '${c_com.content}';
        inputText.style.width = '80%';
        inputText.style.borderTop = 'none';
        inputText.style.borderLeft = 'none';
        inputText.style.borderRight = 'none';




        var buttonSubmit = document.createElement('button');
        buttonSubmit.type = 'submit';
        buttonSubmit.textContent = '댓글 작성';
        buttonSubmit.style.marginLeft = '10px';
        buttonSubmit.style.width = '80px';
        buttonSubmit.style.height = '40px';
        buttonSubmit.style.fontSize = '0.7rem';
        buttonSubmit.style.textAlign = 'center';
        buttonSubmit.style.justifyContent = 'center';

        var arrowRightIcon = document.createElement('i');
        arrowRightIcon.className = 'fa-solid fa-arrow-right';


        div.appendChild(arrowRightIcon);

        div.appendChild(inputText);
        div.appendChild(buttonSubmit);

        form.appendChild(div);

        parentDiv.replaceChild(div, button);
    }
</script>


<script>
    function showPopup() {
        // 팝업 창 생성
        var popup = document.createElement("div");
        popup.style.width = "300px";
        popup.style.height = "300px";
        popup.style.backgroundColor = "white";
        popup.style.border = "1px solid black";
        popup.style.position = "fixed";
        popup.style.top = "50%";
        popup.style.left = "50%";
        popup.style.transform = "translate(-50%, -50%)";
        popup.style.padding = "20px";

        // 신고자 정보 입력 필드 생성
        var reporterInput = document.createElement("input");
        reporterInput.type = "text";
        reporterInput.name = "user_id";
        reporterInput.value = "${user_id}";
        reporterInput.style.width = "100%";
        reporterInput.style.marginBottom = "10px";

        // 신고당한 사람 정보 입력 필드 생성
        var reportedUserInput = document.createElement("input");
        reportedUserInput.type = "text";
        reportedUserInput.name = "criminal";
        reportedUserInput.value = "${vo2.user_id}";
        reportedUserInput.style.width = "100%";
        reportedUserInput.style.marginBottom = "10px";

        // 신고 사유 선택 드롭다운 메뉴 생성
        var reasonSelect = document.createElement("select");
        reasonSelect.name = "reason";
        reasonSelect.style.width = "100%";
        reasonSelect.style.marginBottom = "10px";

        // 옵션 생성 및 추가
        var reasons = ["부적절한 단어가 포함된 게시물", "부적절한 사진이 포함된 게시물", "불쾌감을 조성하는 게시물", "타인을 비방하거나, 정치적 성향이 담긴 게시물"];
        for (var i = 0; i < reasons.length; i++) {
            var option = document.createElement("option");
            option.value = reasons[i];
            option.text = reasons[i];
            reasonSelect.appendChild(option);
        }

        // 확인 버튼 생성
        var button = document.createElement("button");
        button.innerHTML = "확인";
        button.style.width = "100%";
        button.onclick = function() {
            var reporter = reporterInput.value;
            var reportedUser = reportedUserInput.value;
            var reason = reasonSelect.value;

            // AJAX를 사용하여 서버에 데이터 전송
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "/reportsInsert.do?");
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    // 응답 처리
                    alert("신고가 성공적으로 등록되었습니다.");
                    document.body.removeChild(popup); // 팝업 창 제거
                }
            };
            // div로 파티션 나누고, body에 릴레티브 주고, 팝업에 엡솔주고 top 50 lft 50 등등 >>>중앙 정렬
            var numValue = encodeURIComponent('${vo2.num}');
            var params = 'num=' + numValue; // 매개변수 문자열 생성

            xhr.send(params);
        };

        // 생성한 요소들을 팝업 창에 추가
        popup.appendChild(reporterInput);
        popup.appendChild(reportedUserInput);
        popup.appendChild(reasonSelect);
        popup.appendChild(button);

        // 팝업 창을 body 요소에 추가
        document.body.appendChild(popup);
    }

</script>


<body>

<jsp:include page="../top_menu.jsp"></jsp:include>

<div class="join_section">
    <jsp:include page="./som_top_menu.jsp"></jsp:include>
    <div class="top_func">
        <button type="button"><a href="join_insert.do">글쓰기</a></button>
    </div>
    <div class="view_content" style="height: auto; border: 1px solid #ccc; border-radius: 5px; margin-bottom: 50px;">
        <div class="join_top">
            <input type="hidden" value="${vo2.num}" id="vo2_num" style="display: none;">
            <div class="user_info">
                <div class="profile" style="background-color: red">

                    <%--                    파트 게시글 작성자 이미지 프로필 사진 --%>
                    <img style="  object-fit: cover; width: 100%; height: 100%; border-radius: 50%;"
                         src="resources/uploadimg/${vo2.save_name}">
                </div>
                <span>
                    <strong>${vo2.user_id}</strong>
                    <p>${vo2.write_date}</p>
                </span>
            </div>
            <div class="bbs_func">
                <button type="button" onclick="showPopup()">
<%--                    <i class="fa-solid fa-lightbulb" style="color: red;"></i>--%>
                </button>

                    <%--                좋아요 파트--%>
                    <c:if test="${good_count_mem ==null}">
                        <button type="button" >
                        <a href="good_count_up.do?user_id=${user_id}&num=${vo2.num}">
                        <i class="far fa-heart"></i>
                    </a>


                    </button>
                </c:if>
                <c:if test="${good_count_mem.user_id ==user_id}">
                    <button type="button">

                        <a href="good_count_down.do?user_id=${user_id}&num=${vo2.num}">
                            <i class="far fa-heart">취소</i>
                        </a>

                    </button>
                </c:if>
                <%--                좋아요 파트 끝--%>
                <c:if test="${vo2.user_id == user_id}">
                <button type="button">
                    <a href="join_update.do?num=${vo2.num}">

                        <i class="fas fa-edit"></i>
                    </a>

                </button>
                <button type="button">
                    <a href="join_deleteOK.do?num=${vo2.num}">
                        <i class="fas fa-trash-alt"></i>
                    </a>

                </button>
                </c:if>
            </div>
        </div>
        <div class="content_text">
            <strong>제목: ${vo2.title}</strong>
            <p>
            <p>내용:
                <br>
                <c:if test="${vo2.save_image != null}">
                    <img src="resources/uploadimg/${vo2.save_image}">
                </c:if>
                <br>
                ${vo2.content}
            </p>
            <div class="vote_one" style="width: 75%; margin: 0 auto;">
                <h2 style="margin-bottom: 20px;">
                    <c:out value="${qvo2.question}"/>
                </h2>
                <c:forEach items="${ch_vo2}" var="ch_vo2">
                    <ul class="vote_grid">
                        <li>

                            <button type="button" onclick="test(this)" style="position: relative; width: 100%; border: none; background-color: transparent;">
                                <input type="hidden" value="${ch_vo2.som_vote_user_id}" style="display: none;"
                                       class="som_vote_member">
                                <input type="hidden" value="${qvo2.num}" id="voteVo_num"
                                       style="display: none;">
                                <input type="text" class="vote_items" value="${ch_vo2.choice}" readonly/>
                                <div class="vote_count_section">
                                    <strong style="text-align: right;">${ch_vo2.count}</strong>
                                </div>

                            </button>
                        </li>
                    </ul>

                </c:forEach>
            </div>


        </div>
        <div style=" text-align: right; margin-right: 10px;">
            <i class="fa-regular fa-heart" style="color: #ff4242;">${vo2.good_count}</i>
            <i class="fa-regular fa-eye">${vo2.view_count}</i>
        </div>

    </div>

    <div class="comments_sec">
        <h3>댓글</h3>
        <c:forEach items="${coms}" var="com">
            <span>
                <ul class="com_grid">
                    <li>
                        <div class="user_info">
                            <div class="user_info_profile_">
                                <div class="profile">
                                    <%--                    파트 "댓글"작성자 이미지 프로필 사진 --%>

                                    <img style="object-fit: cover; width: 100%; height: 100%; border-radius: 50%;"
                                         src="resources/uploadimg/${com.save_name}">
                                </div>
                                <div class="user_info_profile_tooltip">
                                    <div class="com_top">
                                        <strong>${com.user_id}</strong>

                                        <span>
                                            <c:if test="${com.user_id == user_id}">
                                            <form id="myForm" action="som_comm_updateOK.do?num=${com.som_board_num}">
                                                <input type="hidden" name="som_board_num" value="${com.som_board_num}">
                                                <input type="hidden" name="num" value="${com.num}">
                                                <input type="hidden" name="save_name" value="${com.save_name}">
                                                <input type="hidden" name="content" id="hidden_content_input"
                                                       value="${com.content}">
                                                    <button id="submitButton" type="submit">
                                                        <i class="fas fa-edit"></i>
                                                        <%-- 수정 --%>
                                                    </button>
                                            </form>

                                                <form action="som_comm_deleteOK.do?num=${com.num}">
                                                <input type="hidden" name="som_board_num" value="${com.som_board_num}">
                                                <input type="hidden" name="num" value="${com.num}">
                                            <button type="submit">
                                                <i class="fas fa-trash-alt"></i>
                                                <%-- 삭제 --%>
                                            </button>
                                            </form>
                                            </c:if>
                                        </span>
                                    </div>
                                        <p>${com.write_date}</p>
                                    <div class="com_func">
                                        <input type="text" placeholder="댓글 목록" value="${com.content}"
                                               id="join_comments">
                                    </div>
                                <h4 style="margin-left: 4%; margin-top: 2%;">대댓글</h4>
                                <c:forEach var="c_com" items="${c_coms}">
                                    <c:if test="${c_com.parent_com eq com.num}">
                                        <div class="com_func" style="width: auto; margin: 0 0; margin-left: 50px; ">
                                            <div style="justify-content: center; display: flex;">
                                            <h5 style="margin-top: 30%;">${c_com.user_id}</h5>
                                                </div>
                                            <form action="som_dcomm_updateOK.do"
                                                  style=" width: 100%; display: flex; justify-content: space-between;">
                                                    <input type="text" placeholder="댓글 목록" name="content"
                                                           value="${c_com.content}">
                                                    <input type="hidden" name="num" value="${c_com.num}">
                                                    <input type="hidden" name="som_board_num"
                                                           value="${c_com.som_board_num}">
<%--                                                <input type="hidden" name="" value="${com.som_board_num}">--%>
                                               <c:if test="${c_com.user_id == user_id}">
                                                <div class="bbs_func" style="width: 3%;">

                                                           <button type="submit">
                                                                   <i class="fas fa-edit"></i>
                                                           </button>
                                                </div>
                                            </form>
                                            <form action="som_dcomm_deleteOK.do">

                                                   <input type="hidden" name="num" value="${c_com.num}">
                                                   <input type="hidden" name="som_board_num" value="${com.som_board_num}">
                                                                                                <div class="bbs_func">

                                                         <button type="submit"  >
                                                   <input type="hidden" name="som_board_num"
                                                          value="${com.som_board_num}">
                                                         <button type="submit">
                                                             <i class="fas fa-trash-alt"></i>
                                                        </button>
                                                                                                                                                    </div>

                                                </form>
                                                </c:if>
                                        </div>
                                    </c:if>
                                </c:forEach>
                                    <form action="som_dcomm_insertOK.do">
                                        <input type="hidden" name="parent_com" value="${com.num}">
                                        <input type="hidden" name="user_id" value="${user_id}">
                                        <input type="hidden" name="som_board_num" value="${com.som_board_num}">
                                        <input type="hidden" name="somoim_num" value="${com.somoim_num}">
                                        <div style="display: flex; justify-content: center;">
                                        <button class="lovely_insert_button"
                                                style="margin-top: 10px; border: none; color: gray;"
                                                onclick="replaceWithForm(this)">대댓글 작성</button>

                                    </div>
                                </form>
                            </div>
                        </div>
                    </li>
                </ul>
            </span>
        </c:forEach>
        <form action="som_comm_insertOK.do?som_board_num=${vo2.num}">
            <div class="join_commnets_insert_section" style="width: 90%;">
                <div class="comments_user_profile" style="margin-right: 1.5%">
                    <div class="commnets_user_profile_img">
                        <div class="profile" style="background-color: red; ">

                            <%--                    파트 게시글 작성자 이미지 프로필 사진 --%>
                            <img style="  object-fit: cover; width: 100%; height: 100%; border-radius: 50%;"
                                 src="resources/uploadimg/${User_save_name.save_name}">
                        </div>
                    </div>
                    <p>${user_id}</p>
                </div>
                <input type="hidden" name="som_board_num" value="${vo2.num}">
                <input type="hidden" name="somoim_num" value="${vo2.somoim_num}">
                <input type="hidden" name="num" value="${vo2.num}">
                <input type="hidden" name="user_id" value="${user_id}">
                <input type="hidden" name="save_name" value="${vo2.save_name}">

                <input  style="border-radius: 1%" type="text" placeholder="댓글 작성" name="content">
                <%--                <input type="hidden" name="som_member_num" value="#{vo2.som_member_num}">--%>

                <button style="margin-left: 10px; width: 80px; height:40px;  font-size: 0.7rem; text-align: center;  justify-content: center;" type="submit">댓글 작성</button>
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
<script>
    const submitButton = document.getElementById('submitButton');
    console.log("submitButton", submitButton);
    const joinCommentsInput = document.getElementById('join_comments');
    console.log("join_comments", joinCommentsInput);

    const hiddenContentInput = document.getElementById('hidden_content_input');
    console.log("hidden_content_input", hiddenContentInput);

    submitButton.addEventListener('click', function (event) {
        event.preventDefault();

        const inputTextValue = joinCommentsInput.value;
        console.log("inputTextValue", inputTextValue);


        hiddenContentInput.value = inputTextValue;
        console.log("hiddenContentInput.value", hiddenContentInput.value);

        document.getElementById('myForm').submit();
    });

    function test(buttonElement) {
        var userId = "${user_id}";
        console.log(userId);

        var voteItemValue = $(buttonElement).find('.vote_items').val();
        var voteVo_num = $(buttonElement).find('#voteVo_num').val();
        console.log(voteItemValue);
        console.log(voteVo_num);

        var VoteMember = $(buttonElement).find('.som_vote_member').val();
        console.log(VoteMember);

        // VoteMember를 '/'로 분할하고, userId가 있는지 확인
        var VoteMemberArray = VoteMember.split('/');
        if (VoteMemberArray.includes(userId)) {
            $.ajax({
                url: "vote_CancleOK.do",
                data: {
                    som_qvote_num: voteVo_num,
                    choice: voteItemValue,
                },
                method: 'POST',
                dataType: 'text',
                success: function (response) {
                    console.log('Success:', response);
                    location.href="join_selectOne.do?num="+$("#vo2_num").val();

                },
                error: function (xhr) {
                    ;
                    alert('Error occurred. Status: ' + xhr.status);
                }
            });
        } else {
            $.ajax({
                url: "vote_UpdateOK.do",
                data: {
                    som_qvote_num: voteVo_num,
                    choice: voteItemValue,
                },
                method: 'POST',
                dataType: 'text',
                success: function (response) {
                    console.log('Success:', response);
                    location.href="join_selectOne.do?num="+$("#vo2_num").val();

                },
                error: function (xhr) {
                    ;
                    alert('Error occurred. Status: ' + xhr.status);
                }
            });

        }
    }



</script>
</body>
<script>
    $(document).ready(function() {
        var userId = "${user_id}";

        // 모든 투표 항목을 순회
        $('.vote_items').each(function() {
            var buttonElement = $(this).parent(); // 현재 투표 항목의 부모 요소 (버튼 요소)를 선택
            var VoteMember = buttonElement.find('.som_vote_member').val();
            console.log("including member");

            // VoteMember를 '/'로 분할하고, userId가 있는지 확인
            var VoteMemberArray = VoteMember.split('/');
            if (VoteMemberArray.includes(userId)) {
                $(this).css('background-color', '#ccc'); // vote_items 요소의 배경색을 #ccc로 변경
            }
        });
    });
</script>
</html>