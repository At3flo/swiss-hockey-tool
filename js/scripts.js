jQuery(function($) {

    var update_texts = function() {

        $('body').i18n();

    };

  $.i18n().load( {
    'en': 'i18n/en.json',
    'fr': 'i18n/fr.json',
    'de': 'i18n/de.json'
  });

  update_texts();
  
  $('.lang-switch').click(function(e) {

    e.preventDefault();

    $.i18n().locale = $(this).data('locale');

    update_texts();

  });

});



