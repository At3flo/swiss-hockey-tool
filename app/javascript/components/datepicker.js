import $ from 'jquery';
import 'daterangepicker';
import 'moment';

const initDatepicker = (daysToDisplay) => {

  $(document).ready(function () {
    if (document.getElementById('datefield').value != `01/01/2000 - ${moment().format('DD/MM/YYYY')}`) {
      $('input[name="daterange"]').daterangepicker({
        startDate: moment(),
        endDate: moment().add(daysToDisplay, 'days'),
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
      }, function (start, end, label) {
        const events = document.querySelectorAll('#events')
        events.forEach(element => {
          const elementSelected = document.getElementById("teams");
          if (elementSelected.options[elementSelected.selectedIndex].value == 0) {
            element.style.display = '';
          }
          const tournamentDate = element.innerText.trim().substring(6, 10) + "-" + element.innerText.trim().substring(3, 5) + "-" + element.innerText.trim().substring(0, 2)
          if (tournamentDate < start.format('YYYY-MM-DD') || tournamentDate > end.format('YYYY-MM-DD')) {
            element.style.display = 'none';
          }
        });
      });
    }
  });
}

export { initDatepicker };