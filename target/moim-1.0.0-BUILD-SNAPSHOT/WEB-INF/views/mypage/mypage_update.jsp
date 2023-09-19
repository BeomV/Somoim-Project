<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

<script>
// 	$(document).ready(function() {
// 		$('.datepicker').datepicker();
		
// 	});
	
	$(document).ready(function() {
	    const dataValue = '${vo2.save_name}';
	    handleImageSelect(dataValue);
	});


function handleImageSelect(dataValue) {
	const input = document.getElementById('moim_profile');
	const file = input.files[0];
	
	console.log('data...{}', dataValue);
	console.log('input....{}', input);
	console.log('file....{}', file);
	
	var tag_vo = '';
	
	
	if (file) {
		console.log('감지');
		
	    console.log('Selected file:', file);
	    console.log('File name:', file.name);
	    console.log('File type:', file.type);
	    console.log('File size:', file.size, 'bytes');
	    
	    tag_vo = `
	    	<input type="hidden" name="file" value=\${file.name}>
	    	<input type="hidden" name="save_name" value=\${file.name}>
	    `;
	    
	} else {
		console.log('감지 안됨');
		tag_vo = `
			<input type="hidden" name="file" value="\${dataValue}">
			<input type="hidden" name="save_name" value="\${dataValue}">
		`;
		}
	    $('#file_savename').html(tag_vo);
	}
	
	function alertmsg(){
		var selectedInterest = $("select[name='interest']").val();
		
		if(!selectedInterest) {
			alert("관심 태그를 선택해주세요.");
			return false;
		} else
			return true;
		
// 		$.ajax({
// 			url:"mypage_updateOK.do",
// 			method:"POST",
// 			data: $("form").serialize(), //폼 데이터를 직렬화하여 전송
// 			success: function(response){
// 				console.log(response);
// 				if(response==1)
// 					console.log('일단 요청은 성공');
// 			},
// 			error: function(xhr, status, error){
// 				console.log('xhr.status : ', xhr.status);
// 				console.error(error);
// 			}
// 		});
	}
	
	
</script>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="resources/css/min.css">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/mypage_update_min.css">
<link rel="stylesheet" href="resources/css/Mypage_update.css">
</head>
<body>


	<hr style="margin-bottom: 10px;">
	<jsp:include page="../top_menu.jsp"></jsp:include>
	<form action="mypage_updateOK.do" method="post" enctype="multipart/form-data">
	<div class="total_area">
		<div class="total_position">
			<ul>
				<li>
					<div class="upper">
						<div class="profile_area">
							<ul>
								<li class="profile_img_sec"><img
									src="resources/uploadimg/${vo2.save_name }" alt="프로필 이미지"></li>
								<li class="profile_fix_but">
<!-- 									<button type="button" href="#">편집</button> -->
									<input type="file" id="moim_profile" name="file" onchange="handleImageSelect('${vo2.save_name }')"> 
									<div id="file_savename">
									</div>
									
								</li>
							</ul>
						</div>

						<div class="insert_area">
							<div class="mypage_id_insert_sec">
								<!-- 아이디 -->
								<div class="insert_area_id">
									<h2 class="mem_info">이름</h2>
									<input type="text" name="name" placeholder="아이디를 입력하세요" id="find"
										value="${vo2.name }">
										<input type="hidden" name="user_id" value="${vo2.user_id }">
										<input type="hidden" name="num" value="${vo2.num }">
								</div>
								<!-- 닉네임 -->
								<div class="insert_area_id">
									<h2 class="mem_info">이메일</h2>
									<input type="text" name="email" placeholder="닉네임를 입력하세요" id="nickname"
										value="${vo2.email }">
								</div class="insert_area_id">
								<!-- 비밀번호 -->
								<div class="insert_area_id">
									<h2 class="mem_info">비밀번호</h2>
									<input type="text" name="pw" placeholder="비밀번호를 입력하세요" id="password"
										value="${vo2.pw }">
								</div>
								<!-- 나의 주소 -->
								<div class="insert_area_id">
									<h2 class="mem_info">관심 태그</h2>
									<p style="font-size:12px;">현재 나의 관심 태그 : ${vo2.interest } </p>
									<br>
									<select name="interest" size="5">
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
<!-- 									<button type="button" id="juso">변경</button> -->

								</div>
								<!-- 휴대폰 번호 -->
<!-- 								<div class="insert_area_id"> -->
<!-- 									<h2 class="mem_info">휴대폰 번호</h2> -->
<!-- 									<div class="insert_area_Tel"> -->
<!-- 										<input type="text" placeholder="아이디를 입력하세요" id="tel" -->
<!-- 											value=" 01066389914"> -->

<!-- 									</div> -->

<!-- 								</div> -->

							</div>
						</div>
					</div>
		</div>
		</li>
		<li>
<!-- 			<form action="#"> -->
<!-- 				각 항목별로 css 설정되어 있으므로, 필요한 위치에 form 태그 작성해도 무방 -->
<!-- 				<div class="email_area"> -->
<!-- 					<div class="mypage_insert_email_footer"> -->
<!-- 						이메일 -->
<!-- 						<div class="email_footer_head"> -->
<!-- 							<h2>이메일</h2> -->
<!-- 						</div> -->
<!-- 						이메일 입력 -->
<!-- 						<div class="email_footer_body"> -->
<!-- 							<div class="input_with_button"> -->
<!-- 								<input type="text" placeholder="이메일을 입력하세요" id="email"> -->
<!-- 								<button type="button">인증 번호 전송</button> -->
<!-- 							</div> -->
<!-- 							<p style="font-size: 1px;">인증번호 입력 필요</p> -->
<!-- 							인증번호 입력 -->
<!-- 							<div class="input_with_button"> -->
<!-- 								<input type="text" placeholder="인증번호" id="number_autho_" -->
<!-- 									class="datepicker"> -->
<!-- 								<button type="button">인증 번호 전송</button> -->
<!-- 							</div> -->
<!-- 						</div> -->


<!-- 						생년월일 -->
<!-- 						<div class="birth_part"> -->
<!-- 							<div class="email_footer_head"> -->
<!-- 								<h2>생년월일</h2> -->
<!-- 							</div> -->
<!-- 							<div class="input_with_button"> -->
<!-- 								<input type="text" placeholder="1999.12.12" id="birth"> -->

<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</form> -->
		</li>
		</ul>
		<input type="submit" onclick="return alertmsg();" name="submit_btn" value="수정 완료">
	</div>
	</form>






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