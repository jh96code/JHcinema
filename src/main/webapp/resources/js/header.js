$(function(){
    let popup_btn = $("header nav .menu .left i");
    let popup = $("header .menu-popup");
    let popup_bg = $("header .popup-bg");
    let popup_close = $("header .menu-popup .close");
    $(popup_btn).on("click", function(){
        popup.css("display", "block");
        popup_bg.css("display", "block");
    })
    $(popup_close).on("click", function(){
        popup.css("display", "none");
        popup_bg.css("display", "none");
    })
})

function logoutbtn() {
	if (!confirm('로그아웃하시겠습니까?')){}
	else{
		location.href="logout";
	}
}

function loginCheck() {
	alert("로그인을 해주세요.");
	location.href="login";
}