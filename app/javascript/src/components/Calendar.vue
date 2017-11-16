<template lang="pug">
  div
    .calendar__title
      | Календарь
    .calendar__title-year
      | 2017
    .calendar__wrapper.calendar__wrapper-2017(data-year = '2017')
      table.calendar-digits#calendar-1(data-month="01")
        thead
          tr
            td(colspan="4").month
        tbody
      table.calendar-digits#calendar-2(data-month="02")
        thead
          tr
            td(colspan="4").month
        tbody
      table.calendar-digits#calendar-3(data-month="03")
        thead
          tr
            td(colspan="4").month
        tbody
      table.calendar-digits#calendar-4(data-month="04")
        thead
          tr
            td(colspan="4").month
        tbody
      table.calendar-digits#calendar-5(data-month="05")
        thead
          tr
            td(colspan="4").month
        tbody
      table.calendar-digits#calendar-6(data-month="06")
        thead
          tr
            td(colspan="4").month
        tbody
      table.calendar-digits#calendar-7(data-month="07")
        thead
          tr
            td(colspan="4").month
        tbody
      table.calendar-digits#calendar-8(data-month="08")
        thead
          tr
            td(colspan="4").month
        tbody
      table.calendar-digits#calendar-9(data-month="09")
        thead
          tr
            td(colspan="4").month
        tbody
      table.calendar-digits#calendar-10(data-month="10")
        thead
          tr
            td(colspan="4").month
        tbody
      table.calendar-digits#calendar-11(data-month="11")
        thead
          tr
            td(colspan="4").month
        tbody
      table.calendar-digits#calendar-12(data-month="12")
        thead
          tr
            td(colspan="4").month
        tbody
    .calendar__grey
      .calendar__title-year
        | 2016
      .calendar__wrapper.calendar__wrapper-2016(data-year = '2016')
        table.calendar-digits#calendar-1(data-month="01")
          thead
            tr
              td(colspan="4").month
          tbody
        table.calendar-digits#calendar-2(data-month="02")
          thead
            tr
              td(colspan="4").month
          tbody
        table.calendar-digits#calendar-3(data-month="03")
          thead
            tr
              td(colspan="4").month
          tbody
        table.calendar-digits#calendar-4(data-month="04")
          thead
            tr
              td(colspan="4").month
          tbody
        table.calendar-digits#calendar-5(data-month="05")
          thead
            tr
              td(colspan="4").month
          tbody
        table.calendar-digits#calendar-6(data-month="06")
          thead
            tr
              td(colspan="4").month
          tbody
        table.calendar-digits#calendar-7(data-month="07")
          thead
            tr
              td(colspan="4").month
          tbody
        table.calendar-digits#calendar-8(data-month="08")
          thead
            tr
              td(colspan="4").month
          tbody
        table.calendar-digits#calendar-9(data-month="09")
          thead
            tr
              td(colspan="4").month
          tbody
        table.calendar-digits#calendar-10(data-month="10")
          thead
            tr
              td(colspan="4").month
          tbody
        table.calendar-digits#calendar-11(data-month="11")
          thead
            tr
              td(colspan="4").month
          tbody
        table.calendar-digits#calendar-12(data-month="12")
          thead
            tr
              td(colspan="4").month
          tbody
</template>

<script>
/*  var newCalendar = function (year, attrCalendarsBody, calendarAllLinks, attrCalendarMonth, parentsYearClassName) {
    for (var j = 0; j < 12; j++) {
      var D1 = new Date(year, j)
      var D1last = new Date(D1.getFullYear(), D1.getMonth() + 1, 0).getDate() // последний день месяца
      var D1Nlast = new Date(D1.getFullYear(), D1.getMonth(), D1last).getDay() // день недели последнего дня месяца
      var D1Nfirst = new Date(D1.getFullYear(), D1.getMonth(), 1).getDay() // день недели первого дня месяца
      var calendar1 = '<tr>'
      var month = ['Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь', 'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь'] // название месяца, вместо цифр 0-11

      // пустые клетки до первого дня текущего месяца
      if (D1Nfirst !== 0) {
        for (var i = 1; i < D1Nfirst; i++) calendar1 += '<td>'
      } else { // если первый день месяца выпадает на воскресенье, то требуется 7 пустых клеток
        for (var l = 0; l < 6; l++) calendar1 += '<td>'
      }

      // дни месяца
      for (var daysMonth = 1; daysMonth <= D1last; daysMonth++) {
        if (daysMonth !== D1.getDate()) {
          calendar1 += '<td>' + '<a href="#" class="day-link">' + daysMonth + '</a>'
        } else {
          calendar1 += '<td id="today">' + '<a href="#" class="day-link">' + daysMonth + '</a>'
        }
        if (new Date(D1.getFullYear(), D1.getMonth(), daysMonth).getDay() === 0) { // если день выпадает на воскресенье, то перевод строки
          calendar1 += '<tr>'
        }
      }

      // пустые клетки после последнего дня месяца
      if (D1Nlast !== 0) {
        for (var k = D1Nlast; k < 7; k++) calendar1 += '<td>'
      }

      var classElementCalendarsTbody = attrCalendarsBody
      var classElementCalendarsMonth = attrCalendarMonth

      var calendarsTbody = document.querySelectorAll(classElementCalendarsTbody)

      var calendarsMonth = document.querySelectorAll(classElementCalendarsMonth)

      calendarsTbody[j].innerHTML = calendar1
      calendarsMonth[j].innerHTML = month[D1.getMonth()]
    }

    var dayLinks = document.querySelectorAll(calendarAllLinks)
    var newDayLinks = [].slice.call(dayLinks)

    var classElementDayLinkDigit = parentsYearClassName
    var newClassElementDayLinkDigit = [].slice.call(dayLinks)

    for (var m = 0; dayLinks.length > m; m++) {
      var monthDigit = newDayLinks[m].closest('.calendar-digits').getAttribute('data-month')
      var yearDigit = newClassElementDayLinkDigit[m].closest(classElementDayLinkDigit).getAttribute('data-year')

      newDayLinks[m].setAttribute('href', 'index' + '#' + newDayLinks[m].textContent + '/' + monthDigit + '/' + yearDigit)
    }

}

  newCalendar(2017, '.calendar__wrapper-2017 .calendar-digits tbody', '.calendar__wrapper-2017 .day-link', '.calendar__wrapper-2017 .month', '.calendar__wrapper-2017')

  newCalendar(2016, '.calendar__wrapper-2016 .calendar-digits tbody', '.calendar__wrapper-2016 .day-link', '.calendar__wrapper-2016 .month', '.calendar__wrapper-2016')
*/
</script>

<style scoped lang="scss">
  .calendar__title {
  margin-top: 95px;
  margin-bottom: 104px;

  color: #686C7A;
  font-family: LucidaGrande-Bold;
  font-size: 36px;
  line-height: 43px;
  text-align: center;
}

.calendar__title-year {
  margin-bottom: 80px;

  color: #686C7A;
  font-family: LucidaGrande-Bold;
  font-size: 36px;
  line-height: 43px;
  text-align: center;
}

.calendar__wrapper {
  max-width: 901px;
  width: 100%;

  margin: 0 auto;
}

.calendar-digits .month {
  font-family: LucidaGrande-Bold;
  font-size: 17px;
  line-height: 20px;
}

.calendar-digits {
  display: inline-block;
  vertical-align: top;

  max-width: 164px;
  width: 100%;
  margin-right: 63px;
  margin-bottom: 53px;
}

.calendar-digits:nth-child(4n) {
  margin-right: 0;
}

.calendar-digits td {
  padding-right: 5px;
  padding-bottom: 10px;

  font-size: 12px;
  line-height: 15px;
  font-family: LucidaGrande-Bold;
}

.calendar-digits .month {
  padding-bottom: 20px;
}

.calendar-digits a:hover {
  text-decoration: underline;
}

.calendar__grey {
  padding-top: 40px;
  background-color: #F8F8F8;
}


</style>

