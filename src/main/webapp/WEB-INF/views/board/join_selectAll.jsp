<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/min.css">
    <link rel="stylesheet" href="resources/css/style.css">
    <link rel="stylesheet" href="resources/css/board.css">
    <link rel="stylesheet" href="resources/css/board_min.css">
    <script src="https://kit.fontawesome.com/1652357a48.js" crossorigin="anonymous"></script>
    <title>Document</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        var currentPage = 1; // 시작 페이지 번호
        var itemsPerPage = 3; // 표시 항목 수

        $(".more_but").click(function () {
            currentPage++; // 페이지 번호 증가
            loadMoreItems();
        });

        function loadMoreItems() {
            var somoim_num = "${param.somoim_num}";
            var url = "/json_join_selectAll.do?somoim_num=" + somoim_num;
            $.ajax({
                url: url, // json 목록 가져오기
                method: "GET",
                data: { page: currentPage, itemsPerPage: itemsPerPage },
                dataType: "json",
                success: function (response) {
                    console.log("ajax on");
                    console.log("response", response);
                    //불러온 항목 처리 및 가공, 출력(html에 추가)
                    var items = response;
                    var html = "";
                    var startIndex = (currentPage - 1) * itemsPerPage;
                    var endIndex = startIndex + itemsPerPage;

                    if (startIndex >= items.length) {
                        // 요청한 페이지에 추가 항목이 없는 경우
                        $(".more_but").hide();
                        alert("모든 게시글을 표시했습니다!");

                        return;
                    }

                    if (endIndex > items.length) {
                        // 마지막 페이지에서 아이템의 인덱스 조정
                        endIndex = items.length;
                    }

                    for (var i = startIndex; i < endIndex; i++) {
                        var vo = items[i];
                        console.log("vo[i]...{}", vo);
                        console.log("vouser_id...{}", vo.user_id);

                        // Unix timestamp를 Date 객체로 변환
                        const date = new Date(vo.write_date);

                        // 날짜를 한국 시간대로 변환하여 "yyyy.MM.dd" 형식으로 표시
                        const formattedDate = date.toLocaleString("ko-KR", {
                            timeZone: "Asia/Seoul",
                            year: "numeric",
                            month: "2-digit",
                            day: "2-digit",
                        });

                        html += '<li>';
                        html += '    <input type="hidden" value="' + vo.som_member_num + '">';
                        html += '    <a href="join_selectOne.do?num=' + vo.num + '">';
                        html += '        <input type="hidden" value="' + vo.somoim_num + '">';
                        html += '        <div class="join_top">';
                        html += '            <div class="user_info">';
                        html += '                <div class="profile">';
                        html += '                    <img style="object-fit: cover; width: 100%; height: 100%; border-radius: 50%;" src="resources/uploadimg/' + vo.save_name + '">';
                        html += '                </div>';
                        html += '                <span>';
                        html += '                    <strong>' + vo.user_id + '</strong>  <div><i style="color: red" class="far fa-heart">' + vo.good_count + '</i></div>';
                        html += '                    <p>' + formattedDate + '</p>'; // 변환된 날짜 출력
                        html += '                </span>';
                        html += '            </div>';
                        html += '            <div class="bbs_func">';
                        <%--if (vo.user_id === ${user_id}) {--%>
                        html += '                <button type="button">';
                        html += '                    <a href="join_update.do?num=' + vo.num + '"><i class="fas fa-edit"></i></a>';
                        html += '                </button>';
                        html += '                <button type="button">';
                        html += '                    <a href="join_deleteOK.do?num=' + vo.num + '&somoim_num=' + vo.somoim_num + '"><i class="fas fa-trash-alt"></i></a>';
                        html += '                </button>';
                        // }
                        html += '            </div>';
                        html += '        </div>';
                        html += '        <div class="content_text">';
                        html += '            <strong>제목: ' + vo.title + '</strong>';
                        html += '            <p>내용:<br>';
                        // if (vo.save_name != null) {
                        //     html += '                <img src="resources/uploadimg/' + vo.save_name + '">';
                        // }
                        html += '                <br>';
                        html += '                ' + vo.content + '</p>';
                        html += '        </div>';
                        html += '    </a>';
                        html += '</li>';
                    }

                    $(".loopAjax").append(html);
                },
                error: function (xhr, status, error) {
                    console.error(error);
                }
            });
        }
    });
</script>


<body>
<jsp:include page="../top_menu.jsp"></jsp:include>

<div class="join_section">
    <jsp:include page="./som_top_menu.jsp"></jsp:include>
    <div class="img_info">

        <img style="width: 100%;" src="resources/uploadimg/${somoim_top_pic.somoim_img}">

    </div>
    <div class="top_func">
        <button type="button"><a href="join_insert.do?somoim_img=${somoim_top_pic.somoim_img}" style="color: white">글쓰기</a></button>
    </div>
    <div class="view_content">
        <ul class="view_grid">
            <c:forEach var="dto" items="${dtos}">
            <li class="view_grid_li" style="padding-bottom: 50px; padding-right: 50px;">
                <input type="hidden" value="${dto.boardVo.som_member_num}">
                <a href="join_selectOne.do?num=${dto.boardVo.num}">
                    <input type="hidden" value="${dto.boardVo.somoim_num}">
                    <div class="join_top">
                        <div class="user_info">
                            <div class="profile">
                                <img style="object-fit: cover; width: 100%; height: 100%; border-radius: 50%;"
                                     src="resources/uploadimg/${dto.boardVo.save_name}">
                            </div>
                            <span>

                        <strong>${dto.boardVo.user_id}</strong>
                        <p>${dto.boardVo.write_date}</p>
                    </span>
                        </div>
                        <div class="bbs_func">

                            <c:if test="${dto.boardVo.user_id == user_id}">

                                <button type="button">
                                    <a href="join_update.do?num=${dto.boardVo.num}"><i class="fas fa-edit"></i></a>
                                </button>
                                <button type="button">

                                    <a href="join_deleteOK.do?num=${dto.boardVo.num}&somoim_num=${dto.boardVo.somoim_num}"><i
                                            class="fas fa-trash-alt"></i></a>
                                </button>
                            </c:if>

                        </div>
                    </div>

                    <div class="content_text">
                        <div class="content_text_title">
                            <strong>제목: ${dto.boardVo.title}</strong>
                            <p>내용:</p>
                        </div>
                        <c:if test="${dto.boardVo.save_image != null}">
                        <div class="content_img_box" style="text-align: center; ">
                            <img style="width: 40%; height: 30%;" src="resources/uploadimg/${dto.boardVo.save_image}">
                        </div>
                        </c:if>

                        <br>
                            ${dto.boardVo.content}
                        <br>
                </a>
                <c:forEach var="voteVo" items="${dto.voteVos}" varStatus="status">
                <div class="vote_div" style="padding-right: 30px; ">
                    <div class="vote_section">
                        <div class="vote_detail_seciton">
                            <h2 style="margin-bottom: 20px;">
                                <c:if test="${status.index == 0}">
                                    ${voteVo.question}<br>
                                </c:if>
                            </h2>
                            <ul class="vote_grid">
                                <li>

                                    <button type="button" onclick="test(this)" style="position: relative;">
                                        <input type="hidden" value="${voteVo.som_vote_user_id}" style="display: none;"
                                               class="som_vote_member">
                                        <input type="hidden" value="${voteVo.num}" id="voteVo_num"
                                               style="display: none;">
                                        <input type="text" class="vote_items" value="${voteVo.choice}" readonly/>
                                        <div class="vote_count_section">
                                            <strong style="text-align: right;">${voteVo.count}</strong>
                                        </div>

                                    </button>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </li>
                </c:forEach>
        </ul>
    </div>
</div>


    <div class="loopAjax">

    </div>



<div class="Join_Paging">

    <a href="<c:url value='join_selectAll.do'>
                <c:param name='somoim_num' value='${num}'/>
                <c:param name='pageNo' value='${(param.pageNo > 1) ? param.pageNo - 1 : param.pageNo}'/>

                <c:param name='pageSize' value='${empty param.pageSize ? 5 : param.pageSize}'/>
                </c:url>"><i class="fa-solid fa-angle-left"></i></a>



    <c:forEach var="i" begin="1" end="${totalPage}">
        <a href="<c:url value='join_selectAll.do'>
                    <c:param name='somoim_num' value='${num}'/>
                    <c:param name='pageNo' value='${i}'/>
                    <c:param name='pageSize' value='${empty param.pageSize ? 5 : param.pageSize}'/>
                    </c:url>">${i}</a>
    </c:forEach>



    <a href="<c:url value='join_selectAll.do'>
                <c:param name='somoim_num' value='${num}'/>
                <c:param name='pageNo' value='${(param.pageNo < totalPage) ? param.pageNo + 1 : param.pageNo}'/>
                <c:param name='pageSize' value='${empty param.pageSize ? 5 : param.pageSize}'/>
                </c:url>"><i class="fa-solid fa-angle-right"></i></a>

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
    var prevClickedButton = null;


    function test(buttonElement) {
        var userId = "${user_id}";
        console.log(userId);

        var voteItemValue = $(buttonElement).find('.vote_items').val();
        var voteVo_num = $(buttonElement).find('#voteVo_num').val();
        console.log(voteItemValue);
        console.log(voteVo_num);

        var VoteMember = $(buttonElement).find('.som_vote_member').val();
        console.log(VoteMember);

        // VoteMember를 '/'로 분할하고, userId가 있는지 확인
        var VoteMemberArray = VoteMember.split('/');
        if (VoteMemberArray.includes(userId)) {
            $.ajax({
                url: "vote_CancleOK.do",
                data: {
                    som_qvote_num: voteVo_num,
                    choice: voteItemValue,
                },
                method: 'POST',
                dataType: 'text',
                success: function (response) {
                    console.log('Success:', response);
                    location.reload();

                },
                error: function (xhr) {
                    ;
                    alert('Error occurred. Status: ' + xhr.status);
                }
            });
        } else {
            $.ajax({
                url: "vote_UpdateOK.do",
                data: {
                    som_qvote_num: voteVo_num,
                    choice: voteItemValue,
                },
                method: 'POST',
                dataType: 'text',
                success: function (response) {
                    console.log('Success:', response);
                    location.reload();

                },
                error: function (xhr) {
                    ;
                    alert('Error occurred. Status: ' + xhr.status);
                }
            });

        }
    }

    $(document).ready(function() {
        var userId = "${user_id}";

        // 모든 투표 항목을 순회
        $('.vote_items').each(function() {
            var buttonElement = $(this).parent(); // 현재 투표 항목의 부모 요소 (버튼 요소)를 선택
            var VoteMember = buttonElement.find('.som_vote_member').val();
            console.log("including member");

            // VoteMember를 '/'로 분할하고, userId가 있는지 확인
            var VoteMemberArray = VoteMember.split('/');
            if (VoteMemberArray.includes(userId)) {
                $(this).css('background-color', '#ccc'); // vote_items 요소의 배경색을 #ccc로 변경
            }
        });
    });
</script>


</html>