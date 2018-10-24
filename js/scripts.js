var set_locale_to = function (locale) {
  if (locale) {
    $.i18n().locale = locale;
  }
  $('body').i18n();
};

jQuery(function () {
  $.i18n().load({
    'en': 'i18n/en.json',
    'fr': 'i18n/fr.json',
    'de': 'i18n/de.json'
  }).done(function () {
    set_locale_to(url('?locale'));

    History.Adapter.bind(window, 'statechange', function () {
      set_locale_to(url('?locale'));
    });

    set_locale_to(localStorage.getItem("locale"));


    $('.lang-switch').on('click', 'a', function (e) {
      e.preventDefault();
      History.pushState(null, null, "?locale=" + $(this).data('locale'));
      localStorage.setItem("locale", $(this).data('locale'));
    });

    $('.lang-switch').click(function (e) {
      e.preventDefault();
      History.pushState(null, null, "?locale=" + $(this).data('locale'));
      $.i18n().locale = $(this).data('locale');
      $('body').i18n();
    });
  });
});

$(function() {
  $('input[name="daterange"]').daterangepicker({
    "locale": {
      "format": "DD/MM/YYYY",
      "separator": " - ",
      "applyLabel": "Apply",
      "cancelLabel": "Cancel",
      "fromLabel": "From",
      "toLabel": "To",
      "customRangeLabel": "Custom",
      "weekLabel": "W",
      "daysOfWeek": [
          "Su",
          "Mo",
          "Tu",
          "We",
          "Th",
          "Fr",
          "Sa"
      ],
      "monthNames": [
          "January",
          "February",
          "March",
          "April",
          "May",
          "June",
          "July",
          "August",
          "September",
          "October",
          "November",
          "December"
      ],
      "firstDay": 1
  },
    opens: 'right'
  }, function(start, end, label) {
    console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
  });
});

$(".plusSelector").on('click', function (e) {
  e.preventDefault ();
  var target = $($(this).attr('href')) ;
  if (target.is(':visible')) {
      target.slideUp() ;
  }
  else {
      var vis = target.parent('.row').find('.collapse').filter(':visible') ;
      if (vis.length > 0) {
          vis.slideUp(function () {
              target.slideDown();
          }) ;
      }
      else {
          $('.collapse').filter(':visible').slideUp() ;
          target.slideDown() ;   
      }
  }
});

$(document).ready(function(){
  $('[data-toggle="tooltip"]').tooltip();
});

$(document).ready(function(){
  $('[data-toggle="popover"]').popover();
});