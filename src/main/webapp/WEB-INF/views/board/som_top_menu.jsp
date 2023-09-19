<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<div class="join_gnb">
    <input type="hidden" value="${user_id}" id="login_user_id">
    <input type="hidden" value="${vo2.num}">
    <li><a href="som_selectOne.do?num=${num}">홈</a></li>
    <li><a href="join_selectAll.do?somoim_num=${num}&pageNo=1&pageSize=5">게시판</a></li>
    <li><a href="join_gallery.do?somoim_num=${num}&pageNo=1&pageSize=5">갤러리</a></li>
    <li><a href="join_schedule.do?somoim_num=${num}&pageNo=1&pageSize=5">일정</a></li>
    <li><a href="join_pay.do?somoim_num=${num}&pageNo=1&pageSize=5">정산</a></li>
    <input type="hidden" value="${num}" id="Board_num">



</div>
