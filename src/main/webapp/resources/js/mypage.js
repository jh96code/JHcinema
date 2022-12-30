//다음 주소찾기 코드
function findAddr() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailAddress").focus();
        }
    }).open();
}

function validate(){
    //변수선언
    let password = document.updateMemberForm.password;
    let password_confirm = document.updateMemberForm.password_confirm;
    let phone = document.updateMemberForm.phone;
    let address = document.updateMemberForm.address;
    let detailAddress = document.updateMemberForm.detailAddress;
    
    if (!password.value) { 
        alert("비밀번호를 입력해주세요.");
        password.focus();
        return false; 
    };

    //비밀번호 영문자+숫자+특수조합(8~20자리 입력) 정규식
    var pwCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/;
    if (!pwCheck.test(password.value)) {
        alert("비밀번호는 영문자+숫자+특수문자 \n조합으로 8~20자리를 입력해주세요.");
        password.focus();
        return false;
    };

    if (!password_confirm.value) { 
        alert("비밀번호를 한 번더 입력해주세요.");
        password_confirm.focus();
        return false; 
    };

    //비밀번호와 비밀번호확인란 동일한지 검사
    if (password.value != password_confirm.value) {
        alert("비밀번호를 동일하게 입력하세요.");
        return false;
    }

    if (!phone.value) { 
        alert("전화번호를 입력해주세요.");
        phone.focus();
        return false; 
    };

    //전화번호는 숫자만 입력하는 정규식
    var phoneCheck = /^[0-9]+/g; 
    if (!phoneCheck.test(phone.value)) {
        alert("전화번호는 숫자만 입력해주세요.");
        phone.focus();
        return false;
    }

    if (!detailAddress.value && !address.value) { 
        alert("주소를 입력해주세요.");
        detailAddress.focus();
        return false; 
    };
    
    document.updateMemberForm.submit();
}

//탭메뉴 시작
let tap_btn01 = $("#mypage .tap_box .left ul.tap_btn li:nth-child(1)");
let tap_btn02 = $("#mypage .tap_box .left ul.tap_btn li:nth-child(2)");
let tap_box = $("#mypage .tap_box .right");
let user_info = $("#mypage .tap_box .right .user_info");
let ticketing_info = $("#mypage .tap_box .right .ticketing_info");
$(tap_btn01).on("click", function(){
    $(this).addClass("view");
    $(tap_box).addClass("view");
    $(user_info).css("display", "block");
    $(tap_btn02).removeClass("view");
    $(ticketing_info).css("display", "none");
});
$(tap_btn02).on("click", function(){
    $(this).addClass("view");
    $(tap_box).addClass("view");
    $(ticketing_info).css("display", "block");
    $(tap_btn01).removeClass("view");
    $(user_info).css("display", "none");
})
//탭메뉴 끝

//회원탈퇴
function deleteMember(){
    if (confirm("회원탈퇴를 하시겠습니까?")){
		location.href="deleteMember";
	}
}

