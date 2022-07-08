#==
dev.jl is an environment file. This file loads and starts servers, and
defines environmental variables, setting the scope a lexical step higher
with modularity.
==#
using Pkg; Pkg.activate(".")
using Toolips
using ToolipsSession
using ToolipsRemote
using ToolipsUploader
using Revise
using ToolipsApp

IP = "127.0.0.1"
PORT = 8000


extensions = [Logger(), Session(["/", "/extensions"]), Files(), Remote(), Uploader()]

ToolipsAppServer = ToolipsApp.start(IP, PORT, extensions)
