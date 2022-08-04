module ToolipsDocs
using Toolips
using ToolipsSession
using ToolipsInterpolator

overviewr = route("/overview/") do c::Connection
    on(c, "load") do cm::ComponentModifier
        alert!(cm, "what!")
    end
    examplepdiv = div("examplepdiv")
    style!(examplepdiv, "border-width" => 2px, "border-style" => "solid", "border-color" => "lightblue") # <- Styles examplebdiv
    myp = p("exampleb", text = "hello world!")
    push!(examplepdiv, myp) # <- puts myb into examplebdiv
    overv = InterpolatedFile("public/docs/overview/index.html", examplepdiv)
    write!(c, overv)
end

developerapi = route("/developer_api/", c::Connection -> write!(c,
 File("public/docs/overview.html")))

home = route("/", c::Connection -> write!(c, File("public/docs/index.html")))

fourofour = route("404") do c::Connection

end

sessionr = route("/extensions/toolips_session") do c::Connection

end

rs = [home, sessionr,
overviewr, developerapi, fourofour]
function start(IP::String = "127.0.0.1", PORT::Integer = 8000)
    extensions = [Logger(), Session(["/"]), Files("public/docs")]
    server = ServerTemplate(IP, PORT, rs, extensions = extensions)
    server.start()
end
end
