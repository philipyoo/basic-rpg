$(document).ready(function() {
    //Line 3 Fixes materialize css animations
    $('select').material_select();

    homeToLogin();
    loginToRegister();
    registerToLogin();

    statAdjuster();
    statSubmittal();




  ////////////////////////////////////////
  ////      AJAXify something         ////
  ////////////////////////////////////////

  // TODO: How to keep ajax running constantly so route never changes???


  function homeToLogin() {
    $('#wrap-this-yield').on('click', '#home-page-btn', function(e) {
      e.preventDefault();

      $('#explode-this').toggle('explode');

      $.get( "/login" ).done(function(response) {
        $('#wrap-this-yield').replaceWith(response);
      });
    })
  }



  // function homeToLogin() {
  //   $('#wrap-this-yield').on('click', '#home-page-btn', function(e) {
  //     e.preventDefault();
  //     var some_cb = function(response) {
  //       $('#wrap-this-yield').replaceWith(response);
  //     };
  //
  //     ajaxConstructor('get', '/login', null, 'html', some_cb);
  //   });
  // }


  // function loginToRegister() {
  //   console.log("listening");
  //   $('#register-button').on('click', '#register-form', function(e) {
  //     debugger
  //     e.preventDefault();
  //     var some_cb = function(response) {
  //       $('#register-form').replaceWith(response);
  //     };
  //
  //     ajaxConstructor('get', '/register', null, 'html', some_cb);
  //   });
  // }

  function loginToRegister() {
    console.log("listening");
    $("a").click(function (e){
      console.log("clicked");
      e.preventDefault();
    })
  }

  function registerToLogin() {
    $('#wrap-this-yield').on('click', '#login-link', function(e) {
      e.preventDefault();
      var some_cb = function(response) {
        $('#wrap-this-yield').replaceWith(response);
      };

      ajaxConstructor('get', '/login', null, 'html', some_cb);
    });
  }



  ////////////////////////////////////////
  ////      AJAX Constructor Yo       ////
  ////////////////////////////////////////


  function ajaxConstructor(m, u, d, dt, cb){
    $.ajax({
      url: u,
      method: m,
      data: d,
      dataType: dt
    })
    .done(function(response){
      console.log(response);
      cb(response)
    })
    .fail(function(response){
      console.log("Failed, Fix it man");
      console.log(response)
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

  function statAdjuster() {
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

  function statSubmittal() {
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

});
