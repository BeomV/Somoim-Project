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
	<script src="https://kit.fontawesome.com/1652357a48.js" crossorigin="anonymous"></script>
	<script src="resources/js/board.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

	<script type="text/javascript">

		$(function(){
			console.log('onload....');


			$("#moim_btn").on("click", function(e){
				e.preventDefault();

				console.log('버튼 눌림');
				var som_title = $("#som_title").val();
				console.log(som_title);

				$.ajax({
					url : 'somtitleCheck.do',
					data : {
						som_title : som_title
					},
					success : function(result) {
						console.log('result : ', result);
						if(result==1) {
							console.log('중복이 아닙니다.');
							$("#moim_btn").unbind('click').click();
						} else {
							console.log('같은 이름의 소모임이 이미 존재합니다.');
							alert('같은 이름의 소모임이 이미 존재합니다.');
						}
					},
					error : function(xhr, status, error){
						console.log('xhr.status : ', xhr.status);
					}
				});

			});
		});

	</script>


</head>
<body>
<jsp:include page="../top_menu.jsp"></jsp:include>


<div class="board_section">

	<form action="som_insertOK.do" enctype="multipart/form-data" method="post" onsubmit="return validateForm();">
		<div class="moim_insert">
			<h1>지역</h1>

			<input type="text" id="area" name="area" placeholder="위치를 입력하세요"
				   style="margin-top: 10px;">

			<h1>모임 이름</h1>
			<input type="text" placeholder="모임 이름" id="som_title" name="som_title">
			<input type="hidden" name="somoim_master" value="${user_id }">
			<h1>모임 소개</h1>
			<textarea style="width: 100%; height:500px; border: solid 1px #ccc; border-radius: 5px; resize: none; outline: none;" name="som_content"></textarea>
			<span>
				<h1>모임 정원</h1>
				<input type="text" placeholder="모임 최대 정원" id="moim_max" name="max_member">
				<h1>카테고리</h1>

				<select name="category" id="category">
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
			</span>
			<input type="submit" id="moim_btn" value="모임 만들기">
			<!-- 			<a href="som_insertOK.do" enctype="multipart/form-data" method="get">개설하기</a> -->


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

<script>
	function validateForm() {
		var areaInput = document.getElementById('area');
		var somTitleInput = document.getElementById('som_title');
		var somContentTextArea = document.getElementsByName('som_content')[0];
		var maxMemberInput = document.getElementById('moim_max');

		if (areaInput.value.trim() === '') {
			alert('지역을 입력해주세요.');
			areaInput.focus();
			return false;
		}

		if (somTitleInput.value.trim() === '') {
			alert('모임 이름을 입력해주세요.');
			somTitleInput.focus();
			return false;
		}

		if (somContentTextArea.value.trim() === '') {
			alert('모임 소개를 입력해주세요.');
			somContentTextArea.focus();
			return false;
		}

		if (maxMemberInput.value.trim() === '') {
			alert('모임 정원을 입력해주세요.');
			maxMemberInput.focus();
			return false;
		}

		return true;
	}
</script>

</body>
</html>