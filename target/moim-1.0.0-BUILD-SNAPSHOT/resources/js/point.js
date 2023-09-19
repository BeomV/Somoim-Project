$(document).ready(function(){
    $('.point_list').show();
    $('.point_list2').hide();

    $(".point_category a").click(function(e){
        e.preventDefault();

        var showValue= $(this).text();

        console.log(showValue);

        if(showValue == '유료결제'){
            $('.point_list').show();
            $('.point_list2').hide();
        }else{
            $('.point_list').hide();
            $('.point_list2').show();
        }

        // 모든 a 태그에서 'point_acitve' 클래스를 제거
        $('.point_category a').removeClass('point_acitve');

        // 클릭된 a 태그에 'point_acitve' 클래스 추가
        $(this).addClass('point_acitve');
    });

    $('.point_list .purchase-btn').on('click', function() {
        var item = $(this).siblings('.point_item').val();
        var point = $(this).siblings('.point_cash').val();

        console.log(item,point);

        var check = confirm("구매를 희망하는 항목은 "+item+" 입니다."+"\n"+
            point+"원 결제하시겠습니까?");
        if (check == true){
            console.log('yes');

            kakaopay();
        }else{
            console.log('no');
        }
    });

    // purchase-btn을 클릭 했을 때의 이벤트 처리
    $('.point_list2 .purchase-btn').on('click', function() {
        var item = $(this).siblings('.point_item').val();
        var point = $(this).siblings('.point_point').val();

        console.log(item,point);

        var check = confirm("구매를 희망하는 항목은 "+item+" 입니다."+"\n"+
            point+"p"+" 결제하시겠습니까?");
        if (check == true){
            console.log('yes');

            $.ajax({
                url: "point_purchase.do",
                data: {
                    item: item,
                    point: point,
                },
                method: 'POST',
                dataType: 'text',
                success: function(response) {
                    console.log('ajax....success', response);
                    if(response === "fail") {
                        alert("보유하고 있는 포인트가 부족합니다.");
                        var check02 = confirm("카카오 페이로 결제하시겠습니까?");
                        if (check02 == true) {
                            kakaopay();
                        }
                    } else {
                        alert(item+" 구매를 성공하였습니다.");
                    }
                },
                error:function(xhr,status,error){
                    console.log('xhr.status:', xhr.status);
                }
            });
        }else{
            console.log('no');
        }
    });

});

function kakaopay() {
    $.ajax({
        url: "kakaopay.do",
        dataType: 'json',
        success: function(data) {
            var box = data.next_redirect_pc_url;
            window.open(box);
            console.log(data);

        },
        error:function(xhr,status,error){
            console.log('xhr.status:', xhr.status);
        }
    });
}
