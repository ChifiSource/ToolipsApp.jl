#==
dev.jl is an environment file. This file loads and starts servers, and
defines environmental variables, setting the scope a lexical step higher
with modularity.
==#
using Pkg; Pkg.activate(".")
using Toolips
using Revise
using ToolipsSession
using ToolipsApp

IP = "127.0.0.1"
PORT = 8000

function remote_control(c::Connection)
    input = getarg(c, :in)
    c[:logger].log("input")
end


extensions = [Logger(), Session(), Files()]

ToolipsAppServer = ToolipsApp.start(IP, PORT, extensions)
