<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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


    <script
            src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script type="text/javascript">

        $(function() {
            $("input[name='category']").on('click', function() {
                console.log("onload...");
                var category = $(this).val();
                console.log($(this).val());
                $.ajax({
                    url : 'somz_selectAll.do',
                    method:'GET',
                    data : {
                        'category':category
                    },
                    success : function(data){
                        console.log('category', category);
                        console.log('data', data);

                        $('body').html(data);
                        $('.paging').hide();
                    },
                    error : function(xhr, status, error){
                        console.log('xhr.status : ', xhr.status);
                    }



                });//end ajax
            });//end click

            $("input[id='searchbutton']").on('click', function(){
            	console.log('클릭 감지!');
            	$('.paging').hide();
            });//end click

        });//end ready


        // 	function som_searchList(){



        // 	}

        function selChange() {
    		var sel = document.getElementById('cntPerPage').value;
    		location.href="som_selectAll.do?nowPage=${paging.nowPage}&cntPerPage="+sel;
    	}


    </script>

</head>
<body>
<jsp:include page="../top_menu.jsp"></jsp:include>



<div class="board_section">
    <div class="board_category">
        <ul class="board_grid">
            <li><input type="button" name="category" value="여행" class="category_active"></li>
            <li><input type="button" name="category" value="운동"></li>
            <li><input type="button" name="category" value="야구"></li>
            <li><input type="button" name="category" value="게임/오락"></li>
            <li><input type="button" name="category" value="아웃도어"></li>
            <li><input type="button" name="category" value="반려동물"></li>
            <li><input type="button" name="category" value="문화/공연"></li>
            <li><input type="button" name="category" value="카페/맛집"></li>
            <li><input type="button" name="category" value="공예"></li>
            <li><input type="button" name="category" value="독서"></li>
            <li><input type="button" name="category" value="사진/영상"></li>
            <li><input type="button" name="category" value="사교/인맥"></li>
            <li><input type="button" name="category" value="음악/악기"></li>
            <li><input type="button" name="category" value="업종/직무"></li>
            <li><input type="button" name="category" value="해외/언어"></li>
            <li><input type="button" name="category" value="요리"></li>
            <li><input type="button" name="category" value="베이커리"></li>
            <li><input type="button" name="category" value="자유주제"></li>


        </ul>
    </div>

</div>

    <div class="rec_list" style="width: 1440px;">
        <div class="rec_list_top" style="width:1440px; ">
            <h1>🔥 신규 모임 리스트 🔥</h1>
            <c:if test="${user_id ne null}">
            <a href="som_insert.do"><button type="button" id="som_insert-btn">모임 만들기</button></a>
            </c:if>
        </div>
        <ul class="rec_list_grid" style="width: 1440px;" >
            <c:forEach var="vo" items="${vos}" end="3">
                <li >
                    <a href="som_selectOne.do?num=${vo.num}">
                        <input type="hidden" value="${vo.num}">
                        <input type="hidden" value="${vo.create_date}">
                        <div class="moim_img">
                            <div class="img_box">
                                <img src="resources/uploadimg/${vo.somoim_img}"></div>
                            <span>
									<p class="hashtag">${vo.category}</p>
									<h1>${vo.som_title}</h1>
									<p class="sub_tit"> 소셜링 ${vo.area} ${vo.create_date }</p>
								</span>

                        </div>
                    </a>
                </li>
            </c:forEach>


        </ul>


    <div class="board_list" style="margin-top: 1%;width: 1440px;"  >
        <select style="float :right; margin-right: 14%;" id="cntPerPage" name="sel" onchange="selChange()">
            <option value="12"
                    <c:if test="${paging.cntPerPage == 12}">selected</c:if>>간략하게 볼래요</option>
            <option value="20"
                    <c:if test="${paging.cntPerPage == 20}">selected</c:if>>많이 볼래요</option>
        </select>

        <form action="som_searchList.do">
            <div class="board_list_category_detail" style="margin-bottom: 1%;">
<!--                 <a href="som_selectAll.do?category=all"><button type="button" class="list_active" name="all">전체</button></a> -->
                <!-- 				<a href="som_selectAll.do?category=local"><button type="button" name="local">국내여행</button></a> -->
                <!-- 				<a href="som_selectAll.do?category=foreign"><button type="button" name="foreign">해외여행</button></a>-->
                <select name="searchKey">
                    <option>소모임 이름</option>
                    <option>지역</option>
                </select>
                <input type="text" placeholder="검색" id="board_search" name="searchWord">
                <input type="hidden" name="category" value=${param.category }>
                <input type="submit" value="검색" id="searchbutton">
            </div>
        </form>



        <div class="list_selectAll" style=" width: 1440px;">
            <ul class="list_grid" >
                <c:forEach var="vo" items="${viewAll}">
                    <c:if test="${vo.category eq param.category }">
                        <li style="border: 1px solid lightgray; border-radius: 5%; text-align: center; display: flex; justify-content: center; align-items: center;">
                            <a href="som_selectOne.do?num=${vo.num}">
                                <input type="hidden" value="${vo.num}">
                                <input type="hidden" value="${vo.create_date}">
                                <input type="hidden" value="${vo.category}">
                                <div class="moim_img" >
                                    <div class="img_box">
                                        <img src="resources/uploadimg/${vo.somoim_img}"></div>
                                    <span>
									<h1>${vo.som_title}</h1>
									<p class="sub_tit">소셜링 📌 ${vo.area}</p>
									<p class="sub_tit">⏱ ${vo.create_date }</p>
								</span>

                                </div>
                            </a>
                        </li>
                    </c:if>


                    <c:if test="${param.category eq null}">
                        <li style="border: 1px solid lightgray; border-radius: 5%; text-align: center; display: flex; justify-content: center; align-items: center;">
                            <a href="som_selectOne.do?num=${vo.num}">
                                <input type="hidden" value="${vo.num}">
                                <input type="hidden" value="${vo.create_date}">
                                <input type="hidden" value="${vo.category}">
                                <div class="moim_img">
                                    <div class="img_box">
                                        <img src="resources/uploadimg/${vo.somoim_img}"></div>
                                    <div style="width: 100%;">
                                    <span>
									<h1>${vo.som_title}</h1>
									<p class="sub_tit">소셜링 📌 ${vo.area}</p>
									<p class="sub_tit">⏱ ${vo.create_date }</p>
								    </span>
                                    </div>
                                </div>
                            </a>
                        </li>
                    </c:if>
                    <c:if test="${param.category eq ''}">
                        <li>
                            <a href="som_selectOne.do?num=${vo.num}">
                                <input type="hidden" value="${vo.num}">
                                <input type="hidden" value="${vo.create_date}">
                                <input type="hidden" value="${vo.category}">
                                <div class="moim_img">
                                    <div class="img_box">
                                        <img src="resources/uploadimg/${vo.somoim_img}"></div>
                                    <span>
									<h1>${vo.som_title}</h1>
									<p class="sub_tit">소셜링 📌 ${vo.area}</p>
									<p class="sub_tit">⏱ ${vo.create_date }</p>
								</span>

                                </div>
                            </a>
                        </li>
                    </c:if>
                </c:forEach>




            </ul>

				
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
<script src="resources/js/board.js"></script>
</html>