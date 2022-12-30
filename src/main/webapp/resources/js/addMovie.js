function validate(){
	//변수선언
	let title = document.addMovieForm.title;
	let category = document.addMovieForm.category;
	let country = document.addMovieForm.country;
	let director = document.addMovieForm.director;
	let actor = document.addMovieForm.actor;
	let movieTime = document.addMovieForm.movieTime;
	let openDate = document.addMovieForm.openDate;
	let file = document.addMovieForm.file;
	let content = document.addMovieForm.content;

	if (!title.value) { 
		alert("영화제목을 입력해주세요.");
		title.focus();
		return false; 
	};
	
	if (category.value == "default") { 
		alert("영화 장르를 선택해주세요.");
		return false; 
	};
	
	if (country.value == "default") { 
		alert("개봉 국가를 선택해주세요.");
		return false; 
	};
	
	if (!director.value) { 
		alert("감독을 입력해주세요");
		director.focus();
		return false; 
	};
	
	if (!actor.value) { 
		alert("출연진을 입력해주세요");
		actor.focus();
		return false; 
	};
	
	if (!movieTime.value) { 
		alert("영상시간을 입력해주세요");
		movieTime.focus();
		return false; 
	};
	
	//상영시간은 숫자만 입력하는 정규식
    var timeCheck = /^[0-9]+/g; 
    if (!timeCheck.test(movieTime.value)) {
	    alert("상영시간은 숫자만 입력해주세요.");
	    movieTime.focus();
	    return false;
    }
	
	if (!openDate.value) { 
		alert("영화 개봉일을 입력해주세요.");
		openDate.focus();
		return false; 
	};
	
	if (!file.value) { 
		alert("영화 이미지를 등록해주세요.");
		return false; 
	};
	
	if (!content.value) { 
		alert("영화 줄거리를 입력해주세요.");
		content.focus();
		return false; 
	};

	document.addMovieForm.submit();
}

