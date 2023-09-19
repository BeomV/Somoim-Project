<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">
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
   
});

// 이메일 값을 저장하는 함수
function saveEmail() {
    var email = $("input[name='email']").val();
    localStorage.setItem("email", email);
}
<%--
function findID() {
    console.log('findID()');
    var name = $("input[name='name']").val();
    var email = $("input[name='email']").val();
    var email_token = $("input[name='email_token']").val();
    

    if (name === '') {
        alert('이름을 입력해주세요.');
        return;
    }

    if (email === '') {
        alert('이메일을 입력해주세요.');
        return;
    }
    
  if (email_token === '') {
    alert("인증번호를 입력해주세요.");
	return;
  }
}
--%> 
function showMessage() {
    var alertMessage = "[알림] 발송한 메일이 스팸 메일로 분류된 것은 아닌지 확인해 주세요. 스팸 메일함에도 메일이 없다면, 다시 한 번 '인증번호 받기'를 눌러주세요.";
    alert(alertMessage);
   }
<%----%>   
        
 function checkEmailVerification(event) {
        // 이메일 인증 여부 확인
            var email = $("input[name='email']").val();
            var email_token = $("input[name='email_token']").val();
			
            console.log("email",email);
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
                        window.location.href = 'u_findId2.do?email='+email;
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

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>findID</title>
    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/min.css">
    <link rel="stylesheet" href="resources/css/find.css">

</head>
<body>
<%@ include file="../top_menu.jsp" %>

    <div class="find_sec" >
    
       <div class="insert_sec" >




            <div class="total" >
                <div style="background-color: white; width: 80%; height: auto;">
                    <div class="find_title" >
                        <h2>아이디 찾기 </h2>
                    </div>

                    <div class="insert_id" style="width: 100%">
                        <h3 style="height: 4px;margin-right:75%;">이름</h3>
                        <input style="width: 75%" type="text"  placeholder="이름을 입력하세요" id="name" name="name" style="width: 50%;" > <br>
                    </div>
                    <div class="email"style="width: 100%" >
                        <div class="emailtitle" style="width: 100%; margin-left: 8.5%" >
                            <h3  style="height: 4px; ">이메일</h3>
                            <h5 >본인확인 이메일 주소와 입력한 이메일 주소가 같아야, 인증번호를 받을 수 있습니다.</h5>
                        </div>
                        <div class="inser_email" style="width: 100%" >
                            <input style="width: 60.5%; margin-left: 8%;"type="email" placeholder="이메일을 입력하세요" name="email"  onchange="saveEmail()">
                            <button type="button" class="mail_check_button" id="mail_check_button" >인증 번호 전송</button>
                        </div>
                    </div>    
                
                    <div class="insert_certi" style="text-align: left; margin:0 0 0 0;">
                        <div style="justify-content: left ">
                            <div style="width: 100%;margin-left: 12%;background-color: white; display: flex;">
                                <input style="margin:0;width: 60%; text-align: left" type="text" placeholder="인증 번호 6자리를 입력해주세요"  id="email_token" name="email_token">
                                 <button style="width: 18%; margin-top: 1%; margin-left: 3%;height: 68%;  border: none; background-color: gray; color: white " id="btn_email_token">확인</button>
                            </div>


                        </div>
                            <div class="injarea" style="text-align: center;">
                            <button id="inj" type="button" onclick="showMessage()">인증번호가 오지 않았나요?</button> <br>
                            </div>
                        <br>
                        <div style="text-align: center; justify-content: center; " >
                            <div style="display: flex; flex-direction: row; justify-content: center;margin-left: 15%;">
                                <button style="width: 30%; height: 10%; margin-top: 3.5%" type="submit" id="" onclick="checkEmailVerification(event)">확인</button>
                                <button style="width: 30%; height: 10%;" type="button" id="submitpass" onclick="location.href='findPassword.do'">비밀번호 찾기</button>
                            </div>
                    </div>
                        <br>
                        <hr>


                </div>
                </div>
        </div>
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
</body>
</html>