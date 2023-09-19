<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
function idCheck(){
	console.log("idCheck....",$('#user_id').val());
	
	$.ajax({
		url : "json_m_idCheck.do",
		data:{user_id:$('#user_id').val()},
		method:'GET',
		dataType:'json',
		success : function(obj) {
			console.log('ajax...success:', obj);
			console.log('ajax...success:', obj.result);
			let msg = '';
			if(obj.result==='NotOK'){
				msg = '아이디가 조회되었습니다.';
			}else{
				msg = '아이디가 조회되지 않습니다.';
			}
			$('#demo').text(msg);
		},
		error:function(xhr,status,error){
			console.log('xhr.status:', xhr.status);
		}
	});//end $.ajax()...
	
}//end idCheck()...

function memberCheck() {
    var userId = $("#user_id").val();

    if (userId === "") {
        alert("아이디를 입력해주세요.");
        return;
    }

    location.href = "findPassword2.do?user_id=" + userId;
}
</script>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>findpassword</title>
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
            <span style="color: blue;"> 01. 아이디 입력</span> > 02. 본인 확인 &gt; 03. 비밀번호 재설정</h5>
        </div>
        <div class="total" >
            <h3 style="height: 4px; margin-right: 50%;">아이디</h3>
            <input type="text"  placeholder="아이디를 입력하세요" name="user_id" id="user_id" style="width: 50%;" >
            <span id="demo"></span> <br>   
        <button style="width: 30%;" type="button" onclick="idCheck()">조회</button>
        <hr>
         <button type="button" id="submitpass" onclick="memberCheck()">본인확인</button>
           
        
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