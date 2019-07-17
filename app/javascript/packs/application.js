import "bootstrap";
import $ from 'jquery';
import { initPopover } from "../components/popover";
import { initTeamFilter } from "../components/teamfilter";
import { initDatepicker } from "../components/datepicker";
import { initFlashes } from "../components/flashes";
import Choices from 'choices.js';
import { initAddCategoriesFilter, initRemoveCategoriesFilter } from "../components/choices";
import { Subject } from "rxjs";

const daysToDisplay = 365 // Days in future displayed by daterangepicker

initFlashes();
initPopover();
initDatepicker(daysToDisplay);

const choices = new Choices('#categories-selection', {
  removeItemButton: true,
  classNames: {
    highlightedState: 'is-active',
  }
});

const subject = new Subject();

// const subscription = datePicker$.subscribe(val => console.log(val));

// // automatically unsub after 5s
// setTimeout(() => {
//   subscription.unsubscribe();
// }, 5000);

subject.subscribe({
  next: (picker) => {
    // console.log(`observerA: started`)

    // console.log(`StartDate: ${picker.startDate.format('YYYY-MM-DD')}`);
    // console.log(`EndDate: ${picker.endDate.format('YYYY-MM-DD')}`);

    const start = picker.startDate;
    const end = picker.endDate;

    const teamSelector = document.getElementById("teams");
    const teamSelected = teamSelector.options[teamSelector.selectedIndex].value;

    const events = document.querySelectorAll('#events');

    events.forEach(element => {

      if (teamSelected === "0" && document.getElementById("categories-selection").value === "0") {
        element.style.display = '';
      } else {
        element.style.display = 'none';
      }

      if (choices.passedElement.element.length === 0) {
        choices.setChoiceByValue("0");
      }
      
      // Filters consecutivelly by organizer AND category
      
      if (teamSelected === "0" || teamSelected === element.getElementsByClassName("organizer")[0].firstChild.nextSibling.id.substr(5)) {
        for (let i=0; i < element.querySelectorAll(".sqPlaces").length; i++) {
          for (let j=0; j < choices.passedElement.element.length; j++) {
            if (choices.passedElement.element[j].value === element.querySelectorAll(".sqPlaces")[i].id.substring(9)) {
              element.style.display = '';
            }
          }
        } 
      }

      const tournamentDate = element.innerText.trim().substring(6, 10) + "-" + element.innerText.trim().substring(3, 5) + "-" + element.innerText.trim().substring(0, 2)
      if (tournamentDate < start.format('YYYY-MM-DD') || tournamentDate > end.format('YYYY-MM-DD')) {
        element.style.display = 'none';
      }
    });
  }
});

const resetBtn = document.getElementById("reset-button");
resetBtn.addEventListener("click", function () {
  $('input[name="daterange"]').data('daterangepicker').setStartDate(moment());
  $('input[name="daterange"]').data('daterangepicker').setEndDate(moment().add(daysToDisplay, 'days'));
  let picker = $('input[name="daterange"]').data('daterangepicker')

  document.getElementById("teams").value = 0;

  choices.removeActiveItems();
  choices.setChoiceByValue("0");

  subject.next(picker);
});

$('input[name="daterange"]').on('apply.daterangepicker', function(ev, picker) {
  subject.next(picker);
});

const teamSelector = document.getElementById("teams");
teamSelector.addEventListener("change", function () {
  let picker = $('input[name="daterange"]').data('daterangepicker')
  subject.next(picker);
});

choices.passedElement.element.addEventListener('change', function(categoriesEvent) {

  if (categoriesEvent.detail.value === "0") {
    choices.removeActiveItems(categoriesEvent.detail.id);
  } else {
    choices.removeActiveItemsByValue("0");
  }

  let picker = $('input[name="daterange"]').data('daterangepicker')
  subject.next(picker, categoriesEvent);
});