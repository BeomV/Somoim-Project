<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/min.css">
    <link rel="stylesheet" href="resources/css/myfeed.css">
    <link rel="stylesheet" href="resources/css/mypage_myactivity.css">
    <link rel="stylesheet" href="resources/css/board.css">
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://kit.fontawesome.com/1652357a48.js" crossorigin="anonymous"></script>
    
    <script type="text/javascript">
    $(function(){
    	console.log('onload....');
    	$.ajax({
    		url : 'Rest_mypage_myactivity_good.do',
    		data : {
    			user_id:'${param.user_id}'
    		},
        	success : function(vos) {
        		console.log('ajax successed.....', vos);
        		
       			let mypage_good = '';
        		$.each(vos, function(index, vo) {
        			console.log(index,vo);
        			
        			mypage_good += `
        				<div class="mypage_myactivity_imgbox">
        				<ul class="mypage_myactivity_img_grid">
                        <li><img src="resources/uploadimg/\${vo.save_img}" style="width:400px; height:400px;"></li>
                        </ul>
                        </div>
        			
        			`;
        			
        		});
        		
        		$("#areamypage").html(mypage_good);
        		
        	},
        	error : function(xhr, status, error){
        		console.log('xhr.status : ', xhr.status);
        	}
    	});
    });
    
    
    </script>
</head>
<body>
<jsp:include page="../top_menu.jsp"></jsp:include>
<div class="header">
        
    <div class="mypage_myactivity_group_menu">
        <ul>
       <li><a href="Mypage_myactivity_boardbyme.do?user_id=${user_id }">내가 쓴 글</a></li>
       <li><a href="Mypage_myactivity_communitybyme.do?user_id=${user_id }">내가 쓴 커뮤니티</a></li>
				<li><a href="Mypage_myactivity_commbyme.do?user_id=${user_id }">내가 쓴 댓글</a></li>
				<li><a href="mypage_myactivity_good.do?user_id=${user_id }">좋아요 사진</a></li>
				<li><a href="Mypage_myactivity_likedboard.do?user_id=${user_id }">좋아요 게시글</a></li>
        </ul>
    </div>
    <div id="areamypage">        
<!--         <div class="mypage_myactivity_imgbox"> -->
<!--             <ul class="mypage_myactivity_img_grid"> -->
<!--                 <li>이미지 1</li> -->
<!--                 <li>이미지 2</li> -->
<!--                 <li>이미지 3</li> -->
<!--                 <li>이미지 4</li> -->
<!--                 <li>이미지 5</li> -->
<!--                 <li>이미지 5</li> -->
<!--                 <li>이미지 5</li> -->
<!--                 <li>이미지 5</li> -->
<!--                 <li>이미지 5</li> -->

<!--             </ul> -->

<!--         </div> -->
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