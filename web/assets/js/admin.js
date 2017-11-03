/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
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
});