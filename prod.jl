using Toolips
IP = "127.0.0.1"
PORT = 8000
extensions = [Logger(), Files("public")]
include("src/ToolipsApp2.jl")
