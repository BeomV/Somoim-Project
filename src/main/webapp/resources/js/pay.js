$(document).ready(function() {
    var userId = $('#login_user_id').val();
    console.log(userId);

    $('.participant_mine').each(function() {
        var participantName = $(this).val();

        if (participantName === userId) {
            var $this = $(this);
            $this.closest('li').css('border', '2px solid #1785F2');
            $this.closest('ul').prepend($this.closest('li'));
        }
    });
});


function schedule_payment(btn) {
    console.log("schedule_payment....");

    console.log($('#login_user_id').val());
    console.log($('#Board_num').val());

    $.ajax({
        url: "schedule_payment.do",
        data: {
            num: $('#pay_num').val(),
            som_member_num: $('#pay_som_num').val(),
            user_id: $('#login_user_id').val(),
            somoim_num: $('#Board_num').val()

        },
        method: 'POST',
        dataType: 'JSON',
        success: function(response) {
            console.log('ajax....success', response);


        },
        error:function(xhr,status,error){
            console.log('xhr.status:', xhr.status);
        }
    });
}//end function()
