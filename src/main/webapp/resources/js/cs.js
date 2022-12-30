$(function(){
    //FAQ 상세내용 보기 
    $('.faq').click(function(){
        if($(".faq_reply").hasClass("view") === false){
            $(this).next($(".faq_reply")).addClass("view");
            $(this).find(".fas").css("rotate", "180deg");
        } else if($(this).next($(".faq_reply")).hasClass("view") === true){
            $(this).next($(".faq_reply")).removeClass("view");
            $(this).find(".fas").css("rotate", "0deg");
        } else{
            $(".faq_reply").removeClass("view");
            $(this).next($(".faq_reply")).addClass("view");
            $(".fas").css("rotate", "0deg")
            $(this).find(".fas").css("rotate", "180deg");
        }
    })

    //1:1문의 상세내용 보기 
    $('.contact').click(function(){
        if($(".contact_reply").hasClass("view") === false){
            $(this).next($(".contact_reply")).addClass("view");
        } else if($(this).next($(".contact_reply")).hasClass("view") === true){
            $(this).next($(".contact_reply")).removeClass("view");
        } else{
            $(".contact_reply").removeClass("view");
            $(this).next($(".contact_reply")).addClass("view");
        }
    })
})
