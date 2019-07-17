import $ from 'jquery';
import 'daterangepicker';
import 'moment';
import { Observable } from 'rxjs';

const initDatepicker = (daysToDisplay) => {

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
        // Callback do not use here work with RxJs Subject on Application.js
      });
    }
}

export { initDatepicker };