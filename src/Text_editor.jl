header = html("<h3>Open a file.</h3>")
function file_buttons(http)
    cd(PUBLIC * "/texts")
    for dir in readdir()
        button = """<a href="/text-editor/open?$dir">$dir</a>"""
        write(http, "   " * button)
    end
    cd("../../")
    ""
end
te = Page([header, fn(file_buttons)], "Toolips Text Editor")

function opener(http)
    args = getargs(http)
    write(http, "<h3>$args<h3>")
    text = read(PUBLIC * "/texts/" * args, String)
    textbox = TextArea("textle", maxlength = 1000, cols = 50, rows = 50,
    text = text)
    btton = Button("fname", label = "Save text", value = args)
    txtboxform = Form(textbox, btton, action = "/text-editor/save")
    txtboxform.f(http)
end

texteditsc = Page([fn(opener)])
function saver(http)
    args = getargs(http)
    bothvals = split(args, "&")
    nameval = split(bothvals[2], "=")
    write(http, "Saving file " * nameval[2])
    fname = nameval[2]
    nameval = split(bothvals[1], "=")
    out = replace(nameval[2], "%" => " ")
    replace(nameval[2], "+" => " ")
    open(PUBLIC * "/texts/" * fname, "w") do o
        write(o, out)
    end
    write(http, "File saved!")
    sleep(2)
    """<meta http-equiv="Refresh" content="0; url='/text-editor/open?$fname'" />"""
end
