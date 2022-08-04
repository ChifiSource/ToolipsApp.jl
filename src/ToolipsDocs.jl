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
   #c- v vvv Component  v -event

    overv = InterpolatedFile("public/docs/overview/index.html", examplepdiv)
    write!(c, overv)
end

developerapi = route("/developer_api/", c::Connection -> write!(c,
 File("public/docs/overview.html")))

home = route("/", c::Connection -> write!(c, File("public/docs/index.html")))

fourofour = route("404") do c::Connection

end

corer = route("/core/") do c::Connection
    coref = File("public/docs/core/index.html")
    write!(c, coref)
end

interr = route("/interface/") do c::Connection
    coref = File("public/docs/interface/index.html")
    write!(c, coref)
end

examples = route("/examples/") do c::Connection

end

#== Extensions
==#
sessionr = route("/extensions/toolips_session/") do c::Connection
    interp = File("public/docs/extensions/toolips_session/index.html")
    write!(c, interp)
end
defaultsr = route("/extensions/toolips_defaults/",
 c::Connection -> write!(c, File("public/docs/extensions/toolips_defaults/index.html")))

markdownr = route("/extensions/toolips_markdown/",
  c::Connection -> write!(c, File("public/docs/extensions/toolips_markdown/index.html")))

b64r = route("/extensions/toolips_base64/",
    c::Connection -> write!(c, File("public/docs/extensions/toolips_base64/index.html")))

memwriter = route("/extensions/toolips_memwrite/",
c::Connection -> write!(c, File("public/docs/extensions/toolips_memwrite/index.html")))

remoter = route("/extensions/toolips_remote/",
c::Connection -> write!(c, File("public/docs/extensions/toolips_remote/index.html")))

uploaderr = route("/extensions/toolips_uploader/",
c::Connection -> write!(c, File("public/docs/extensions/toolips_uploader/index.html")))

interpolatorr = route("/extensions/toolips_interpolator/",
c::Connection -> write!(c, File("public/docs/extensions/toolips_interpolator/index.html")))
exportr = route("/extensions/toolips_export/",
c::Connection -> write!(c, File("public/docs/extensions/toolips_export/index.html")))
rs = [home, overviewr, corer, interr, developerapi, examples, sessionr, defaultsr,
markdownr, b64r, memwriter, remoter, uploaderr, interpolatorr, exportr,
fourofour]
function start(IP::String = "127.0.0.1", PORT::Integer = 8000)
    extensions = [Logger(), Session(["/examples/"]), Files("public/docs")]
    server = ServerTemplate(IP, PORT, rs, extensions = extensions)
    server.start(); server
end
end
