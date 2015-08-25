$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

  $('#delete').on("change", function(){
    $("#deleteform").show();
  })


//   var add1 = document.getElementById("add1");
//   var sub1 = document.getElementById("sub1");
//   var add2 = document.getElementById("add2");
//   var sub2 = document.getElementById("sub2");
//
// //////////
//   function Character(add1, sub1){
//     this.atk = function(){
//
//     };
//     this.armor = function(){
//
//     };
//   }

  // new Character()
///////////


  // NEED TO FIX
  // var btn = document.getElementById("uniq-btn");
  // var total = 15;
  // var a = 0;
  // var b = 0;
  // var max = 15
  // $('#a').html(a);
  // $('#b').html(b);
  // $('#total').html(total);
  //
  //
  // document.getElementById('add1').addEventListener('click', function () {
  //   if (total > 0 && a < max) {
  //     total--;
  //     a++;
  //     document.getElementById('ainput').innerHTML = a;
  //     document.getElementById('a').innerHTML = a;
  //     document.getElementById('total').innerHTML = total;
  //   }
  // });
  //
  // document.getElementById('sub1').addEventListener('click', function () {
  //   if (total < max && a > 0) {
  //     total++;
  //     a--;
  //     document.getElementById('ainput').innerHTML = a;
  //     document.getElementById('a').innerHTML = a;
  //     document.getElementById('total').innerHTML = total;
  //   }
  // });
  //
  // document.getElementById('add2').addEventListener('click', function () {
  //   if (total > 0 && b < max) {
  //     total--;
  //     b++;
  //     document.getElementById('binput').innerHTML = b;
  //     document.getElementById('b').innerHTML = b;
  //     document.getElementById('total').innerHTML = total;
  //   }
  // });
  //
  // document.getElementById('sub2').addEventListener('click', function () {
  //   if (total < max && b > 0) {
  //     b--;
  //     total++;
  //     document.getElementById('binput').innerHTML = b;
  //     document.getElementById('b').innerHTML = b;
  //     document.getElementById('total').innerHTML = total;
  //   }
  // });
  //
  // btn.addEventListener('click', function(){
  //   document.getElementById('ainput').value = document.getElementById('a').innerHTML;
  //   document.getElementById('binput').value = document.getElementById('b').innerHTML;
  //
  // })


});
