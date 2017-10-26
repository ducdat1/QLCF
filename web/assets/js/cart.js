/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function() {
    $('.purchase').click(function() {
        $.ajax({
                url : '/QLCF/cart_servlet',
                data : {
                    idthucuong : $('#cart_order').val()
                },
                success : function(responseText) {
                    $('#Cart_quantity').text(responseText);
                }
        });
    });
    $('#Cart_empty').click(function() {
        console.log("-----------------");
        $.ajax({
                url : 'Muahang_servlet',
                data : {
                    cartempty : "delete"
                },
                success : function(responseText) {
                    $('#Cart_quantity').text(responseText);
                }
        });
    });    
});
