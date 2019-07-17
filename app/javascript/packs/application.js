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
  next: (picker, categoriesEvent) => {
    console.log(`observerA: started`)

    console.log(`StartDate: ${picker.startDate.format('YYYY-MM-DD')}`);
    console.log(`EndDate: ${picker.endDate.format('YYYY-MM-DD')}`);

    const start = picker.startDate;
    const end = picker.endDate;

    const teamSelector = document.getElementById("teams");
    const teamSelected = teamSelector.options[teamSelector.selectedIndex].value;

    const events = document.querySelectorAll('#events');

    events.forEach(element => {

      if (teamSelected === "0") { // choices.passedElement.element[0].value === "0" && teamSelected === "0") {
        element.style.display = '';
      } else {
        element.style.display = 'none';
      }

      // initTeamFilter(element);      
      
      if (teamSelected != "0") {
        const specificTeamEvents = document.querySelectorAll('#team-' + teamSelected);
        specificTeamEvents.forEach(element => {
          element.parentNode.parentNode.parentNode.style.display = '';
        });
      }

      // initAddCategoriesFilter(daysToDisplay, choices);

      // if (categoriesEvent && categoriesEvent.detail.value === "0") {
      //   choices.removeActiveItems(categoriesEvent.detail.id);
      // } else {
      //   choices.removeActiveItemsByValue("0");
      // }

      // initRemoveCategoriesFilter(daysToDisplay, choices);
      
      // if (choices.passedElement.element.length === 0) {
      //   choices.setChoiceByValue("0");
      // }

      // For both method

      // for (let i=0; i < choices.passedElement.element.length; i++) {
      //   const specificCategoryEvents = document.querySelectorAll('#category-' + choices.passedElement.element[i].value);
      //   specificCategoryEvents.forEach(element => {
      //     element.parentNode.parentNode.parentNode.parentNode.style.display = '';
      //   });
      // }

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

  subject.next(picker);
});

$('input[name="daterange"]').on('apply.daterangepicker', function(ev, picker) {
  //do something, like clearing an input
  subject.next(picker);
});

const teamSelector = document.getElementById("teams");
teamSelector.addEventListener("change", function () {
  let picker = $('input[name="daterange"]').data('daterangepicker')
  subject.next(picker);
});

// choices.passedElement.element.addEventListener('addItem', function(categoriesEvent) {
//   let picker = $('input[name="daterange"]').data('daterangepicker')
//   subject.next(picker, categoriesEvent);
// });

// choices.passedElement.element.addEventListener('removeItem', function(categoriesEvent) {
//   let picker = $('input[name="daterange"]').data('daterangepicker')
//   subject.next(picker);
// });