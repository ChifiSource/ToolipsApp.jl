#==
dev.jl is an environment file. This file loads and starts servers, and
defines environmental variables, setting the scope a lexical step higher
with modularity.
==#
using Pkg; Pkg.activate(".")
using Toolips
using Revise

IP = "127.0.0.1"
PORT = 8000
extensions = Dict(:logger => Logger(), :public => Files("public"))
using ToolipsApp
ToolipsAppServer = ToolipsApp.start(IP, PORT, extensions)
