using Weave
using Genie, Genie.Router, Genie.Renderer.Json, Genie.Requests

weave("x.jmd"; out_path=pwd()*"/public/")

route("/") do
   serve_static_file("x.html")
end

Genie.startup(async = false)