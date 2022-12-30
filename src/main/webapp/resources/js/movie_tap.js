$(function(){
    //탭메뉴 시작
    let tapbtn_showing = $("#section02 .head .title div:first-child");
    let tapbtn_coming = $("#section02 .head .title div:last-child");
    let addbtn_showing = $("#section02 .head .addBtn01");
    let addbtn_coming = $("#section02 .head .addBtn02");
    $(tapbtn_showing).on("click", function(){
        $(this).addClass("view");
        $("#showing").addClass("tap-view");
        tapbtn_coming.removeClass("view");
        $("#coming").removeClass("tap-view");
        addbtn_showing.addClass("view");
        addbtn_coming.removeClass("view");
    })
    $(tapbtn_coming).on("click", function(){
        $(this).addClass("view");
        $("#coming").addClass("tap-view");
        tapbtn_showing.removeClass("view");
        $("#showing").removeClass("tap-view");
        addbtn_coming.addClass("view");
        addbtn_showing.removeClass("view");
    })
    //탭메뉴 끝

    //펼쳐보기 시작
    let showing_btn = $("#showing .more-btn");
    let showing_more = $("#showing .more-view");
    $(showing_btn).on("click", function(){
        showing_more.css("display", "inline-block");
        $(this).css("display", "none");
    })

    let coming_btn = $("#coming .more-btn");
    let coming_more = $("#coming .more-view");
    $(coming_btn).on("click", function(){
        coming_more.css("display", "inline-block");
        $(this).css("display", "none");
    })
    //펼쳐보기 끝
})