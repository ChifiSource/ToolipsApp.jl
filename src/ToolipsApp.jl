# Welcome to your new Toolips server!
using Toolips
PUBLIC = "public"
IP = "127.0.0.1"
PORT = 8003
include("Home.jl")
include("Text_editor.jl")
function main()
        # Essentials
    global LOGGER = Logger()
    routes = []
    server_template = ServerTemplate(IP, PORT, routes , logger = LOGGER)
    server_template.add(Route("404", fn(four04)))
    server_template.add(Route("/", home))
    server_template.add(Route("/text-editor", te))
    server_template.add(Route("/text-editor/open", texteditsc))
    server_template.add(Route("/text-editor/save", fn(saver)))
    global TLSERVER = server_template.start()
    return(TLSERVER)
end
four04 = http -> write(http, "<h1>404, not found</h1>")
main()
