$(function(){
    //탭메뉴 시작
    const tap_btn_all = $("#section02 ul.title li");
    let tap_btn01 = $("#section02 ul.title li:nth-child(1)");
    let tap_btn02 = $("#section02 ul.title li:nth-child(2)");
    let tap_btn03 = $("#section02 ul.title li:nth-child(3)");
    let tap_btn04 = $("#section02 ul.title li:nth-child(4)");
    const tap_box_all = $("#section02 .tap-box");
    let tap_box01 = $("#section02 .tap-box01");
    let tap_box02 = $("#section02 .tap-box02");
    let tap_box03 = $("#section02 .tap-box03");
    let tap_box04 = $("#section02 .tap-box04");
    $(tap_btn01).on("click", function(){
        tap_btn_all.removeClass("view");
        $(this).addClass("view");
        tap_box_all.removeClass("view");
        tap_box01.addClass("view");
    })
    $(tap_btn02).on("click", function(){
        tap_btn_all.removeClass("view");
        $(this).addClass("view");
        tap_box_all.removeClass("view");
        tap_box02.addClass("view");
    })
    $(tap_btn03).on("click", function(){
        tap_btn_all.removeClass("view");
        $(this).addClass("view");
        tap_box_all.removeClass("view");
        tap_box03.addClass("view");
    })
    $(tap_btn04).on("click", function(){
        tap_btn_all.removeClass("view");
        $(this).addClass("view");
        tap_box_all.removeClass("view");
        tap_box04.addClass("view");
    })
    //탭메뉴 끝

    //클릭시 팝업 시작
    let guide_btn01 = $("ul.guide li:nth-child(1)");
    let guide_btn02 = $("ul.guide li:nth-child(2)");
    let guide_btn03 = $("ul.guide li:nth-child(3)");
    let guide_bus = $(".guide_bus");
    let guide_car = $(".guide_car");
    let guide_map = $("#map");
    let guide_bg = $(".guide_bg");
    let guide_close = $(".close")

    tap_box01 + guide_btn01.on("click", function(){
        tap_box01 + guide_bus.addClass("view");
        tap_box01 + guide_bg.addClass("view");
        tap_box01 + guide_close.on("click", function(){
            tap_box01 + guide_bus.removeClass("view");
            tap_box01 + guide_bg.removeClass("view");
        })
    })
    tap_box01 + guide_btn02.on("click", function(){
        tap_box01 + guide_car.addClass("view");
        tap_box01 + guide_bg.addClass("view");
        tap_box01 + guide_close.on("click", function(){
            tap_box01 + guide_car.removeClass("view");
            tap_box01 + guide_bg.removeClass("view");
        })
    })
    tap_box01 + guide_btn03.on("click", function(){
        tap_box01 + guide_map.addClass("view");
        tap_box01 + guide_bg.addClass("view");
        tap_box01 + guide_close.on("click", function(){
            tap_box01 + guide_map.removeClass("view");
            tap_box01 + guide_bg.removeClass("view");
        })
    })

    tap_box02 + guide_btn01.on("click", function(){
        tap_box02 + guide_bus.addClass("view");
        tap_box02 + guide_bg.addClass("view");
        tap_box02 + guide_close.on("click", function(){
            tap_box02 + guide_bus.removeClass("view");
            tap_box02 + guide_bg.removeClass("view");
        })
    })
    tap_box02 + guide_btn02.on("click", function(){
        tap_box02 + guide_car.addClass("view");
        tap_box02 + guide_bg.addClass("view");
        tap_box02 + guide_close.on("click", function(){
            tap_box02 + guide_car.removeClass("view");
            tap_box02 + guide_bg.removeClass("view");
        })
    })

    tap_box03 + guide_btn01.on("click", function(){
        tap_box03 + guide_bus.addClass("view");
        tap_box03 + guide_bg.addClass("view");
        tap_box03 + guide_close.on("click", function(){
            tap_box03 + guide_bus.removeClass("view");
            tap_box03 + guide_bg.removeClass("view");
        })
    })
    tap_box03 + guide_btn02.on("click", function(){
        tap_box03 + guide_car.addClass("view");
        tap_box03 + guide_bg.addClass("view");
        tap_box03 + guide_close.on("click", function(){
            tap_box03 + guide_car.removeClass("view");
            tap_box03 + guide_bg.removeClass("view");
        })
    })

    tap_box04 + guide_btn01.on("click", function(){
        tap_box04 + guide_bus.addClass("view");
        tap_box04 + guide_bg.addClass("view");
        tap_box04 + guide_close.on("click", function(){
            tap_box04 + guide_bus.removeClass("view");
            tap_box04 + guide_bg.removeClass("view");
        })
    })
    tap_box04 + guide_btn02.on("click", function(){
        tap_box04 + guide_car.addClass("view");
        tap_box04 + guide_bg.addClass("view");
        tap_box04 + guide_close.on("click", function(){
            tap_box04 + guide_car.removeClass("view");
            tap_box04 + guide_bg.removeClass("view");
        })
    })
})
//카카오 주소 api 시작
var container01 = document.getElementById('map');
var options01 = {
    center: new kakao.maps.LatLng(35.18523292841043, 128.82850862322965),
    level: 3
};
var map01 = new kakao.maps.Map(container01, options01);
var markerPosition01  = new kakao.maps.LatLng(35.18522387802387, 128.82851116474401); 

// 마커를 생성합니다
var marker01 = new kakao.maps.Marker({
    position: markerPosition01
});

// 마커가 지도 위에 표시되도록 설정합니다
marker01.setMap(map01);

//카카오 주소 api끝