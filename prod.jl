using Pkg; Pkg.activate(".")
using Toolips

IP = "127.0.0.1"
PORT = 8001
extensions = Dict(:logger => Logger(), :public => Files("public"))
using ToolipsApp
ToolipsAppServer = ToolipsApp.start(IP, PORT, extensions)
