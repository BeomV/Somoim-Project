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
<style>
.bug_but_position .bug_but{
width:100px;
}
</style>
<body>
	  <jsp:include page="../top_menu.jsp"></jsp:include>
	    <jsp:include page="./notice_top_menu.jsp"></jsp:include>
	<hr>
<body>
	<div class="bug_total">
  <div class="bug_position" style="justify-content: center; display: flex;">
         

            <div class="bug_insert_sec" style="justify-content: center"; >
                <span>
                    <form action="home.do">
						<div class="area_bug_titent">
							<div class="area_bug">
								<h2>감사합니다!</h2>

							</div>

							<h3>빠른 시일내에 검토하겠습니다</h3>
								</div>
								<div class="bug_but_position">
							<button class="bug_but" type="submit">돌아가기</button>
						</div>
						<input type="hidden" name="user_id" value="${user_id}">
					</form>
				</span>
                

                    
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
	</div>
</body>
</html>
</body>

</html>