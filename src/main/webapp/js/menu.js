$('.navbar-menu > li').mouseenter(function(){
    let menu_i = $(this).index();
    
    if(menu_i < 4) {
        $('.menu-pan').css({
            display:'none'
        }).eq($(this).index()).css({
            display:'block'
        })
    }
});
$('.navbar-menu > li').mouseleave(function(){
    let menu_i = $(this).index();

    if(menu_i < 4) {
        $('menu_pan').eq($(this).index()).css({
            display:'none'
        })
    }
});
$('.menu-pan').mouseenter(function(){
    $('.menu-pan').eq($(this).index()).css({
        display:'none'
    })
});
$('.menu-pan').mouseleave(function(){
    let menu_i = $(this).index();
    
    if(menu_i < 4) {
        $('.menu-pan').css({
            display:'none'
        }).eq($(this).index()).css({
            display:'none'
        })
    }
});