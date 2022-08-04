using Pkg; Pkg.activate(".")
using Toolips
using Revise
using ExampleApp

IP = "127.0.0.1"
PORT = 8000
ExampleAppServer = ExampleApp.start(IP, PORT)
