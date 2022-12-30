		let now = new Date();
	    let today = new Date(now.setDate(now.getDate()));
		// getTimezoneOffset()은 현재 시간과의 차이를 분 단위로 반환
		let timeOff = new Date().getTimezoneOffset()*60000; //분단위를 밀리초로 변환
		
		let nextWeek = new Date(today-timeOff).toISOString().split("T")[0];
		console.log(nextWeek);
		
		document.getElementById("date").setAttribute("min", nextWeek);
		
$(function(){
	let seat = $(".seatContainer .row label");
    seat.on("click", function(){
        $(this).toggleClass('check');
    });
})

function seat_check() {
 	let seat_count = $("input:checkbox[name=seat]:checked").length;
 	let people = $(".bottom .order .people");
 	let price = $(".bottom .order .price");
 	if(seat_count == 0){
 		$(".seatSelector .bottom").css("display", "none");
 	} else{
 		$(".seatSelector .bottom").css("display", "block");
 	}
    people.val(seat_count);
    price.val(seat_count * 10000);
}

