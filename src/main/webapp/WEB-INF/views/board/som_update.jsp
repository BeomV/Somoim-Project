<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/min.css">
<link rel="stylesheet" href="resources/css/board.css">
<link rel="stylesheet" href="resources/css/board_min.css">
<script src="https://kit.fontawesome.com/1652357a48.js"
	crossorigin="anonymous"></script>
<script src="resources/js/board.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

</head>
<body>
	<jsp:include page="../top_menu.jsp"></jsp:include>


	<div class="board_section">

		<form action="som_updateOK.do?num=${vo2.num }"
			enctype="multipart/form-data" method="post">
			<div class="moim_insert">
				<h1>지역</h1>
				<button type="button" id="moim_location">
					<i class="fas fa-map-marker-alt"></i>지역 설정
				</button>

				<input type="text" id="area" name="area" placeholder="위치를 입력하세요"
					style="margin-top: 10px;" value=${vo2.area }>

				<h1>모임 이름</h1>
				<a href="#" style="color: red; font-size: 11px;">*포인트샵 바로가기</a>
				<input type="text" readonly placeholder="모임 이름" id="som_title" name="som_title" value=${vo2.som_title}>
				<input type="hidden" name="somoim_master" value="${user_id}">
				<h1>모임 소개</h1>
				<textarea style="width: 100%; height: 500px; border: solid 1px #ccc; border-radius: 5px; resize: none; outline: none;"	rows="4" name="som_content" placeholder="모임 내용" id="moim_content"> ${vo2.som_content} </textarea>
				<span>
					<h1>모임 정원</h1> <input type="text" placeholder="모임 최대 정원"
					id="moim_max" name="max_member" value=${vo2.max_member }>
					<h1>카테고리</h1> <select name="category" id="category">
						<option value="야구">야구</option>
						<option value="독서">독서</option>
						<option value="요리">요리</option>
						<option value="운동">운동</option>
						<option value="게임/오락">게임/오락</option>
						<option value="아웃도어">아웃도어</option>
						<option value="반려동물">반려동물</option>
						<option value="문화/공연">문화/공연</option>
						<option value="카페/맛집">카페/맛집</option>
						<option value="공예">공예</option>
						<option value="사진/영상">사진/영상</option>
						<option value="사교/인맥">사교/인맥</option>
						<option value="음악/악기">음악/악기</option>
						<option value="업종/직무">업종/직무</option>
						<option value="해외/언어">해외/언어</option>
						<option value="베이커리">베이커리</option>
						<option value="여행">여행</option>
				</select>
					<h1>대표 사진</h1> <input type="file" id="moim_profile" name="file">
				</span> <input type="submit" id="moim_btn" value="수정 완료">

			</div>
		</form>
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
</html>