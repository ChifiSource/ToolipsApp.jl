"""
Created in March, 2022 by
[chifi - an open source software dynasty.](https://github.com/orgs/ChifiSource)
by team
[toolips](https://github.com/orgs/ChifiSource/teams/toolips)
This software is MIT-licensed.
### ToolipsApp

##### Extensions
ToolipsApp is a showcase of the capabilities of Toolips with extensions, as well
as just how easy to make extensions really are. That in mind, thos application
features several ServerExtensions, and Servable extensions.
-
-
-
##### Module Composition
- [**Toolips**](https://github.com/ChifiSource/ToolipsApp.jl)
"""
module ToolipsApp
using Toolips, ToolipsSession
using JSON
include("home.jl")
"""
### rerooute(ws::WebServer)
This function updates the routes with the files available during server operation.
You can of course still create routes in Connections and with the web-server.
This is meant to be used when developing a project, really, as it allows you to
use Revise.jl to update the functions with this method.
#### example
```
using Revise # <- Important! Use revise first, or the functions will not change!
using ToolipsApp

ws = ToolipsApp.start()

typoef(ws)

Toolips.WebServer

ToolipsApp.reroute!(ws)

# Your server's routes are now updated!
```

"""
function reroute!(ws::WebServer)
    route!(ws, "/", main)
end

function start(IP::String = "127.0.0.1", PORT::Integer = 8000,
    extensions::Vector = [Session(), Logger()])
    fourofour = route("404") do c
        write!(c, p("404message", text = "404, not found!"))
    end
    homeroute = route("/", main)
    rs = routes(homeroute, fourofour)
    server = ServerTemplate(IP, PORT, rs, extensions = extensions)
    server.start()
end

end # - module
