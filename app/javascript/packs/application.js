import "bootstrap";
import { initPopover } from "../components/popover";
import { initFilter, initSelectorFilter } from "../components/filter";
import { initDatepicker } from "../components/datepicker";

const daysToDisplay = 90 // Days in future displayed by daterangepicker

initPopover();
initFilter(daysToDisplay);
initDatepicker(daysToDisplay);
initSelectorFilter(daysToDisplay);

const start = moment();
const end = moment().add(daysToDisplay, 'days');
const events = document.querySelectorAll('#events')
events.forEach(element => {
  element.style.display = '';
  const tournamentDate = element.innerText.trim().substring(6, 10) + "-" + element.innerText.trim().substring(3, 5) + "-" + element.innerText.trim().substring(0, 2)
  if (tournamentDate < start.format('YYYY-MM-DD') || tournamentDate > end.format('YYYY-MM-DD')) {
    element.style.display = 'none';
  }
});

