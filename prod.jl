using Pkg; Pkg.activate(".")
using Toolips
using ToolipsSession
using ToolipsRemote
using ToolipsUploader
using Revise
using ToolipsApp

DOCIP = "127.0.0.1"
DOCPORT = 8001
IP = "127.0.0.1"
PORT = 8000
ToolipsAppServer = ToolipsApp.start(IP, PORT)
ToolipsDocsServer = ToolipsDocs.start(DOCIP, DOCPORT)
