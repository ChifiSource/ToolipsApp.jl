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
using Base.Threads: @spawn
include("src/ToolipsDocs.jl")
using Main.ToolipsDocs

DOCIP = "127.0.0.1"
DOCPORT = 8001
IP = "127.0.0.1"
PORT = 8000
ToolipsAppServer = ToolipsApp.start(IP, PORT)
ToolipsDocsServer = ToolipsDocs.start(DOCIP, DOCPORT)
