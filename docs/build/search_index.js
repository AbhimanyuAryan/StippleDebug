var documenterSearchIndex = {"docs":
[{"location":"generated/stipp/","page":"Stipple Ex","title":"Stipple Ex","text":"EditURL = \"<unknown>/../examples/stipp.jl\"","category":"page"},{"location":"generated/stipp/","page":"Stipple Ex","title":"Stipple Ex","text":"This is Stipple Examples","category":"page"},{"location":"generated/stipp/","page":"Stipple Ex","title":"Stipple Ex","text":"using Stipple","category":"page"},{"location":"generated/stipp/","page":"Stipple Ex","title":"Stipple Ex","text":"ok this is a multi-page guide","category":"page"},{"location":"generated/stipp/","page":"Stipple Ex","title":"Stipple Ex","text":"@assert 43 == 43\n@assert p(\" {{todo}} \", class=\"warning\", @recur(:\"todo in todos\")) == \"<p class=\\\"warning\\\" v-for='todo in todos'>\\n {{todo}} \\n</p>\\n\" # hide","category":"page"},{"location":"generated/stipp/","page":"Stipple Ex","title":"Stipple Ex","text":"Date Picker Documentation","category":"page"},{"location":"generated/stipp/","page":"Stipple Ex","title":"Stipple Ex","text":"using Stipple, StippleUI\nimport Stipple.Html: div","category":"page"},{"location":"generated/stipp/","page":"Stipple Ex","title":"Stipple Ex","text":"R{Date}, R{Vector{DateRange}} etc are type Observable and you can listen for changes https://juliagizmos.github.io/Observables.jl/stable/","category":"page"},{"location":"generated/stipp/","page":"Stipple Ex","title":"Stipple Ex","text":"Base.@kwdef mutable struct DatePickers <: ReactiveModel\n  date::R{Date} = today() + Day(30)\n  dates::R{Vector{Date}} = Date[today()+Day(10), today()+Day(20), today()+Day(30)]\n  daterange::R{DateRange} = DateRange(today(), (today()+Day(3)))\n  dateranges::R{Vector{DateRange}} = [DateRange(today(), (today()+Day(3))),\n                                      DateRange(today()+Day(7), (today() + Day(10))),\n                                      DateRange(today()+Day(14), (today() + Day(17)))]\n  proxydate::R{Date} = today()\n  inputdate::R{Date} = today()\nend\n\nconst model = Stipple.init(DatePickers())\n\nfunction ui()\n  [\n    page(\n      vm(model), class=\"container\", title=\"DatePickers Demo\", partial=true, core_theme=true,\n      [\n        row(\n          cell([\n            h1(\"Date pickers\")\n          ])\n        )\n\n        row([\n          cell([\n            datepicker(:date)        # refers to line 7 date::R{Date}\n          ])\n          cell([\n            datepicker(:dates, multiple = true) # :dates is mapped to line 8 Stipple's ReactiveModel\n          ])\n          cell([\n            datepicker(:daterange, range = true) # :daterange -> daterange::R{DateRange} line 9\n          ])\n          cell([\n            datepicker(:dateranges, range = true, multiple = true)\n          ])\n        ])\n\n        row([\n          cell([\n            btn(icon=\"event\", round=true, color=\"primary\", [\n              popup_proxy([\n                datepicker(:proxydate, content = [\n                  div( class=\"row items-center justify-end q-gutter-sm\", [\n                    btn(label=\"Cancel\", color=\"primary\", flat=true, v__close__popup=true)\n                    btn(label=\"OK\", color=\"primary\", flat=true, v__close__popup=true)\n                  ])\n                ])\n              ])\n            ])\n          ])\n          cell([\n            div(class=\"q-pa-md\", style=\"max-width: 300px\", [\n              textfield(\"\", :inputdate, filled=true, content = [\n                template(v__slot!!append=true, [\n                  icon(name=\"event\", class=\"cursor-pointer\", [\n                    popup_proxy(ref=\"qDateProxy\", transition__show=\"scale\", transition__hide=\"scale\", [\n                      datepicker(:inputdate, content = [\n                        div(class=\"row items-center justify-end\", [\n                          btn(v__close__popup=true, label=\"Close\", color=\"primary\", flat=true)\n                        ])\n                      ])\n                    ])\n                  ])\n                ])\n              ])\n            ])\n          ])\n        ])\n\n      ]\n    )\n  ] |> html\nend\n\na = 234\n\nHTML(\" <p> $a hello world </p> \")","category":"page"},{"location":"generated/stipp/","page":"Stipple Ex","title":"Stipple Ex","text":"","category":"page"},{"location":"generated/stipp/","page":"Stipple Ex","title":"Stipple Ex","text":"This page was generated using Literate.jl.","category":"page"},{"location":"#Genie-Stipple","page":"Genie Stipple","title":"Genie Stipple","text":"","category":"section"},{"location":"","page":"Genie Stipple","title":"Genie Stipple","text":"This packages wraps LAMMPS","category":"page"},{"location":"generated/geni/","page":"Basic Genie","title":"Basic Genie","text":"EditURL = \"<unknown>/../examples/geni.jl\"","category":"page"},{"location":"generated/geni/","page":"Basic Genie","title":"Basic Genie","text":"This is example","category":"page"},{"location":"generated/geni/","page":"Basic Genie","title":"Basic Genie","text":"using Genie\n\na = 234 #hide\n\nhtml\"\"\" <iframe width=\"400\" height=\"300\" src=\"https://www.youtube.com/embed/a3ICNMQW7Ok?controls=0\"></iframe> \"\"\" #hide","category":"page"},{"location":"generated/geni/","page":"Basic Genie","title":"Basic Genie","text":"","category":"page"},{"location":"generated/geni/","page":"Basic Genie","title":"Basic Genie","text":"This page was generated using Literate.jl.","category":"page"}]
}
