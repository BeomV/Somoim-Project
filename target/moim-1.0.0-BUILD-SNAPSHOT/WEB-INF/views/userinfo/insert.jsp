<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/style_min.css">
    <link rel="stylesheet" href="resources/css/min.css">
    <script
            src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script type="text/javascript">


        $(document).ready(function() {
            $("#mail_check_button").click(function() {
                console.log("mail_check_button...click");
                var email = $("input[name='email']").val();
                console.log(email);
                // 서버에 이메일 주소를 전송하는 Ajax 요청
                $.ajax({
                    url: 'sendEmail.do',
                    method: 'GET',
                    data: { email: email },
                    dataType:"json",
                    success: function(response) {
                        console.log("response:",response);
                        console.log("response.result:",response.result);
                        // 서버로부터의 응답을 처리하는 로직
                        if (response.result === 'OK') {
                            alert('인증번호를 이메일로 발송했습니다.');
                        } else {
                            alert('이메일 전송에 실패했습니다.');
                        }
                    },
                    error: function() {
                        alert('서버와의 통신에 실패했습니다.');
                    }
                });
                return false;
           
        });
            $("#btn_email_token").click(function() {
                console.log("btn_email_token...click");
                var email = $("input[name='email']").val();
                console.log(email);
                var email_token = $("input[name='email_token']").val();
                console.log(email_token);
                // 서버에 이메일 주소와 인증 코드를 전송하는 Ajax 요청
                $.ajax({
                    url: 'send_email_token.do',
                    method: 'GET',
                    data: {
                        email: email,
                        email_token: email_token
                    },
                    dataType: "json",
                    success: function(response) {
                        console.log("response:", response);
                        if (response.result === 'OK') {
                            alert('인증이 완료되었습니다.');
                            // 인증 성공한 경우 회원가입 버튼 활성화
                            $("#register").prop('disabled', false);
                            sessionStorage.setItem("email_ok",response.result);
                        } else {
                            alert('인증 코드가 일치하지 않습니다. 다시 확인해주세요.');
                         // 인증 실패한 경우 회원가입 버튼 비활성화
                            $("#register").prop('disabled', true);
                        }
                    },
                    error: function() {
                        alert('서버와의 통신에 실패했습니다.');
                        // 통신 실패한 경우 회원가입 버튼 비활성화
                        $("#register").prop('disabled', true);
                    }

                });
                return false;
            });

        });
        // 이메일 값을 저장하는 함수
        function saveEmail(event) {
            var email = $("input[name='email']").val();
            localStorage.setItem("email", email);
        }

        function check() {
            // 중복 체크 결과 메시지를 가져옴
            var message = $("#resultMessage").text();

            if (message !== '생성 가능한 아이디입니다.') {
                alert('아이디 중복 체크를 해주세요.');
                return false;
            }

            if (insertform.user_id.value.length === 0) {
                alert("아이디가 누락되었습니다.");
                insertform.user_id.focus();
                return false;
            }

            if (insertform.pw.value.length === 0) {
                alert("비밀번호가 누락되었습니다.");
                insertform.pw.focus();
                return false;
            }

            if (insertform.pw_check.value.length === 0) {
                alert("비밀번호 재입력이 누락되었습니다.");
                insertform.pw_check.focus();
                return false;
            }

            if (insertform.name.value.length === 0) {
                alert("이름이 누락되었습니다.");
                insertform.name.focus();
                return false;
            }

            if (insertform.email.value.length === 0) {
                alert("이메일이 누락되었습니다.");
                insertform.email.focus();
                return false;
            }

            if (insertform.email_token.value.length === 0) {
                alert("인증번호가 누락되었습니다.");
                insertform.email_token.focus();
                return false;
            }

            if (sessionStorage.getItem("email_ok") !== "OK") {
                alert("인증 누락되었습니다.");
                return false;
            }

            // 비밀번호와 사용자 아이디를 가져옴
            var pw = $("input[name='pw']").val();
            var pw_check = $("input[name='pw_check']").val();

            // 비밀번호와 사용자 아이디 비교
            if (pw !== pw_check) {
                alert("비밀번호와 비밀번호 확인이 같지 않습니다. 확인해주세요.");
                return false; // 회원가입 중지
            }

            $("#register").click(function () {
                // 회원가입 버튼을 클릭할 때 로그인 창으로 이동
                window.location.href = 'login.jsp'; // 로그인 페이지 URL로 변경해야 합니다.
                sessionStorage.setItem("email_ok", "");
            });

            // 회원가입 폼 제출
            return true;
        }
        
        

        function checkEmailVerification(event) {
               // 이메일 인증 여부 확인
                   var email = $("input[name='email']").val();
                   var email_token = $("input[name='email_token']").val();

                   if (email === '') {
                       alert('이메일을 입력해주세요.');
                       event.preventDefault(); // 기본 동작 중단 (버튼 클릭 이벤트 취소)
                       return;
                   }

                   if (email_token === '') {
                       alert("인증번호를 입력해주세요.");
                       event.preventDefault(); // 기본 동작 중단 (버튼 클릭 이벤트 취소)
                       return;
                   }

                   // 이메일 인증 확인을 위한 Ajax 요청
                   $.ajax({
                       url: 'send_email_token.do',
                       method: 'GET',
                       data: {
                           email: email,
                           email_token: email_token
                       },
                       dataType: "json",
                       success: function(response) {
                           console.log("response:", response);
                           if (response.result === 'OK') {
                               alert('인증이 완료되었습니다.');
                               // 인증 성공한 경우 버튼 클릭 이벤트 계속 진행
                               window.location.href = 'u_findId2.do';
                           } else {
                               alert('인증 코드가 일치하지 않습니다. 다시 확인해주세요.');
                               event.preventDefault(); // 기본 동작 중단 (버튼 클릭 이벤트 취소)
                           }
                       },
                       error: function() {
                           alert('인증번호를 전송해주세요');
                           event.preventDefault(); // 기본 동작 중단 (버튼 클릭 이벤트 취소)
                       }
                   });
               }

      


        </script>


    <script>
        $(document).ready(function () {
            $("#checkButton").click(function () {
                var username = $("#user_id").val();

                // 아이디가 비어있는지 확인
                if (username.trim() === '') {
                    $("#resultMessage").text('아이디를 입력해주세요.');
                    return;
                }

                // Ajax 호출
                $.ajax({
                    url: 'json_m_idCheck.do',
                    method: 'GET',
                    data: { user_id: username },
                    dataType: 'json',
                    success: function (response) {
                        console.log(response);

                        // 서버에서 반환된 JSON 데이터의 result 값을 확인하여 메시지 출력
                        if (response.result === 'Ok') {
                            $("#resultMessage").text('생성 가능한 아이디입니다.');
                        } else if (response.result === 'NotOK') {
                            $("#resultMessage").text('이미 생성된 아이디가 있습니다.');
                        }
                    },
                    error: function (xhr, status, error) {
                        console.log('xhr.status : ', xhr.status);
                        $("#resultMessage").text('아이디를 입력해주세요.');
                    }
                });
            });
        });
    </script>

</head>
<body>
<%@ include file="../top_menu.jsp" %>
<div class="register_section">


    <form action="u_insertOK.do" method="post" enctype="multipart/form-data" name="insertform">
        <label for="user_id">아이디</label>
        <br>
        <input type="text" placeholder="아이디를 입력하세요." name="user_id" id="user_id">
        <div style="align-items: center; display: flex;">
        <button style="width:30%; height: 1%;" type="button" id="checkButton">아이디 중복 체크</button>
        <div id="resultMessage"></div>
        </div>
        <br>
        <label for="user_pw">비밀번호</label>
        <br>
        <input type="password" placeholder="비밀번호를 입력하세요." name="pw" id="user_pw" >
        <br>
        <label for="user_pw">비밀번호 확인</label>
        <br>
        <input type="password" placeholder="비밀번호를 입력하세요." name="pw_check" id="pw_check" >
        <br>
        <label for="user_name">이름</label>
        <br>
        <input type="text" placeholder="이름를 입력하세요." id="name" name="name" >
        <br>
        <div class="birth_gender">
        <span>
            <label>생년월일</label>
            <br>
            <select name="birthday_year">
            </select>

            <select name="birthday_month">
            </select>

            <select name="birthday_day">
            </select>

        </span>
            <span>
            <label>성별</label>
            <br>
            <select>
                <option>남자</option>
                <option>여자</option>
            </select>
        </span>
        </div>
        <label for="user_profile">프로필 사진</label>
        <br>
        <input type="file" name="file" id="file" value="">
        <br>
        <label for="user_interest">관심 태그 선택</label>
        <br>
        <select name="interest" size="5" style="width: 30%; border: solid 1px #cccccc; padding: 4px; margin-top: 5px;">
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
		<br>
		<br>
        <label for="user_email">이메일</label>
        <br>
        <div class="register_input_flex">
            <input type="email" placeholder="이메일을 입력하세요" name="email" class="mail_check_input" onchange="saveEmail()" style="width: 75%;">
            <button type="button" class="mail_check_button" id="mail_check_button">인증번호</button>
        </div>
        <br>
        <div class="register_input_flex">
            <input type="text" placeholder="인증번호 입력" name="email_token" id="email_token"  >
            <button id="btn_email_token"   >확인</button>
        </div>
        <br>
        <button id="register" type="submit" onClick="return check()"  value="회원가입">회원가입</button>
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

<script>
    $(document).ready(function() {
        var year = new Date().getFullYear();
        var startYear = year - 65;
        var endYear = year - 15;

        console.log($('select[name="birthday_year"]').val());


        for (var i = startYear; i <= endYear; i++) {
            var option = '<option value="'+ i +'">'+ i +'</option>';
            console.log(option); // 이 라인이 추가된 부분입니다.
            $('select[name="birthday_year"]').append(option);
        }

        for (var i = 1; i <= 12; i++) {
            var month = (i < 10) ? '0' + i : i;
            $('select[name="birthday_month"]').append('<option value="'+ month +'">'+ month +'</option>');
        }

        for (var i = 1; i <= 31; i++) {
            var day = (i < 10) ? '0' + i : i;
            $('select[name="birthday_day"]').append('<option value="'+ day +'">'+ day +'</option>');
        }

        var firstOptionValue = $('select[name="birthday_year"] option:first').val();
        console.log(firstOptionValue);

    });



</script>
</html>

