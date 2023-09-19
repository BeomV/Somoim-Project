$(document).ready(function() {
    $('#sch_insert_max_member').on('input change', function() {
        $('#range_text').text($(this).val() + '명');
    });

    $('.category_more a').click(function(event) {
        $('.category_more').hide();
        event.preventDefault();
        var listItems = [
            "운동", "야구관람", "게임/오락", "아웃도어", "반려동물", "문화/공연", "카페/맛집", "공예",
            "도서", "사진/영상", "사교/인맥", "음악/악기", "업종/직무", "해외/언어", "요리", "배이커리",
            "자유주제","자유주제"
        ];
        $.each(listItems, function(index, item) {
            var li = $('<li/>');
            var input = $('<input/>', {type: 'button', value: item});
            li.append(input);
            $('.board_grid').append(li);
        });
    });//End

    $(document).on('click', '.board_grid li input[type="button"]', function() {
        $(this).toggleClass('category_active'); // 현재 클릭한 버튼에 category_active 클래스를 토글(toggle)
        $('.board_grid li input[type="button"]').not(this).removeClass('category_active'); // 다른 버튼에서 category_active 클래스 제거
    });
});
