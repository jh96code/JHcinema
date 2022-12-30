function validate_idFind(){
            //변수선언
            let name = document.idFindForm.name;
            let phone = document.idFindForm.phone;

            if (!name.value) { 
                alert("이름을 입력해주세요.");
                name.focus();
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
            
            document.idFindForm.submit();
        }
        
function validate_pwFind(){
            //변수선언
            let id = document.pwFindForm.id;
            let name = document.pwFindForm.name;
            
            if (!id.value) { 
                alert("아이디를 입력해주세요.");
                id.focus();
                return false; 
            };

            if (!name.value) { 
                alert("이름을 입력해주세요.");
                name.focus();
                return false; 
            };
        
            document.pwFindForm.submit();
       	}
       	
function close(){
	window.close();
}