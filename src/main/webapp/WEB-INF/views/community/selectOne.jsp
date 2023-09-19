<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         language="java" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/min.css">
    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/community.css">

    <script src="https://kit.fontawesome.com/1652357a48.js"
            crossorigin="anonymous"></script>
    <title>Document</title>
</head>

<script>
    function replaceWithForm(button) {
        var parentDiv = button.parentNode;

        var form = document.createElement('form');
        form.action = 'Community_comments_updateOK.do';

        var div = document.createElement('div');
        div.className = 'community_commnets_insert_section';

        var inputText = document.createElement('input');
        inputText.type = 'text';
        inputText.placeholder = '댓글 작성';
        inputText.name = 'content';
        inputText.value = '${c_com.content}';


        var buttonSubmit = document.createElement('button');
        buttonSubmit.type = 'submit';
        buttonSubmit.textContent = '댓글 작성';

        div.appendChild(inputText);

        div.appendChild(buttonSubmit);

        form.appendChild(div);

        parentDiv.replaceChild(div, button);
    }
</script>
<body>


<jsp:include page="../top_menu.jsp"></jsp:include>

<div class="community_section">

    <div class="c_view_content"
         style="height: auto; border: 1px solid #ccc; border-radius: 5px; margin-bottom: 50px;">

        <div class="community_top">
            <div class="c_user_info">
                <div class="c_profile">
                    <img style="object-fit: cover; width: 100%; height: 100%; border-radius: 50%;"
                         src="resources/uploadimg/${vo2.save_name}">
                </div>
                <span> <strong>${vo2.user_id}</strong>
						<p>${vo2.write_date}</p>
					</span>
            </div>
            <div class="c_bbs_func">
                <c:if test="${good_count_mem ==null}">
                    <button type="button">
                        <a href="community_good_count_up.do?user_id=${user_id}&num=${vo2.num}">
                        <i class="far fa-heart"></i>
                        </a>
                    </button>
                </c:if>
                <c:if test="${good_count_mem.user_id ==user_id}">
                    <button type="button">
                        <a href="community_good_count_down.do?user_id=${user_id}&num=${vo2.num}">
                            <i class="far fa-heart">취소</i>
                        </a>
                    </button>
                </c:if>
                <c:if test="${vo2.user_id == user_id}">
                <a href="community_update.do?num=${param.num}" class="button-link">
                    <button type="button" class="edit-button">
                        <i class="fas fa-edit"></i>
                    </button>
                </a> <a href="community_deleteOK.do?num=${param.num}"
                        class="button-link">
                <button type="button" class="delete-button">
                    <i class="fas fa-trash-alt"></i>
                </button>
                </c:if>
            </a>
            </div>
        </div>
        <div class="c_content_text">
            <img src="resources/uploadimg/${vo2.save_img}">
            </br>
            <strong>${vo2.title}</strong>

            <p style="white-space: pre-wrap">${vo2.content}</p>

        </div>
        <div style=" text-align: right; margin-right: 10px;">
            <i class="fa-regular fa-heart" style="color: #ff4242;">${vo2.good_count}</i>
        </div>
    </div>
    <div class="c_comments_sec">
        <h3>댓글</h3>
        <c:forEach items="${ccoms}" var="ccoms">
			<span>
				<ul class="c_com_grid">
					<li>
						<div class="c_user_info">
							<div class="c_user_info_profile_">
								<div class="c_profile">
                                    <%--파트 "댓글"작성자 이미지 프로필 사진 --%>
									<img style="object-fit: cover; width: 100%; height: 100%; border-radius: 50%;"
                                         src="resources/uploadimg/${ccoms.save_name}">
								</div>
								<div class="c_user_info_profile_tooltip">
									<div class="c_com_top">
										<strong>${ccoms.user_id}</strong>
										<span>
                                            <c:if test="${ccoms.user_id eq loginUserInfo.user_id}">
                                                <form id="myForm" action="Community_comments_updateOK.do?num=${ccoms.num}">
                                                    <input type="hidden" name="board_num" value="${ccoms.board_num}">
                                                    <input type="hidden" name="num" value="${ccoms.num}">
                                                    <input type="hidden" name="content" id="hidden_content_input"
                                                           value="${ccoms.content}">
                                                <button id="submitButton" type="submit">
                                                    <i class="fas fa-edit"></i>
                                                    <%-- 수정 --%>
                                                </button>
                                                </form>
                                                <form action="Community_comments_deleteOK.do?num=${ccoms.num}">
                                                    <input type="hidden" name="board_num" value="${ccoms.board_num}">
                                                    <input type="hidden" name="num" value="${ccoms.num}">
                                                <button type="submit">
                                                    <i class="fas fa-trash-alt"></i>
                                                    <%-- 삭제 --%>
                                                </button>
                                                </form>
                                            </c:if>
										</span>
									</div>
										<p>${ccoms.write_date}</p>
									<div class="c_com_func">
										<input type="text" placeholder="댓글 목록" value="${ccoms.content}"
                                               id="community_comments">
									</div>
									<h4 style="margin-left: 4%; margin-top: 2%;">대댓글</h4>
									<c:forEach var="c_com" items="${c_coms}">
                                        <c:if test="${c_com.parent_com eq ccoms.num}">
                                        <div class="c_com_func" style="width: auto; margin: 0 0; margin-left: 50px; ">
                                            <h5>${ccoms.user_id}</h5>
                                            <form action="Community_re_comments_updateOK.do"
                                                  style=" width: 100%; display: flex; justify-content: space-between;">
                                                <input type="text" name="content" placeholder="댓글 목록" value="${c_com.content}">
                                                <input type="hidden" name="num" value="${c_com.num}">
                                                <input type="hidden" name="board_num"
                                                       value="${c_com.board_num}">
                                        <c:if test="${c_com.user_id == user_id}">
                                                           <button type="submit">
                                                                   <i class="fas fa-edit"></i>
                                                           </button>
                                            </form>
                                            <form action="Community_re_comments_deleteOK.do">
                                                <input type="hidden" name="num" value="${c_com.num}">
                                                <input type="hidden" name="board_num"
                                                       value="${ccoms.board_num}">
                                                         <button type="submit">
                                                             <i class="fas fa-trash-alt"></i>
                                                        </button>
                                                </form>
                                                </c:if>
                                        </div>
                                        </c:if>
                                    </c:forEach>
									<form action="Community_re_comments_insertOK.do" onsubmit="return validateAndSubmitForm(this);">
                                    <div class="community_re_commnets_insert_section">
                                        <input type="hidden" name="parent_com" value="${ccoms.num}">
                                        <input type="hidden" name="user_id" value="${ccoms.user_id}">
                                        <input type="hidden" name="board_num" value="${ccoms.board_num}">
                                        <div style="display: flex; justify-content: center;">
                                        <button class="lovely_insert_button"
                                                style="margin-top: 10px; border: none; color: gray;"
                                                onclick="replaceWithForm(this)">대댓글 작성</button>
                                    </div>
                                    </div>
                                	</form>
								</div>
							</div>
						</div>
					</li>
				</ul>
			</span>
        </c:forEach>
        <form action="Community_comments_insertOK.do?num=${vo2.num}" onsubmit="return validateAndSubmitForm(this);">
            <div class="community_commnets_insert_section">
                <div class="c_comments_user_profile">
                    <div class="c_commnets_user_profile_img">
                        <img style="  object-fit: cover; width: 100%; height: 100%; border-radius: 50%; margin-right: 1.5%;"
                             src="resources/uploadimg/${loginUserInfo.save_name}">
                    </div>
                    <p>${loginUserInfo.user_id}</p>
                </div>
                <input type="hidden" name="board_num" value="${vo3.board_num}">
                <input type="hidden" name="num" value="${vo3.num}">
                <input type="hidden" name="user_id" value="${loginUserInfo.user_id}">
                <input type="text" placeholder="댓글 작성" name="content">
                <button type="submit">댓글 작성</button>
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
    function validateAndSubmitForm(form) {
        var contentInput = form.querySelector('input[name="content"]');
        var contentValue = contentInput.value.trim();

        if (contentValue === '') {
            alert('댓글 내용을 입력해주세요!');
            return false; // 폼 제출을 막습니다.
        }

        // 댓글 내용이 비어있지 않으면, 폼을 제출합니다.
        return true;
    }
</script>

<script>
    const submitButton = document.getElementById('submitButton');
    console.log("submitButton", submitButton);
    const joinCommentsInput = document.getElementById('community_comments');
    console.log("community_comments", joinCommentsInput);

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
</script>

</body>
</html>