$(document).ready(function () {

  // send an HTTP DELETE request for the sign-out link
  $('a#sign-out').on("click", function (e) {
    e.preventDefault();
    var request = $.ajax({ url: $(this).attr('href'), type: 'delete' });
    request.done(function () { window.location = "/"; });
  });

  // replaces input message with checkmark when input is valid
  var checkmark = function(id) {
    $(id).contents().remove();
    $(id).append(" &#x2713;").show();
    $(id).css({'color': 'green'});
  }

  // add datepicker
  $(document).on("focus", "#datepicker", function(e) {
    $("#datepicker").datepicker();
  });
  
  // validations on datepicker before submit
  $(document).on("blur", "#datepicker", function(e) {
    if ($("#datepicker").val().length != 0)
    {
      checkmark("#date_validation");
    }
  });

  // validations on event title, email and organizer name before submit
  $(document).keyup(function(e) {
    console.log("in keyup!")
    if ($("#event_title").val().length > 0)
    {
      checkmark("#title_validation");
    }  
    if ($("#event_organizer_email").val().match(/\w+@\w+\.\w+/))
    {
      checkmark("#email_validation");
    }
    if ($("#event_organizer_name").val().length > 3)
    {
      checkmark('#name_validation');
    }
  });
});