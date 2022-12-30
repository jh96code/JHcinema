$(function(){
    // 섹션1 슬라이드 시작
    var swiper = new Swiper(".movie-slider", {
        loop: true,
        slidesPerView: 4,
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
        autoplay: {
            delay: 2500,
            disableOnInteraction: false,
        },
    });
    // 섹션1 슬라이드 끝
})