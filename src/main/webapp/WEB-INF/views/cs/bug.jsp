<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CS_FAQ.do</title>
<link rel="stylesheet" href="resources/css/min.css">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/CS_FAQ.do.css">
<link rel="stylesheet" href="resources/css//Bug.css">
</head>
<body>
	  <jsp:include page="../top_menu.jsp"></jsp:include>
	    <jsp:include page="./notice_top_menu.jsp"></jsp:include>
	<hr>
<body>
<div class="bug_total">
	<div class="bug_position">
		<div class="bug_insert_sec">
            <span>
                <form action="bug_notice_insertOK.do">
                    <div class="area_bug_titent">
                        <div class="area_bug">
                            <h2>제목</h2>
                            <input type="text" name="title" placeholder="제목을 입력하세요">
                        </div>
                        <h3>내용</h3>
                        <input type="text" name="content" placeholder="내용을 입력하세요" id="bug_insert_content">
                    </div>
                    <input type="hidden" name="user_id" value="${user_id}">
            </span>
		</div>

		<c:if test="${user_id eq null}">
			로그인을 해주시기 바랍니다.
		</c:if>

		<div class="bug_but_position" style="display: flex; justify-content: center; align-items: center; width: 100%">
			<button class="bug_but" type="submit" id="submitButton" onclick="return validateForm();">제 출</button>
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

	<c:if test="${user_id ne null}">
		<script>
			document.addEventListener('DOMContentLoaded', function () {
				const submitButton = document.getElementById('submitButton');
				submitButton.style.display = 'block'; // 버튼이 보이도록 설정
			});
		</script>
	</c:if>
	<c:if test="${user_id eq null}">
		<script>
			document.addEventListener('DOMContentLoaded', function () {
				const submitButton = document.getElementById('submitButton');
				submitButton.style.display = 'none'; // 버튼을 숨김
			});
		</script>
	</c:if>
<script type="text/javascript">
	function validateForm() {
		// 제목과 내용의 값을 가져옴
		var titleValue = document.getElementsByName("title")[0].value.trim();
		var contentValue = document.getElementsByName("content")[0].value.trim();

		// 제목과 내용이 모두 입력되지 않은 경우
		if (titleValue === "" || contentValue === "") {
			alert("제목과 내용을 모두 입력해주세요.");
			return false; // 폼 제출 방지
		}

		// 폼이 유효하면 제출
		return true;
	}
</script>
</body>
</html>
</body>

</html>