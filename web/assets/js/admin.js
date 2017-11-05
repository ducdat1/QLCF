/* 
 *  Document   : admin.js
 *  Created on : Nov 1, 2017
 *  Author     : DatND4
 */

jQuery(document).ready(function($){
//QL nhan vien
    //button add new
    $('.btn-nv').on('click', function(){
        $(this).hide(1000);
        $(this).parent().find('.addnew').show(1000);
        $(this).parent().find('.btn-close-nv').show(1000);
    });
    $('.btn-close-nv').on('click', function(){
        $(this).hide(1000);
        $(this).parent().find('.addnew').hide(1000);
        $(this).parent().find('.btn-nv').show(1000);
    });
    
    //QL thuc uong
    //show tab san pham - start
    $('.tabsp').click(function(){
        console.log("----------------");
        $(this).parent().find('.active').removeClass('active');
        $(this).addClass('active');
    });
    $('.coffee').click(function(){
        $(".tabs-content").children().addClass('inactive');
        $( ".content-sp" ).removeClass('inactive');
    });
    $('.snack').click(function(){
        $(".tabs-content").children().addClass('inactive');
        $( ".content-sp2" ).removeClass('inactive');
    });
    $('.others').click(function(){
        $(".tabs-content").children().addClass('inactive');
        $( ".content-sp3" ).removeClass('inactive');
    });
    $('.tea').click(function(){
        $(".tabs-content").children().addClass('inactive');
        $( ".content-sp1" ).removeClass('inactive');
    });
    //show tab san pham - end
});