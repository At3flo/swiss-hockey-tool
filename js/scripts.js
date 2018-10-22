var update_texts = function() {

    $('body').i18n();

};

$( document ).ready(function() {

  $.i18n().load( {
    'en': 'i18n/en.json',
    'fr': 'i18n/fr.json',
    'de': 'i18n/de.json'
  });

  $.i18n().locale = 'fr';

});


$('.lang-switch').click(function(e) {

    e.preventDefault();

    $.i18n().locale = $(this).data('locale');

    update_texts();

});



