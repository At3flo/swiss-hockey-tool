import { initDatepicker } from "./datepicker";

const initFilter = (daysToDisplay) => {
  const toggle = document.querySelector('#isTournamentOpen');
  const events = document.querySelectorAll('#events');
  toggle.addEventListener('click', () => {
    if (document.querySelector('#isTournamentOpen').value === "true") {
      events.forEach(element => {
        if (element.getElementsByClassName('btn-danger sqValidation')[0]) {
          let eventClosed = element.getElementsByClassName('btn-danger sqValidation')[0].parentNode.parentNode.parentNode.parentNode;
          eventClosed.style.display = '';
        }
      });
      document.querySelector('#isTournamentOpen').value = false

      initDatepicker(daysToDisplay);
      
      const start = moment();
      const end = moment().add(daysToDisplay, 'days');
      events.forEach(element => {
        element.style.display = '';
        const tournamentDate = element.innerText.trim().substring(6, 10) + "-" + element.innerText.trim().substring(3, 5) + "-" + element.innerText.trim().substring(0, 2)
        if (tournamentDate < start.format('YYYY-MM-DD') || tournamentDate > end.format('YYYY-MM-DD')) {
          element.style.display = 'none';
        }
      });
      document.getElementById('datefield').focus();

    } else {
      events.forEach(element => {
        if (element.getElementsByClassName('btn-danger sqValidation')[0]) {
          let eventClosed = element.getElementsByClassName('btn-danger sqValidation')[0].parentNode.parentNode.parentNode.parentNode;
          eventClosed.style.display = 'none';
        }
      });
      document.querySelector('#isTournamentOpen').value = true
    }
  });
}

const initSelectorFilter = () => {
  const elementSelected = document.getElementById("teams");
  elementSelected.addEventListener("change", function () {

    const events = document.querySelectorAll('#events');
    events.forEach(element => {
      element.style.display = '';
    });

    if (elementSelected.options[elementSelected.selectedIndex].value != 0) {
      events.forEach(element => {
        element.style.display = 'none';
      });

      const specificTeamEvents = document.querySelectorAll('#team-' + elementSelected.options[elementSelected.selectedIndex].value);
      specificTeamEvents.forEach(element => {
        element.parentNode.parentNode.parentNode.style.display = '';
      });
    }
  });
}

export {
  initFilter,
  initSelectorFilter
};