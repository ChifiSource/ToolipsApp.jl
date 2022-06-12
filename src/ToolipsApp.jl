module ToolipsApp
using Toolips
using JSON
include("home.jl")

function reroute!(ws::WebServer)
    route!(ws, "/", home)
    route!(ws, "/gallery", gallery)
end

function start(IP::String, PORT::Integer,
    extensions::Dict = Dict(:files => Files("public"), :logger => Logger())
    fourofour = route("404") do c
        write!(c, p("404message", text = "404, not found!"))
    end
    homeroute = route("/", home)
    galleryroute = route("/gallery", gallery)
    teamroute = route("/team", team)
    rs = routes(homeroute, fourofour, galleryroute, teamroute)
    server = ServerTemplate(IP, PORT, rs, extensions = extensions)
    server.start()
end

end # - module
