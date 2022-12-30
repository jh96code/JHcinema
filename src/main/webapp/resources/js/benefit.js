var swiper = new Swiper(".benefit-banner-slider", {
    navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
    },
    loop: true,
    pagination: {
        el: ".swiper-pagination",
        clickable: true,
    },
    autoplay: {
        delay: 3000,
    },
});

//탭메뉴 시작
let tap_btn01 = $("#benefit .title h2:nth-child(1)");
let tap_btn02 = $("#benefit .title h2:nth-child(2)");
let sale = $("#benefit #sale");
let club = $("#benefit #club");
$(tap_btn01).on("click", function(){
    $(this).addClass("view");
    sale.addClass("view");
    tap_btn02.removeClass("view");
    club.removeClass("view");
})
$(tap_btn02).on("click", function(){
    $(this).addClass("view");
    club.addClass("view");
    tap_btn01.removeClass("view");
    sale.removeClass("view");
})
//탭메뉴 끝

//펼쳐보기 시작
let sale_more_btn = $("#sale .more_btn");
let club_more_btn = $("#club .more_btn");
let sale_more_view = $("#sale .more_view");
let club_more_view = $("#club .more_view");
$(sale_more_btn).on("click", function(){
    $(this).css("display", "none");
    sale_more_view.css("display", "list-item");
})
$(club_more_btn).on("click", function(){
    $(this).css("display", "none");
    club_more_view.css("display", "list-item");
})
//펼쳐보기 끝