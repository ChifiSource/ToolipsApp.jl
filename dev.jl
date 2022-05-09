using Toolips
IP = "127.0.0.1"
PORT = 8000
extensions = Dict(:logger => Logger())
include("src/ToolipsApp2.jl")
