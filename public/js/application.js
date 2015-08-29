$(document).ready(function() {
  //Line 3 Fixes materialize css animations
  $('select').material_select();

  statAdjuster();

  statSubmittal();


});




function SetInitialStats() {
  MAX = 15;
  this.total = 15;
  this.atk = 0;
  this.def = 0;
}

var statAdjuster = function() {
  var setupCharStats = new SetInitialStats();

  //wrap all calls in here depending on action
  $('button').on('click', function() {
    var buttonName = $(this).attr("name");
    var buttonClass = $(this).attr("class");

    //Look to refactor this part:
    if ( buttonClass === "add") {

      if ( buttonName === "atk") {
        setupCharStats.adjAtk(buttonName, 1);
      } else if ( buttonName === "def") {
        setupCharStats.adjDef(buttonName, 1);
      };

    } else if ( buttonClass === "sub") {

      if ( buttonName === "atk") {
        setupCharStats.adjAtk(buttonName, -1);
      } else if ( buttonName === "def") {
        setupCharStats.adjDef(buttonName, -1);
      };

    };
  })
};


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
  if (this.checkTotal(direction) && this.checkAtk(direction)) {
    this.atk += parseInt(direction);
    this.total -= parseInt(direction);

    $("#display-" + buttonName).html(this.atk);
    $("div#total").html(this.total);
  };
}


SetInitialStats.prototype.adjDef = function(buttonName, direction) {
  if (this.checkTotal(direction) && this.checkDef(direction)) {
    this.def += parseInt(direction);
    this.total -= parseInt(direction);

    $("#display-" + buttonName).html(this.def);
    $("div#total").html(this.total);
  };
}


// Now transition the div numbers and transfer to form on submittal
// Maybe AJAX??

//NAME HERE NOT XFERRING. FIX THIS
var statSubmittal = function () {
  // on click action::

  $('#createCharForm').submit(function() {
    var getName = $('input#getName').val();
    console.log(getName);
    console.log("yolo")
    console.log($('input#getName'))

    $('input#nameInput').val(getName);

    var getAtk = $('#display-atk').text();
    $('input#atkInput').val(parseInt(getAtk));

    var getDef = $('#display-def').text();
    $('input#defInput').val(parseInt(getDef));


  })
};
//
    // var inputName = $('#createCharForm')
                  // .attr("type", "hidden")
                  // .attr("name", "name").val(getName)

    // $('#createCharForm').append($(inputName));
// var input = $("<input>", { type: "hidden", name: "mydata", value: "bla" }); $('#form1').append($(input));
//
//
// var input = $("<input>")
//                .attr("type", "hidden")
//                .attr("name", "mydata").val("bla");
// $('#form1').append($(input));
