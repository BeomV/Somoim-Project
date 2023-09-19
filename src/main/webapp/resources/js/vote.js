$(document).ready(function() {


    var globalCurrentNum;

    function setCurrentNum(num) {
        globalCurrentNum = num;
    }

    function vote_items(current_num) {
        $('.vote_items').each(function() {
            var voteItem = $(this).val();

            $.ajax({
                url: "choice_insertOK.do",
                data: {
                    som_qvote_num: current_num,
                    choice: voteItem,
                    somoim_num: $('#insert_num').val()
                },
                method: 'POST',
                dataType: 'text',
                success: function(response) {
                    console.log('ajax....success', response);
                },
                error: function(xhr) {
                    console.log('xhr.status:', xhr.status);
                }
            });
        });
    }

    $("#vote_link").click(function(e) {
        e.preventDefault();

        var voteSection =
            '<div contenteditable="false" class="vote_div">' +
            '<div class="vote_section">' +
            '<div class="vote_detail_seciton">' +
            '<h2>투표 제목</h2>' +
            '<input type="text" placeholder="투표 제목을 입력하세요" class="vote_title">' +
            '<ul class="vote_grid">' +
            '<li>' +
            '<button type="button">' +
            '<input type="text" placeholder="투표 항목" class="vote_items">' +
            '</button>' +
            '</li>' +
            '<li>' +
            '<button type="button">' +
            '<input type="text" placeholder="투표 항목" class="vote_items">' +
            '</button>' +
            '</li>' +
            '</ul>' +
            '</div>' +
            '<div class="vote_function">' +
            '<span class="vote_function_class">' +
            '<a id="add_votetable">항목 추가</a>' +
            '<a id="delete_votetable">투표 삭제</a>' +
            '</span>' +
            '<button type="button" id="make_vote">투표 만들기</button>' +
            '</div>' +
            '</div>' +
            '</div>';

        $("#insert_content").append(voteSection);
    });

    $("#insert_content").on('click', '#delete_votetable', function(e) {
        e.preventDefault();
        $(".vote_section").remove();
        setCurrentNum(null);
    });

    $("#insert_content").on('click', '#add_votetable', function(e) {
        e.preventDefault();
        $(".vote_grid").append('<li><button type="button"><input type="text" placeholder="투표 항목" class="vote_items"></button></li>');
    });

    $("#insert_content").on('click', '#make_vote', function(e) {
        e.preventDefault();

        var user_id = $('#insert_id').val();
        var vote_title = $('.vote_title').val();
        var somoim_num = $('#insert_num').val();

        $.ajax({
            url: "vote_insertOK.do",
            data: {
                user_id: user_id,
                question: vote_title,
                somoim_num: somoim_num
            },
            method: 'POST',
            dataType: 'text',
            success: function(response) {
                setCurrentNum(response.valueOf());
                vote_items(response.valueOf());
                alert("투표가 등록되었습니다.");
            },
            error: function(xhr) {
                console.log('xhr.status:', xhr.status);
            }
        });
    });

    $('#join_insertOK').click(function(e) {
        e.preventDefault();



        console.log($('#insert_num').val());
        console.log($('#insert_id').val());
        console.log($('#insert_title').val());
        console.log($('#insert_content').html());
        console.log($('vote_num').val());

        var formData = new FormData();
        formData.append('user_id', $('#insert_id').val());
        formData.append('somoim_num', $('#insert_num').val());
        formData.append('title', $('#insert_title').val());
        var contentHtml = $('#insert_content').clone();
        contentHtml.find('.vote_div').remove();
        formData.append('content', contentHtml.html());

        if (globalCurrentNum != null) {
            formData.append('vote_num', globalCurrentNum);
        }

        var fileInput = $('#insert_imageUpload')[0];
        if (fileInput.files.length > 0) {
            formData.append('file', fileInput.files[0]);
        }



        $.ajax({
            url: "join_insertOK.do",
            data: formData,
            method: 'POST',
            processData: false,
            contentType: false,
            dataType: 'text',
            success: function() {
                location.href="join_selectAll.do?somoim_num="+$('#insert_num').val();
            },
            error: function(xhr) {
                console.log('xhr.status:', xhr.status);
            }
        });
    });







});
