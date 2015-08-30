$(document).ready(function() {
  //Line 3 Fixes materialize css animations
  $('select').material_select();

  getLogin();
  getRegister();
  postStartPages();

  statAdjuster();

  statSubmittal();


});

////////////////////////////////////////
//// AJAXify my login/registration  ////
////////////////////////////////////////

var getLogin = function() {
  $('a#login-link').on('click', function(e) {
    e.preventDefault();

    console.log(this);

    var url = $(this).attr('href');

    var getLoginPage = $.ajax({
      method: 'get',
      url: url,
      dataType: "html"
    });

    getLoginPage.done(function(response) {
      console.log("i'm in the done block");
      console.log(response);
      $('div#register-page').html(response);
      // $('div#register-page').addClass('hidden');
    });

    getLoginPage.fail(function(response) {
      console.log("i r failzorz")
    });
  })
}

var getRegister = function() {
  $('a#register-link').on('click', function(e) {
    e.preventDefault();

    console.log(this);

    var url = $(this).attr('href');

    var getRegisterPage = $.ajax({
      method: 'get',
      url: url,
      dataType: "html"
    });

    getRegisterPage.done(function(response) {
      console.log("i'm in the done block");
      console.log(response);
      $('div#login-page').html(response);
      // $('div#login-page').addClass('hidden');
    });

    getRegisterPage.fail(function(response) {
      console.log("i r failzorz");
    });
  })
}

var postStartPages = function() {
  $('#wrap-this-yield').on('submit', 'form', function(e){
    e.preventDefault();

    var url = $(this).attr("href");

    var postStartPages = $.ajax({
      method: 'post',
      url: url,
      dataType: "html",
      data: $(this).serialize()
    });

    postStartPages.done(function(response){
      console.log(response);
      var getId = response[:id]
      window.location = "/profile/getId"
    })
  });
}




  // $('.survey-container').on('submit', 'form', function(e){
  //   e.preventDefault();
  //    var url = $(this).attr("href");
  //   var postSurveyForm = $.ajax({
  //   method: 'post',
  //   url: url,
  //   dataType: "json",
  //   data: $(this).serialize()
  //   })
  //     postSurveyForm.done(function(response){
  //       console.log("YOU ARE THE ONE MORPHEUS")
  //       console.log(response);
  //
  //    })
  // });




////////////////////////////////////////
////      AJAX Constructor Yo       ////
////////////////////////////////////////
// How to correctly use callbacks??

// var construction = function(m, u, d, cb) {
//   function(e) {
//     e.preventDefault();
//
//     var method = m;
//     var url = u;
//     var data = d;
//     var dataType = "json";
//
//     var request = $.ajax({
//       url: url,
//       method: method,
//       data: data,
//       dataType: dataType
//     });
//
//     request.done(function(response){
//       console.log(response);
//       cb(response)
//     });
//
//     request.fail(function(response){
//       console.log("Failed, Fix it man");
//     });
//   }
// };





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
