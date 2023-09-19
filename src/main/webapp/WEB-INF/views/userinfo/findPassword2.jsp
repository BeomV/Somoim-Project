<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">
<script
        src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
    function showMessage() {
        var alertMessage = "[알림] 네이버가 발송한 메일이 스팸 메일로 분류된 것은 아닌지 확인해 주세요. 스팸 메일함에도 메일이 없다면, 다시 한 번 '인증번호 받기'를 눌러주세요.";
        alert(alertMessage);
    }

    $(document).ready(function() {
        // 이름 입력 유효성 검사 및 팝업 띄우기
        $("#user_id").blur(function() {
            var name = $("#user_id").val();
            if (name === '') {
                alert("이름을 입력해주세요.");
            }
        });

        // 이메일 입력 유효성 검사 및 팝업 띄우기
        $("input[name='email']").blur(function() {
            var email = $("input[name='email']").val();
            if (email === '') {
                alert("이메일을 입력해주세요.");
            }
        });

        // 인증번호 입력 유효성 검사 및 팝업 띄우기
        $("#email_token").blur(function() {
            var email_token = $("#email_token").val();
            if (email_token === '') {
                alert("인증번호를 입력해주세요.");
            }
        });

        $("#mail_check_button").click(function() {
            console.log("mail_check_button...click");
            var email = $("input[name='email']").val();
            console.log(email);

            // 서버에 이메일 주소를 전송하는 Ajax 요청
            $.ajax({
                url: 'sendEmail.do',
                method: 'GET',
                data: { email: email },
                dataType: "json",
                success: function(response) {
                    console.log("response:", response);
                    console.log("response.result:", response.result);
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
                        sessionStorage.setItem("email_ok",response.result);
                        // 인증 성공한 경우 회원가입 버튼 활성화
                        $("#register").prop('disabled', false);
                    } else {
                        alert('인증 코드가 일치하지 않습니다. 다시 확인해주세요.');
                    }
                },
                error: function() {
                    alert('서버와의 통신에 실패했습니다.');
                }
            });
            return false;
        });

        // 비밀번호 재설정 버튼 클릭 이벤트
        $("#submitpass").click(function() {
            var email_token = $("#email_token").val();

            if (email_token === '') {
                alert("인증번호를 입력해주세요.");
                return false;
            } else {
                console.log(sessionStorage.getItem("email_ok") );
                if (sessionStorage.getItem("email_ok") === 'OK') {
                    // 이메일 인증이 완료된 경우 비밀번호 재설정 페이지로 이동
                    location.href = "resetPassword.do?user_id=${param.user_id}";
                    sessionStorage.setItem("email_ok","");
                } else {
                    // 이메일 인증이 완료되지 않은 경우 팝업을 띄웁니다.
                    alert('이메일 인증을 해주세요.');
                }
            }
        });
    });
</script>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>findpassword_2</title>
    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/min.css">
    <link rel="stylesheet" href="resources/css/find.css">




</head>
<body>
<%@ include file="../top_menu.jsp" %>


<div class="find_sec" >

    <div class="insert_sec" >

        <div class="find_title" >
            <h2>비밀번호 찾기 </h2>
        </div>
        <h5 style="display: inline; margin-left: 50%;">-
            01. 아이디 입력 &gt; <span style="color: blue;"> 02. 본인 확인 </span> &gt; 03. 비밀번호 재설정</h5>
    </div>



    <div class="total" >
        <h3 style="height: 4px; margin-right: 50%;">이름</h3>
        <input type="text"  placeholder="이름을 입력하세요" id="user_id" > <br>
        <div class="email" >
            <div class="emailtitle" >
                <h3  style="height: 4px; ">이메일</h3>
                <h5 >본인확인 이메일 주소와 입력한 이메일 주소가 같아야, 인증번호를 받을 수 있습니다.</h5>
            </div>
            <div class="inser_email">
                <input type="email" placeholder="이메일을 입력하세요" name="email" class="mail_check_input" id="email" >
                <button type="button" class="mail_check_button" id="mail_check_button">인증 번호 전송</button>
            </div>
        </div>

        <div class="insert_certi" >
            <input type="text" placeholder="인증 번호 6자리를 입력해주세요"  id="email_token" name="email_token">
            <br>
            <div class="injarea" style="text-align: center;">
                <button id="inj" type="button" onclick="showMessage()">인증번호가 오지 않았나요?</button> <br>
            </div>
            <button id="btn_email_token" >확인</button>

            <button type="button" id="submitpass" >비밀번호 재설정</button>
        </div>

    </div>

</div>


<br>


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