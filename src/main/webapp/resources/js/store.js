$(function(){
    let tap_btns = $("#section02 ul.title");
    let tap_btn01 = $("#section02 ul.title li:nth-child(1)");
    let tap_btn02 = $("#section02 ul.title li:nth-child(2)");
    let tap_btn03 = $("#section02 ul.title li:nth-child(3)");
    let tap_box01 = $("#section02 .tap_box01").offset().top - 300;
    let tap_box02 = $("#section02 .tap_box02").offset().top - 300;
    let tap_box03 = $("#section02 .tap_box03").offset().top - 300;

    //스크롤시 탭메뉴의 타이틀이 바뀌는 효과
    $(window).scroll(function(){
        const top = $(this).scrollTop() + 100;
        console.log(top);
        if(top > 350){
            tap_btns.addClass("fixed");
        } else{
            tap_btns.removeClass("fixed");
        }

        if(top > tap_box01){
            $("#section02 ul.title li").removeClass("view");
            tap_btn01.addClass("view");
        }
        if(top >= tap_box02){
            $("#section02 ul.title li").removeClass("view");
            tap_btn02.addClass("view");
        }
        if(top > tap_box03){
            $("#section02 ul.title li").removeClass("view");
            tap_btn03.addClass("view");
        }
    })

    //탭메뉴 타이틀 클릭시 탭메뉴 영역으로 스크롤 이동
    $(tap_btn01).on("click", function(){
        $("html, body").animate({scrollTop : tap_box01}, 500);
    })
    $(tap_btn02).on("click", function(){
        $("html, body").animate({scrollTop : tap_box02}, 500);
    })
    $(tap_btn03).on("click", function(){
        $("html, body").animate({scrollTop : tap_box03}, 500);
    })
})