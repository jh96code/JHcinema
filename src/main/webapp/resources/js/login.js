$(function(){
    let btn_noadmin = $("#login .tap-box .noadmin");
    let btn_admin = $("#login .tap-box .admin")
    let login_noadmin = $("#login .login-modal.login-noadmin")
    let login_admin = $("#login .login-modal.login-admin")
    $(btn_admin).click(function(){
        $(this).addClass("view");
        $(login_admin).css("display", "block");
        $(btn_noadmin).removeClass("view");
        $(login_noadmin).css("display", "none");
    })
    $(btn_noadmin).click(function(){
        $(this).addClass("view");
        $(login_noadmin).css("display", "block");
        $(btn_admin).removeClass("view");
        $(login_admin).css("display", "none");
    })
	
})

//아이디찾기(일반회원) 페이지 열기 
function idFind(){
	window.open("idFind", "", "width=450, height=350 left=700, top=300");
}

//비밀번호찾기(일반회원) 페이지 열기 
function pwFind(){
	window.open("pwFind", "", "width=450, height=350 left=700, top=300");
}