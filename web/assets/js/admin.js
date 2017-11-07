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
    
    $('.addrow').click(function(){
       Add(); 
    });
    function Add() {
        AddRow($(".txtName").val(), $(".txtCountry").val());
        $(".txtName").val("");
        $(".txtCountry").val("");
    };
 
    function AddRow(name, country) {
        //Get the reference of the Table's TBODY element.
        var tBody = $("#tblCustomers > TBODY")[0];

        //Add Row.
        row = tBody.insertRow(-1);

        //Add Name cell.
        var cell = $(row.insertCell(-1));
        cell.html(name);

        //Add Country cell.
        cell = $(row.insertCell(-1));
        cell.html(country);

        //Add Button cell.
        cell = $(row.insertCell(-1));
        var btnRemove = $("<input />");
        btnRemove.attr("type", "button");
        btnRemove.attr("onclick", "Remove(this);");
        btnRemove.val("Remove");
        cell.append(btnRemove);
    };

    function Remove(button) {
        //Determine the reference of the Row using the Button.
        var row = $(button).closest("TR");
        var name = $("TD", row).eq(0).html();
        if (confirm("Do you want to delete: " + name)) {

            //Get the reference of the Table.
            var table = $("#tblCustomers")[0];

            //Delete the Table row using it's Index.
            table.deleteRow(row[0].rowIndex);
        }
    };
});