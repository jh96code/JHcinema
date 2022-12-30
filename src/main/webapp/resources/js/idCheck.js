function validate(){
           
            let id = document.idCheckForm.id;
            
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

			document.idCheckForm.submit();
}