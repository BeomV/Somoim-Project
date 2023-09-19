<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Mypage_myactivity_likedboard</title>
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/min.css">
<link rel="stylesheet"
	href="resources/css/Mypage_myactivity_likedboard.css">
<link rel="stylesheet"
	href="resources/css/Mypage_myactivity_likedboard_min.css">
<script src="https://kit.fontawesome.com/1652357a48.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">

	$(function() {
		console.log('onload........');

		$.ajax({
			url: 'Rest_Mypage_myactivity_boardbyme.do',
			data: {
				user_id: '${param.user_id}'
			},
			success: function(vos) {
				console.log('response.......:', vos);
				console.log('성공?');

				let tag_vos = '';

				$.each(vos, function(index, vo) {
					console.log(index, vo);
					let content = vo.content; // vo.content 값을 변수에 저장

					// content가 null이면 "게시글 내용이 없습니다." 출력
					if (content === null) {
						content = "==게시글 내용이 없습니다.==";
					}

					// Unix timestamp를 Date 객체로 변환
					const date = new Date(vo.write_date);

					// 날짜를 한국 시간대로 변환하여 "yyyy.MM.dd" 형식으로 표시
					const formattedDate = date.toLocaleString("ko-KR", {
						timeZone: "Asia/Seoul",
						year: "numeric",
						month: "2-digit",
						day: "2-digit",
					});

					tag_vos += `
          <li>
            <div class="liked_board">
              <ul class="board_profile_info">
                <li>
                  <a href="join_selectOne.do?num=\${vo.num}">
                    <li class="info_item2">
                      <div class="vertical_info">
                        \${vo.user_id}
                        <p style="font-size: 0.2rem;">\${formattedDate}</p>
                        \${vo.title}<br>
                        \${content}<br>
                      </div>
                    </li>
                  </a>
                </li>
              </ul>
            </div>
          </li>
        `;
				});

				$('#boardbyme').html(tag_vos);
			},
			error: function(xhr, status, error) {
				console.log('xhr.status : ', xhr.status);
			}
		});
	});

    </script>

</head>


<body>

	<jsp:include page="../top_menu.jsp"></jsp:include>
	<div class="header"></div>

	<div class="area">

		<div class="Mypage_myactivity_selection">
			<ul>
				<li><a href="Mypage_myactivity_boardbyme.do?user_id=${user_id }">내가 쓴 글</a></li>
				<li><a href="Mypage_myactivity_communitybyme.do?user_id=${user_id }">내가 쓴 커뮤니티</a></li>
				<li><a href="Mypage_myactivity_commbyme.do?user_id=${user_id }">내가 쓴 댓글</a></li>
				<li><a href="mypage_myactivity_good.do?user_id=${user_id }">좋아요 사진</a></li>
				<li><a href="Mypage_myactivity_likedboard.do?user_id=${user_id }">좋아요 게시글</a></li>
			</ul>
		</div>
	</div>
	<hr style="margin-bottom: 50px;">


	<div class="like_List">
		<ul class="asldkjasd" id="boardbyme">
			<li>
				<div class="liked_board" style="height: 0;">
					<ul class="board_profile_info">




					</ul>
				</div>

			</li>

		</ul>
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