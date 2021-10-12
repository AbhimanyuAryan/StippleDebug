# This is Stipple Examples
using Stipple

# ok this is a multi-page guide
@assert 43 == 43
@assert p(" {{todo}} ", class="warning", @recur(:"todo in todos")) == "<p class=\"warning\" v-for='todo in todos'>\n {{todo}} \n</p>\n" # hide

# Date Picker Documentation

using Stipple, StippleUI
import Stipple.Html: div

# R{Date}, R{Vector{DateRange}} etc are type Observable and you can listen for changes 
# https://juliagizmos.github.io/Observables.jl/stable/
Base.@kwdef mutable struct DatePickers <: ReactiveModel
  date::R{Date} = today() + Day(30)
  dates::R{Vector{Date}} = Date[today()+Day(10), today()+Day(20), today()+Day(30)]
  daterange::R{DateRange} = DateRange(today(), (today()+Day(3)))
  dateranges::R{Vector{DateRange}} = [DateRange(today(), (today()+Day(3))),
                                      DateRange(today()+Day(7), (today() + Day(10))),
                                      DateRange(today()+Day(14), (today() + Day(17)))]
  proxydate::R{Date} = today()
  inputdate::R{Date} = today()
end

const model = Stipple.init(DatePickers())

function ui()
  [
    page(
      vm(model), class="container", title="DatePickers Demo", partial=true, core_theme=true,
      [
        row(
          cell([
            h1("Date pickers")
          ])
        )

        row([
          cell([
            datepicker(:date)        # refers to line 7 date::R{Date}
          ])
          cell([
            datepicker(:dates, multiple = true) # :dates is mapped to line 8 Stipple's ReactiveModel
          ])
          cell([
            datepicker(:daterange, range = true) # :daterange -> daterange::R{DateRange} line 9
          ])
          cell([
            datepicker(:dateranges, range = true, multiple = true) 
          ])
        ])

        row([
          cell([
            btn(icon="event", round=true, color="primary", [
              popup_proxy([
                datepicker(:proxydate, content = [
                  div( class="row items-center justify-end q-gutter-sm", [
                    btn(label="Cancel", color="primary", flat=true, v__close__popup=true)
                    btn(label="OK", color="primary", flat=true, v__close__popup=true)
                  ])
                ])
              ])
            ])
          ])
          cell([
            div(class="q-pa-md", style="max-width: 300px", [
              textfield("", :inputdate, filled=true, content = [
                template(v__slot!!append=true, [
                  icon(name="event", class="cursor-pointer", [
                    popup_proxy(ref="qDateProxy", transition__show="scale", transition__hide="scale", [
                      datepicker(:inputdate, content = [
                        div(class="row items-center justify-end", [
                          btn(v__close__popup=true, label="Close", color="primary", flat=true)
                        ])
                      ])
                    ])
                  ])
                ])
              ])
            ])
          ])
        ])

      ]
    )
  ] |> html
end

@assert ui() == "<html>\n<link href=\"https://fonts.googleapis.com/css?family=Material+Icons\" rel=\"stylesheet\" />\n<link href=\"/css/stipple/stipplecore.css\" rel=\"stylesheet\" />\n<link href=\"/css/stipple/quasar.min.css\" rel=\"stylesheet\" />\n<link href=\"/css/stipple/twbpatch.css\" rel=\"stylesheet\" />\n<div id=\"DatePickers\" class=\"container\">\n<div class=\"row\">\n<div class=\"col col-12 col-sm\">\n<h1>\nDate pickers\n</h1>\n\n</div>\n\n</div>\n<div class=\"row\">\n<div class=\"col col-12 col-sm\">\n<template>\n<q-date v-model=\"date\" mask=\"YYYY-MM-DD\">\n\n</q-date>\n\n</template>\n\n</div>\n<div class=\"col col-12 col-sm\">\n<template>\n<q-date v-model=\"dates\" multiple mask=\"YYYY-MM-DD\">\n\n</q-date>\n\n</template>\n\n</div>\n<div class=\"col col-12 col-sm\">\n<template>\n<q-date v-model=\"daterange\" range mask=\"YYYY-MM-DD\">\n\n</q-date>\n\n</template>\n\n</div>\n<div class=\"col col-12 col-sm\">\n<template>\n<q-date v-model=\"dateranges\" range multiple mask=\"YYYY-MM-DD\">\n\n</q-date>\n\n</template>\n\n</div>\n\n</div>\n<div class=\"row\">\n<div class=\"col col-12 col-sm\">\n<template>\n<q-btn color=\"primary\" round label icon=\"event\">\n<q-popup-proxy>\n<template>\n<q-date v-model=\"proxydate\" mask=\"YYYY-MM-DD\">\n<div class=\"row items-center justify-end q-gutter-sm\">\n<template>\n<q-btn color=\"primary\" flat label=\"Cancel\" v-close-popup>\n\n</q-btn>\n\n</template>\n<template>\n<q-btn color=\"primary\" flat label=\"OK\" v-close-popup>\n\n</q-btn>\n\n</template>\n\n</div>\n\n</q-date>\n\n</template>\n\n</q-popup-proxy>\n\n</q-btn>\n\n</template>\n\n</div>\n<div class=\"col col-12 col-sm\">\n<div class=\"q-pa-md\" style=\"max-width: 300px\">\n<template>\n<q-input filled label v-model=\"inputdate\">\n<template v-slot:append>\n<template>\n<q-icon name=\"event\" class=\"cursor-pointer\">\n<q-popup-proxy transition-show=\"scale\" ref=\"qDateProxy\" transition-hide=\"scale\">\n<template>\n<q-date v-model=\"inputdate\" mask=\"YYYY-MM-DD\">\n<div class=\"row items-center justify-end\">\n<template>\n<q-btn color=\"primary\" flat label=\"Close\" v-close-popup>\n\n</q-btn>\n\n</template>\n\n</div>\n\n</q-date>\n\n</template>\n\n</q-popup-proxy>\n\n</q-icon>\n\n</template>\n\n</template>\n\n</q-input>\n\n</template>\n\n</div>\n\n</div>\n\n</div>\n\n</div>\n<script src=\"/js/channels.js\"></script><script src=\"/js/stipple/underscore-min.js\">\n\n</script>\n<script src=\"/js/stipple/vue.js\">\n\n</script>\n<script src=\"/js/stipple/quasar.umd.min.js\">\n\n</script>\n<script src=\"/js/stipple/stipplecore.js\" defer>\n\n</script>\n<script src=\"/js/stipple/vue_filters.js\" defer>\n\n</script>\n<script src=\"/stipple.js?v=0.72844204213918\" defer onload=\"Stipple.init({theme: 'stipple-blue'});\">\n\n</script>\n\n</html>\n"