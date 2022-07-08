
#==
Toolips
    Markdown
==#
markdown_logo = img("markdownlogo", src = "toolips/toolipsmarkdown.png", width = 300)
markdown_tmd = tmd"""# Markdown
hello world"""
function extension_section(name::String, logodir::String, md::Component,
    examples::Component)
    sec = section("name", align = "left")
    push!(sec, img("logo$name", src = logodir), md, examples)
    sec
end
#==
Toolips
    Uploader
==#
uploader_logo = img("uploaderlogo", src = "toolips/toolipsuploader.png", width = 200)
uploader_vlink = tmd"""[![version](https://juliahub.com/docs/Toolips/version.svg)](https://juliahub.com/ui/Packages/Toolips/TrAr4)"""
uploader_tmd = tmd"""# Uploader
The toolips uploader extension makes it incredibly easy to upload and work with
files from a client's machine. Below is an example where you can upload a
markdown file, and the markdown file is prompty returned into a divider with
toolips markdown."""

"""
gallery(c::Connection) -> _
--------------------
The home function is served as a route inside of your server by default. To
    change this, view the start method below.
"""
function gallery(c::Connection)
    #==
    Overview
    ==#
    greet_tmd = tmd"""# Toolips Extension Gallery
    Hello, welcome to the toolips extension gallery! This website demonstrates the
    capabilities of all the toolips extensions that are currently curated. Feel free
    to browse the amazing Components and capabilities that are available with each
    extension! **more coming soon !**
    #### jump to:
    """

    greet_tmd["align"] = "left"
    style!(greet_tmd, "margin-left" => "50px")
    tllogo = img("tllogo", src = "toolips/toolipsapp.png")
    overview = section("overview", align = "center")
    push!(overview, tllogo, greet_tmd)
    #==
    Sections
    ==#
    sections = components()
    push!(sections, overview)
    #==
    Session
    ==#
    sessionsection = section("session")
    #==
    Markdown
    ==#
    markdownsection = section("markdown")
    markdownviewer = divider("mdcreator", align = "left")
    style!(markdownviewer, "background-color" => "white", "border-style" => "solid",
    "border-width" => "2px", "border-color" => "gray", "border-radius" => "10px",
     "transition" => "1s")
    mdbox = divider("mdbox", contenteditable = true, text = "# ToolipsMarkdown Example",
    align = "left")
    style!(mdbox, "border-width" => "1px", "border-color" => "orange", "border-style" => "dashed",
    "display" => "inline-block", "overflow-y" => "scroll", "width" => "500px",
    "height" => "200px")
    tmdbox = divider("tmdbox")
    style!(tmdbox, "border-width" => "1px", "border-color" => "orange", "border-style" => "dashed",
    "display" => "inline-block", "overflow-y" => "scroll", "width" => "900px",
    "height" => "200px")
    push!(tmdbox, tmd("mytmd", "# ToolipsMarkdown Example"))
    on(c, mdbox, "keydown") do cm::ComponentModifier
        input = cm[mdbox]["text"]
        set_children!(cm, tmdbox, components(tmd("mytmd", input)))
    end
    push!(markdownviewer, mdbox, tmdbox)
    push!(markdownsection, markdown_logo, markdown_tmd, markdownviewer)
    push!(sections, markdownsection)
    #==
    Uploader
    ==#
    uploadersection = section("uploader")
    uploaderbox = divider("uploaderbox")
    style!(uploaderbox, "background-color" => "white", "border-style" => "solid",
    "border-width" => "2px", "border-color" => "gray", "border-radius" => "10px",
    "overflow-y" => "scroll", "height" => "0px", "transition" => "1s")
    myuploader = ToolipsUploader.fileinput(c,
    "pizza") do cm::ComponentModifier, file::String
        try
            readstr = read(file, String)
            style!(cm, uploaderbox, "height" => "250px")
            set_children!(cm, "uploaderbox", components(tmd("customtmd", readstr)))
        catch
            rm(file)
            errora = a("errora",
            text = "Error! You probably uploaded the wrong type of file, didn't you?")
            style!(errora, "color" => "red")
            style!(cm, uploaderbox, "height" => "20px")
            set_children!(cm, "uploaderbox", components(errora))
        end
    end
    push!(uploadersection, uploader_logo, uploader_vlink, uploader_tmd,
     myuploader, uploaderbox)
     push!(sections, uploadersection)
     #==
     Contribute
     ==#

    #==
    Main
    ==#
    maindiv = divider("maindiv", align = "center", selected = "#")
    style!(maindiv, "border-radius" => "25px", "border-style" => "solid",
    "border-color" => "lightblue", "margin-top" => "100px",
    "background" => "linear-gradient(#99CCED, #C4FEFF)", "transition" => "3s",
    "margin-left" => "0px", "margin" => "0px")
    overviewbuttons = divider("overviewbuttons", align = "center")
    backbutton = button("backbutton", text = "go back")
    backbutton["width"] = "100%"
    style!(backbutton, "background-color" => "red !important")
    on(c, backbutton, "click") do cm::ComponentModifier
        set_children!(cm, "maindiv", sections)
        cm["maindiv"] = "selected" => "#"
    end
    backdiv = divider("backdiv", align = "left")
    push!(backdiv, backbutton)
    for section in sections
        sectionname = section.name
        secbut = button("button$sectionname", text = "$sectionname")
        on(c, secbut, "click") do cm::ComponentModifier
            set_children!(cm, maindiv, components(backdiv, sections["$sectionname"]))
            cm["maindiv"] = "selected" => "$sectionname"
        end
        push!(overview, secbut)
    end
    maindiv[:children] = sections
    maindiv
end
