$(function(){
    //탭메뉴 시작
    let tap_btn01 = $("#event .title h2:nth-child(1)");
    let tap_btn02 = $("#event .title h2:nth-child(2)");
    let event_ing = $("#event #event_ing");
    let event_end = $("#event #event_end");
    $(tap_btn01).on("click", function(){
        $(this).addClass("view");
        event_ing.addClass("view");
        tap_btn02.removeClass("view");
        event_end.removeClass("view");
    })
    $(tap_btn02).on("click", function(){
        $(this).addClass("view");
        event_end.addClass("view");
        tap_btn01.removeClass("view");
        event_ing.removeClass("view");
    })
    //탭메뉴 끝

    //펼쳐보기 시작
    let ing_more_btn = $("#event_ing .more_btn");
    let end_more_btn = $("#event_end .more_btn");
    let ing_more_view = $("#event_ing .more_view");
    let end_more_view = $("#event_end .more_view");
    $(ing_more_btn).on("click", function(){
        $(this).css("display", "none");
        ing_more_view.css("display", "list-item");
    })
    $(end_more_btn).on("click", function(){
        $(this).css("display", "none");
        end_more_view.css("display", "list-item");
    })
    //펼쳐보기 끝
})