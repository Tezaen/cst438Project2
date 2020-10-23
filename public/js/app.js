// App js to do calculations in the products

$(document).ready(function(){
  //Variables 
  var tax1 = 0.0925;
  var reload = 100;
  
  $('.quantity input').change( function() {
    newQuantity(this);
  });
  
  //Calculations
  function calculate(){
    var subtotal = 0;
    
    $('.products').each(function () {
      subtotal += parseFloat($(this).children('.updatedPrice').text());
    });
    
    //Taxes
    var taxes = subtotal * tax1;
    //Total
    var total = subtotal + taxes;
    
    //Display totals
    $('.totals').fadeOut(reload, function() {
      $('#updatedSubtotal').html(`$ ${subtotal.toFixed(2)}`);
      $('#updatedTax').html(`$ ${taxes.toFixed(2)}`);
      $('#updatedTotal').html(`$ ${total.toFixed(2)}`);
      $('.totals').fadeIn(reload);
    });
  }
  
  //Update the user quantity products
  function newQuantity(userQuantity) {
    var updateProducts = $(userQuantity).parent().parent();
    var price = parseFloat(updateProducts.children('.price').text());
    var quantity = $(userQuantity).val();
    var individualPrice = price * quantity;
    
    updateProducts.children('.updatedPrice').each(function () {
      $(this).fadeOut(reload, function() {
        $(this).text(individualPrice.toFixed(2));
        calculate();
        $(this).fadeIn(reload);
      });
    });  
  }
  
  //Shows popup when click button
  $('.checkout').click(function(){
    alert('Thank you for shopping with us!');
    $('.check').submit();
  });

})//ready

/*
References:
https://codepen.io/justinklemm/pen/zAdoJ
*/