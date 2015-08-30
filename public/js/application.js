$(document).ready(function() {
  //Line 3 Fixes materialize css animations
  $('select').material_select();

  homeToLogin();

  statAdjuster();

  statSubmittal();


});

////////////////////////////////////////
//// AJAXify something              ////
////////////////////////////////////////





////////////////////////////////////////
////      AJAX Constructor Yo       ////
////////////////////////////////////////
// How to correctly use callbacks??
// TODO: Create AJAX constructor for AJAX use

  var homeToLogin = function() {
    $('#home-page-btn').on('click', function(e){
      e.preventDefault();
    var some_cb = function(response) {
      $('body').replaceWith(response);
    }
    ajaxRequest('get', '/login', null, some_cb);
  })
}

var ajaxRequest = function(m, u, d, cb){
$.ajax({
  url: u,
  method: m,
  data: d
})
.done(function(response){
  console.log(response);
  cb(response)
})
.fail(function(response){
  console.log(response)
  console.log("Failed, Fix it man");
});
}




////////////////////////////////////////
//// CHARACTER CREATION STAT POINTS ////
////////////////////////////////////////

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

var statSubmittal = function () {
  $('#createCharForm').submit(function() {
    var getName = $('input#getName').val();
    $('input#nameInput').val(getName);

    var getAtk = $('#display-atk').text();
    $('input#atkInput').val(parseInt(getAtk));

    var getDef = $('#display-def').text();
    $('input#defInput').val(parseInt(getDef));
  })
};


////////////////////////////////////////
//// CHARACTER PAGE DELETE OPTION   ////
////////////////////////////////////////

// function processDeleteCharacterForm(e) {
//     if (e.preventDefault) e.preventDefault();
//
//     /* do what you want with the form */
//
//     // You must return false to prevent the default form behavior
//     return false;
// }
//
// var form = document.getElementById('my-form');
// if (form.attachEvent) {
//     form.attachEvent("submit", processForm);
// } else {
//     form.addEventListener("submit", processForm);
// }


//
