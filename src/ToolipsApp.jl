function main(routes)
    server = ServerTemplate(IP, PORT, routes, extensions = extensions)
    server.start()
end


                   #      vvv ?(Connection)
hello_world = route("/") do c
    write!(c, P("hello", text = "hello world!"))
end

fourofour = route("404", P("404", text = "404, not found!"))
rs = routes(hello_world, fourofour)
main(rs)
