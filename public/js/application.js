$(document).ready(function() {
  checker();
});




  // $('#delete').on("change", function(){
  //   $("#deleteform").show();
  // })


//   var add1 = document.getElementById("add1");
//   var sub1 = document.getElementById("sub1");
//   var add2 = document.getElementById("add2");
//   var sub2 = document.getElementById("sub2");
//
// //////////

///////////
  //

  function SetInitialStats() {
    MAX = 15;
    this.total = 15;
    this.atk = 0;
    this.def = 0;
  }


  //how to invoke?????
  var checker = function() {
    var workThis = new SetInitialStats();
    //wrap all calls in here depending on action
    $('button').on('click', function(e) {
      var buttonName = $(this).attr("name");
      var buttonClass = $(this).attr("class")

      console.log(buttonName)

      console.log(e)

      //this represents button


      if ( buttonClass === "add") {
        console.log("i'm in the if add")

        //class add and compare name atk vs def (buttonName)
        if ( buttonName === "atk") {
          workThis.adjAtk(buttonName, 1);
        } else if ( buttonName === "def") {
          workThis.adjDef(buttonName, 1);
        }

      } else if ( buttonClass === "sub") {
        console.log("i'm in the else if sub")

        if ( buttonName === "atk") {
          workThis.adjAtk(buttonName, -1);
        } else if ( buttonName === "def") {
          workThis.adjDef(buttonName, -1);
        }
      };

    })
  }


  //where direction = -1 or 1
  SetInitialStats.prototype.checkTotal = function(direction) {
    return (this.total - direction <= MAX && this.total - direction >= 0);
  }

  SetInitialStats.prototype.checkAtk = function(direction) {
    return (this.atk + direction <= MAX && this.atk + direction >= 0);
  }

  SetInitialStats.prototype.checkDef = function(direction) {
    return (this.def + direction <= MAX && this.def + direction >= 0);
  }


  SetInitialStats.prototype.adjAtk = function(buttonName, direction) {
    // if both checks pass true
    console.log("i'm in adjAtk");

    if (this.checkTotal(direction) && this.checkAtk(direction)) {
      // change div#display-atk to display change depending on direction
      this.atk += parseInt(direction);
      this.total -= parseInt(direction);

      console.log("this is the atk:::::")
      console.log(this.atk)

      //put in adjusted number inside
      $("#display-" + buttonName).html(this.atk);
      $("div#total").html(this.total);
    };
  }


  SetInitialStats.prototype.adjDef = function(buttonName, direction) {
    console.log("i'm in adjDef");
    // if both checks pass true
    if (this.checkTotal(direction) && this.checkDef(direction)) {
      // change div#display-atk to display change depending on direction
      this.def += parseInt(direction);
      this.total -= parseInt(direction);

      console.log("this is the def:::::")
      console.log(this.def)

      //put in adjusted number inside
      $("#display-" + buttonName).html(this.def);
      $("div#total").html(this.total);
    }
  }


  ///////####  .on('click', 'button', function())


  // SetInitialStats.prototype.adjAtk = function() {
  //
  //   $('#add1').on('click', function(e){
  //     if (this.total > 0 && this.atk < MAX) {
  //       this.total--;
  //       this.atk++;
  //     };
  //   });
  //
  //   $('#sub1').on('click', function(e){
  //     if (this.total > 0 && this.atk < MAX) {
  //       this.total++;
  //       this.atk--;
  //     };
  //   });
  //
  //   $('#a').html(this.atk);
  //   $('#total').html(this.total);
  // };

  // SetInitialStats.prototype.addTotals = function() {
    //these should return booleans. Just test for conditionals

    //add to Total if:
      // total is greater than 0
      // atk is less than MAX
      // atk is
      // def is less than MAX

    // if (this.total < MAX && this.)
  //
  //   if (this.total < 15) {
  //     return this.total++;
  //   } else {
  //     return this.total;
  //   };
  // }
  //
  // SetInitialStats.prototype.subTotals = function() {
  //   if (this.total > 0) {
  //     return this.total--;
  //   } else {
  //     return this.total;
  //   }
  // }


  //
  // SetInitialStats.prototype.adjDef = function() {
  //   $('#add2').on('click', function(e){
  //     e.preventDefault();
  //     if (this.total > 0 && this.def < MAX) {
  //       this.total--;
  //       this.def++;
  //     };
  //   });
  //
  //   $('#sub2').on('click', function(e){
  //     e.preventDefault();
  //     if (this.total > 0 && this.def < MAX) {
  //       this.total++;
  //       this.def--;
  //     };
  //   });
  //
  //   $('#b').html(this.def);
  //   $('#total').html(this.total);
  // }
  //
  //
  // function ControlAllThisMess() {
  //   //
  // }
  //
  //
  //
  // $('input#uniq-btn').on('submit', function(){
  //   $('#ainput').html(workThis.atk);
  //   $('#binput').html(workThis.def);
  // })




  // NEED TO FIX
  // var btn = document.getElementById("uniq-btn");
  //
  // btn.addEventListener("click", function(){
  //
  // })


  // var total = 15;
  // var a = 0;
  // var b = 0;
  // var MAX = 15
  // $('#a').html(a);
  // $('#b').html(b);
  // $('#total').html(total);
  //
  //
  // document.getElementById('add1').addEventListener('click', function () {
  //   if (total > 0 && a < MAX) {
  //     total--;
  //     a++;
  //     document.getElementById('ainput').innerHTML = a;
  //     document.getElementById('a').innerHTML = a;
  //     document.getElementById('total').innerHTML = total;
  //   }
  // });
  //
  // document.getElementById('sub1').addEventListener('click', function () {
  //   if (total < MAX && a > 0) {
  //     total++;
  //     a--;
  //     document.getElementById('ainput').innerHTML = a;
  //     document.getElementById('a').innerHTML = a;
  //     document.getElementById('total').innerHTML = total;
  //   }
  // });
  //
  // document.getElementById('add2').addEventListener('click', function () {
  //   if (total > 0 && b < MAX) {
  //     total--;
  //     b++;
  //     document.getElementById('binput').innerHTML = b;
  //     document.getElementById('b').innerHTML = b;
  //     document.getElementById('total').innerHTML = total;
  //   }
  // });
  //
  // document.getElementById('sub2').addEventListener('click', function () {
  //   if (total < MAX && b > 0) {
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
