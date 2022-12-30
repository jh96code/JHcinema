function addFAQ(){
	//변수선언
	let category = document.addFAQForm.category;
	let title = document.addFAQForm.title;
	let content = document.addFAQForm.content;

	if (category.value == "default") { 
		alert("구분 유형을 선택해주세요.");
		return false; 
	};

	if (!title.value) { 
		alert("질문 제목을 입력해주세요.");
		title.focus();
		return false; 
	};
	
	if (!content.value) { 
		alert("답변 내용을 입력해주세요.");
		content.focus();
		return false; 
	};

	document.addFAQForm.submit();
}

function addNotice(){
	//변수선언
	let title = document.addNoticeForm.title;
	let content = document.addNoticeForm.content;

	if (!title.value) { 
		alert("공지사항 제목을 입력해주세요.");
		title.focus();
		return false; 
	};
	
	if (!content.value) { 
		alert("공지사항 내용을 입력해주세요.");
		content.focus();
		return false; 
	};

	document.addNoticeForm.submit();
}

function addContact(){
	//변수선언
	let category = document.addContactForm.category;
	let title = document.addContactForm.title;
	let content = document.addContactForm.content;

	if (category.value == "default") { 
		alert("문의 유형을 선택해주세요.");
		return false; 
	};

	if (!title.value) { 
		alert("공지사항 제목을 입력해주세요.");
		title.focus();
		return false; 
	};
	
	if (!content.value) { 
		alert("공지사항 내용을 입력해주세요.");
		content.focus();
		return false; 
	};

	document.addContactForm.submit();
}

