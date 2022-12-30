let agree1 = document.addMemberForm.agree1;
        let agree2 = document.addMemberForm.agree2;
        let agree3 = document.addMemberForm.agree3;
        let agree_all = document.addMemberForm.agree_all;
        function validate(){
            //변수선언
            let id = document.addMemberForm.id;
            let password = document.addMemberForm.password;
            let password_confirm = document.addMemberForm.password_confirm;
            let name = document.addMemberForm.name;
            let gender = document.addMemberForm.gender;
            let year = document.addMemberForm.year;
            let month = document.addMemberForm.month;
            let day = document.addMemberForm.day;
            let phone = document.addMemberForm.phone;
            let address = document.addMemberForm.address;
            
            if (!id.value) { 
                alert("아이디를 입력해주세요.");
                id.focus();
                return false; 
            };

            if(id.value.length< 4 || id.value.length >20){
                alert("아이디는 4~20글자로 입력해주세요.");
                id.focus();
                return false;
            }

            if (!password.value) { 
                alert("비밀번호를 입력해주세요.");
                password.focus();
                return false; 
            };

            //비밀번호 영문자+숫자+특수조합(8~25자리 입력) 정규식
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
            if (document.addMemberForm.password.value != document.addMemberForm.password_confirm.value) {
				alert("비밀번호를 동일하게 입력하세요.");
				return false;
			}

            if (!name.value) { 
                alert("이름을 입력해주세요.");
                name.focus();
                return false; 
            };

            if (!gender.value) { 
                alert("성별을 클릭해주세요.");
                return false; 
            };

            if (!year.value, !month.value, !day.value) { 
                alert("생년월일을 입력해주세요.");
                year.focus();
                return false; 
            };

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

            if (!address.value) { 
                alert("주소를 입력해주세요.");
                address.focus();
                return false; 
            };

            if (!agree1.checked, !agree2.checked) { 
                alert("약관 동의 필수항목을 체크해주세요.");
                return false; 
            };
            
            document.addMemberForm.submit();
        }

		//id중복확인 페이지 열기 
        function idCheck(){
            window.open("id_check", "", "width=450, height=350 left=700, top=300");
        }

        $(function(){
            //약관동의 전체선택, 해제
            $(agree_all).on("click", function(){
                if($(this).is(":checked")){ 
                    $(agree1).prop("checked", true);
                    $(agree2).prop("checked", true);
                    $(agree3).prop("checked", true);
                }else{
                    $(agree1).prop("checked", false);
                    $(agree2).prop("checked", false);
                    $(agree3).prop("checked", false);
                }
            });

            //약관동의 모달창 열고 닫기
            let agree_btn01 = $(".agree-btn").get(0);
            let agree_btn02 = $(".agree-btn").get(1);
            let agree_modal01 = $(".agree_modal").get(0);
            let agree_modal02 = $(".agree_modal").get(1);
            let agree_close = $(".agree_modal .close");
            $(agree_btn01).on("click", function(){
                $(agree_modal01).css("display", "block");
                $(agree_close).on("click", function(){
                    $(agree_modal01).css("display", "none");
                })
            });

            $(agree_btn02).on("click", function(){
                $(agree_modal02).css("display", "block");
                $(agree_close).on("click", function(){
                    $(agree_modal02).css("display", "none");
                })
            });
        })

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