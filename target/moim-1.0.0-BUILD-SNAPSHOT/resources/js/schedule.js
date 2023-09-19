function Participant_UpdateOK(btn) {
    console.log("Participant_UpdateOK....");

    var numField = $(btn).closest('li').find('.PART_UPDATE_NUM');
    var num2Field = $(btn).closest('li').find('.PART_UPDATE_Participant');

    console.log(num2Field.val());
    var AlreadyCheck = num2Field.val().split("/");
    var UserCheck = $('.PART_UPDATE_USER_ID').val();
    for (var i = 0; i < AlreadyCheck.length; i++) {
        if (AlreadyCheck[i] == UserCheck) {
            console.log(AlreadyCheck[i]);
            alert("이미 참석하신 일정입니다.");
            return;
        }
    }

    $.ajax({
        url: "Participant_UpdateOK.do",
        data: {
            num: numField.val(),
            participant: num2Field.val(),
            user_id: $('.PART_UPDATE_USER_ID').val(),
        },
        method: 'POST',
        dataType: 'text',
        success: function(response) {
            console.log('ajax....success', response);
            location.href="join_schedule.do?somoim_num="+$('#somoim_num').val();
        },
        error: function(xhr, status, error) {
            console.log('xhr.status:', xhr.status);
        }
    });
}


function Participant_Cancle(btn){
    console.log("Participant_Cancle....");
    var num2Field = $(btn).closest('li').find('.PART_UPDATE_Participant');

    console.log(num2Field.val());
    var AlreadyCheck = num2Field.val().split("/");
    var UserCheck = $('.PART_UPDATE_USER_ID').val();
    var validParticipants = [];

    for (var i = 0; i < AlreadyCheck.length; i++) {
        if (AlreadyCheck[i] != UserCheck) {
            validParticipants.push(AlreadyCheck[i]);
        }
    }
    if (validParticipants.length == 0) {
        join_schedule_deleteOK();
        return; // End the function here to avoid further actions
    }

    var numField = $(btn).closest('li').find('.PART_UPDATE_NUM');
    var result = validParticipants.join('/');
    console.log(result); // This will output the new string joined with '/'

    var CheckMessage = confirm("참석을 취소하시겠습니까?");
    if (CheckMessage){
        $.ajax({
            url: "Participant_CancleOK.do",
            data: {
                num: numField.val(),
                participant: result,
            },
            method: 'POST',
            dataType: 'text',
            success: function(response) {
                console.log('ajax....success', response);
                location.href="join_schedule.do?somoim_num="+$('#somoim_num').val();
            },
            error: function(xhr, status, error) {
                console.log('xhr.status:', xhr.status);
            }
        });

    }else{

    }


}

function join_schedule_deleteOK() {
    console.log("join_schedule_deleteOK....");

    $.ajax({
        url: "join_schedule_deleteOK.do",
        data: {
            num: $('.PART_UPDATE_NUM').val(),
            somoim_num: $('#somoim_num').val(),

        },
        method: 'POST',
        dataType: 'text',
        success: function(response) {
            console.log('ajax....success', response);
            location.href="join_schedule.do?somoim_num="+$('#somoim_num').val();
        },
        error:function(xhr,status,error){
            console.log('xhr.status:', xhr.status);
        }
    });
}//end function()

function test_func() {


    $.ajax({
        url: "test_func.do",
        data: {
            num: $('.PART_UPDATE_NUM').val(),
            somoim_num: $('#somoim_num').val(),
            participant: $('.PART_UPDATE_Participant').val(),

        },
        method: 'POST',
        dataType: 'json',
        success: function(response) {
            console.log('ajax....success', response);
            location.href="join_schedule.do?somoim_num="+$('#somoim_num').val();

        },
        error:function(xhr,status,error){
            console.log('xhr.status:', xhr.status);
        }
    });
}//end function()