import $ from 'jquery';

const initFlashes = () => {

  $(document).ready(function() {
    $(function() {
      setTimeout(function(){
        $('.alert-success').fadeOut(500);
      }, 3000);
    });
   });

}

export { initFlashes }