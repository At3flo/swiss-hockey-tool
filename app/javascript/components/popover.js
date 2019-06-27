import $ from "jquery";

const initPopover = () => {
  $(function () {
    $('[data-toggle="popover"]').popover()
  });
}

export { initPopover };