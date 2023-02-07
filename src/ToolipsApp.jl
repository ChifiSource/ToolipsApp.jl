"""
Created in March, 2022 by
[chifi - an open source software dynasty.](https://github.com/orgs/ChifiSource)
by team
[toolips](https://github.com/orgs/ChifiSource/teams/toolips)
This software is MIT-licensed.
### ToolipsApp
ToolipsApp is a showcase of the capabilities of toolips as well as a documentation
hub!
##### Module Composition
- [**ToolipsApp**](https://github.com/ChifiSource/ToolipsApp.jl)
"""
module ToolipsApp
using Toolips
using ToolipsSession
using ToolipsDefaults
using ToolipsRemote
using ToolipsBase64
using ToolipsMarkdown
include("home.jl")

"""
### reroute(ws::WebServer)
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
homeroute = route("/", main)
fourofour = route("404", notapage)
rs = routes(homeroute, fourofour)
extensions = [Logger(), Session(["/", "/extensions"]), Files("public/tlapp"), Remote()]
function start(IP::String = "127.0.0.1", PORT::Integer = 8000)
    server = WebServer(IP, PORT, routes = rs, extensions = extensions)
    server.start()
    server
end
end # - module
