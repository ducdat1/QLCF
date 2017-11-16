/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function() {
    $('.purchase').click(function() {
        var idtu = $(this).find('.cart_order').val();
        $.ajax({
                url : '/QLCF/cart_servlet',
                data : {
                    idthucuong : idtu
                },
                success : function(responseText) {
                    $('#Cart_quantity').text(responseText);
                }
        });
    });
    $('.Cart_empty').click(function() {
        $.ajax({
            type : "POST",
            url : '/QLCF/cart_servlet',
            data : {
                cartempty : "delete"
            },
            success : function(responseText) {
                $('#Cart_quantity').text(responseText);
            }
        });
    });  
    $('.back-cart').click(function() {
        console.log("--------------");
       window.history.back();
    });  
});
