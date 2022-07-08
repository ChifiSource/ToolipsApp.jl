using Pkg; Pkg.activate(".")
using Toolips
using ToolipsSession
using ToolipsRemote
using ToolipsUploader
using Revise
using ToolipsApp

IP = "127.0.0.1"
PORT = 8001


extensions = [Logger(), Session(["/", "/extensions"]), Files(), Remote(), Uploader()]
ToolipsAppServer = ToolipsApp.start(IP, PORT, extensions)
