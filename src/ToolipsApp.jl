# Welcome to your new Toolips server!
using Toolips
PUBLIC = "../public"
IP = "127.0.0.1"
PORT = 8003
function main()
        # Essentials
    routes = make_routes()
    global LOGGER = Logger(out = "/logs/log.txt")
    server_template = ServerTemplate(IP, PORT, routes, logger = LOGGER)
        # Fun stuff (examples !, you should probably delete these.)
    delayed = Route("/delay", fn(delay))
    suicide = Route("/suicide", fn(suicide_fn))
    arguments = Route("/args", fn(args))
    buttonr = Route("/core/fn", fn(button))
    server_template.add(delayed)
    server_template.add(suicide)
    server_template.add(arguments)
    server_template.add(buttonr)
    global TLSERVER = server_template.start()
    return(TLSERVER)
end


# Routes
function make_routes()
        # Pages
    four04 = html("<h1>404, Page not found!</h1>")
    index = html("<h1>Hello world!</h1></br><p>Not so exciting, <b>is it?</b>
     well, it is a work in progress :p.</p>")
        # Routes
    routes = []
    homeroute = Route("/", index)
    four04route = Route("404", four04)
    push!(routes, homeroute)
    push!(routes, four04route)
    routes
end


suicide_fn = http -> stop!(TLSERVER)

args = http -> string(getargs(http))

function delay(http::Any)
    LOGGER.log(http, "Hi, I like pickles!")
        for character in "Hello World!"
            write(http, string(character))
            sleep(1)
        end
end
# Not actual code
using HTTP
using HTTP: IOExtras
using Base.Threads: @spawn
function observe(id, http)
    startread(http)
end
DATA = []
function button(http::Any)
    button_html = """<button id = "mybutton" name = "1" onclick="this.name = 0">Just click it</button>"""
    write(http, button_html)
    HTTP.Streams.closebody(http)
    observ = 1
    id = "mybutton"
    unmark(http)
    push!(DATA, read(http))
    @spawn while observ == 1
        observe(id, http)
    end
end
main()
