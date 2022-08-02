
#==
Toolips
    Markdown
==#
markdown_logo = img("markdownlogo", src = "toolips/toolipsmarkdown.png", width = 300)
markdown_tmd = tmd"""# Markdown
Toolips markdown allows for the conversion of Julia strings
into HTML text. It is a great way to get text from a Markdown format to a
Component format. The module only has one method and one macro, both named `tmd`.
We can make `tmd` as we would any other Component, or by using the `tmd_str`
macro.
        ```julia
        function home(c::Connection)
                mymd = tmd("nameoftmd", "### example!")
                write!(c, mymd)
        end
        ```
        ### example!
        ```julia
        mymd = tmd"**this** is **tmd**"
        ```
        **this** is **tmd**.\n All of the markdown for toolips app is written
        using toolips markdown!"""
function extension_section(name::String, logodir::String, md::Component,
    examples::Component)
    sec = section(name, align = "left")
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
markdown file, and the markdown file is prompty returned into a div with
toolips markdown. The module includes both a polling file uploader and a regular
uploader, for all of your uploading needs. Best of all, the FileModifier cleans
up any files that are created by Uploader unless you copy them away!"""

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
    tllogo = img("tllogo", src = "extensiongallery.png")
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
    session_example = section()
    session_tmd = tmd"""# Toolips Session
    Toolips session provides toolips with full-stack capabilities using declarative
    mutating syntax. The module primarily provides the method `on`, along with
    the `Session` extension and `Modifier` abstract type. Modifiers are passed
    as an argument to functions that are recieved using event functions, such
    as `on`.
    ```julia
    function home(c::Connection)
            on(c, "load") do cm::ComponentModifier
                    alert!(cm, "loaded!")
            end
    end
    ```
    The Session extension tracks individual client's events with an iptable.
    This allows for the creation of one-page websites and interactivity without
            the need for making any sort of GET requests."""

    sessionsection = extension_section("session", "toolips/toolipssession.png",
            session_tmd, session_example)
    push!(sections, sessionsection)
    #==
    Defaults
    ==#
    defaults_example = section("defaults_example")
    defaults_tmd = tmd"""# Toolips Defaults
    Toolips Defaults brings tons of additional components, as well as default
    styles and ColorSchemes.
    ## Styles
    Toolips defaults provides some default styles to help get you started.
    Below is a preview of the default styles which are not applied to Components.
    Even better, this `sheet` method call is customizable! We can provide
    it with ColorSchemes, and edit it like any other Style Component to set the
    default styles for our website. For example, in the ToolipsApp.jl module
        (the website you are on, welcome)
        ```julia
        s = sheet("mystyle")
        ```
    ## Default Components
    Toolips defaults provides a number of default components, as well a
    functions for [ToolipsSession](/?page=extensions&selected=session), `update!`.
            Some notable examples include `anydiv`s, which allow you to comprise
            regular Julia types into a toolips div Component with a `MIME`. There
            are also audio Components, input Components, a `cursor` Component, and
            more!
    """
    defaultssection = extension_section("defaults", "toolips/toolipsdefaults.png",
            defaults_tmd, defaults_example)
    push!(sections, defaultssection)
    #==
    Markdown
    ==#
    markdownsection = section("markdown", align = "left")
    markdownviewer = div("mdcreator", align = "left")
    style!(markdownviewer, "background-color" => "white", "border-style" => "solid",
    "border-width" => "2px", "border-color" => "gray", "border-radius" => "10px",
     "transition" => "1s")
    mdbox = div("mdbox", contenteditable = true, text = "# ToolipsMarkdown Example",
    align = "left")
    style!(mdbox, "border-width" => "1px", "border-color" => "orange", "border-style" => "dashed",
    "display" => "inline-block", "overflow-y" => "scroll", "width" => "50%",
    "height" => "200px")
    tmdbox = div("tmdbox")
    style!(tmdbox, "border-width" => "1px", "border-color" => "orange", "border-style" => "dashed",
    "display" => "inline-block", "overflow-y" => "scroll", "width" => "50%",
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
    Base64
    ==#
    b64_example = section()
    b64_tmd = tmd"""# Toolips Base64
    Toolips Base64 allows the transition of raw image data into a toolips Component
    via the Base64 format. This is useful for things like image editors, computer
    vision models, and plotting. For example, `PyPlot.jl` can only output
    visualizations to a PNG file, so being able to make a Base64 image out of
    this data is very useful. Doing so is also incredibly easy, just make an img
    Component using the `base64img` method.
    ```julia
    ```
    """
    b64section = extension_section("base64", "toolips/toolipsbase64.png",
            b64_tmd, b64_example)
    push!(sections, b64section)
    #==
    Uploader
    ==#
    uploadersection = section("uploader", align = "left")
    uploaderbox = div("uploaderbox")
    style!(uploaderbox, "background-color" => "white", "border-style" => "solid",
    "border-width" => "2px", "border-color" => "gray", "border-radius" => "10px",
    "overflow-y" => "scroll", "height" => "0px", "transition" => "1s")
    myuploader = ToolipsUploader.fileinput(c,
    "pizza") do fm
        try
            readstr = read(fm, String)
            style!(fm, uploaderbox, "height" => "250px")
            set_children!(fm, "uploaderbox", components(tmd("customtmd", readstr)))
        catch
            rm(fm.file.dir)
            errora = a("errora",
            text = "Error! You probably uploaded the wrong type of file, didn't you?")
            style!(errora, "color" => "red")
            style!(fm, uploaderbox, "height" => "20px")
            set_children!(fm, "uploaderbox", components(errora))
        end
    end
    push!(uploadersection, uploader_logo, uploader_vlink, uploader_tmd,
     myuploader, uploaderbox)
     push!(sections, uploadersection)
     #==
     Memwrite
     ==#
     memwrite_example = section()
     memwrite_tmd = tmd"""# Toolips MemWrite

     """
     memwritesection = extension_section("memwrite", "toolips/toolipsmemwrite.png",
             memwrite_tmd, memwrite_example)
     push!(sections, memwritesection)
     #==
     Remote
     ==#
     remote_example = section()
     remote_tmd = tmd"""# Toolips Remote
     Toolips Remote is a ServerExtension that lets you connect your toolips app
     to your Julia REPL. Usage is simple, just add the `Remote` extension to your
     `ToolipsServer`, then use the `connect` method to connect! `Remote` uses
     **256-bit** hashing automatically, so your passwords are protected with
     very minimal effort!
     """
     remotesection = extension_section("remote", "toolips/toolipsremote.png",
             remote_tmd, remote_example)
     push!(sections, remotesection)
     #==
     Export
     ==#
     export_example = section()
     export_tmd = tmd"""# Toolips Export
     Toolips Export lets you create compiled executables using Toolips! Using this
     module, you can export your toolips app to
     - compiled desktop applications
     - compiled servers
     - shared libraries\n
     With future plans for
    - android
    - IOS\n
    in the pipeline!
     """
     exportsection = extension_section("export", "toolips/toolipsexport.png",
             export_tmd, export_example)
     push!(sections, exportsection)
     #==
     Multiple Dispatch
     ==#
     dispatch_example = section()
     dispatch_tmd = tmd"""# Toolips Multiple Dispatch
     Toolips Multiple dispatch is still a **work in progress**.
     """
     dispatchsection = extension_section("dispatch", "toolips/toolipsmultipledispatch.png",
             dispatch_tmd, dispatch_example)
     push!(sections, dispatchsection)
     #==
     UDP
     ==#
     udp_example = section()
     udp_tmd = tmd"""# Toolips UDP
     Toolips UDP is still a **work in progress**.
     """
     udpsection = extension_section("udp", "toolips/toolipsudp.png",
             udp_tmd, udp_example)
     push!(sections, udpsection)
     #==
     Manager
     ==#
     manager_example = section()
     manager_tmd = tmd"""# Toolips Manager
     Toolips Manager is still a **work in progress**.
     """
     managersection = extension_section("manager", "toolips/toolipsmanager.png",
             manager_tmd, manager_example)
     push!(sections, managersection)
     #==
     interpolator
     ==#
     interpolator_example = section()
     interpolator_tmd = tmd"""# Toolips Interpolator
     The toolips interpolator allows for the interpolation of HTML files with
             values and Components. This is all done through the `InterpolatedFile` `Servable`.
             We provide Components as positional arguments and values as key-word arguments
             with their HTML names being the keys. Here is an example HTML file to
             be interpolated:
             ##### index.html
             ```html
             <p>The cost is $price</p>
             $product
             ```
             We would interpolate this like so:
             ##### Example.jl
             ```julia
             function home(c::Connection)
                    productdesc = div("product")
                    hed = h("headinglabel", 1, text = "example")
                    push!(productdesc, hed)
                    file = InterpolatedFile("index.html", productdesc, price = 500)
                    write!(c, InterpolatedFile)
             end
             ```
     """
     interpolatorsection = extension_section("interpolator", "toolips/toolipsinterpolator.png",
             interpolator_tmd, interpolator_example)
     push!(sections, interpolatorsection)
     #==
     ptp
     ==#
     ptp_example = section()
     ptp_tmd = tmd"""# Toolips Peer to Peer
     Toolips PTP is still a **work in progress**.
     """
     ptpsection = extension_section("ptp", "toolips/toolipsptp.png",
             ptp_tmd, ptp_example)
     push!(sections, ptpsection)
     #==
     canvas
     ==#
     canvas_example = section()
     canvas_tmd = tmd"""# Toolips Canvas
     Toolips PTP is still a **work in progress**. (this one is going to be a while...)
     """
     canvassection = extension_section("canvas", "toolips/toolipscanvas.png",
             canvas_tmd, canvas_example)
     push!(sections, canvassection)
     #==
     auth
     ==#
     auth_example = section()
     auth_tmd = tmd"""# Toolips Auth
     Toolips PTP is still a **work in progress**.
     """
     authsection = extension_section("auth", "toolips/toolipsauth.png",
             auth_tmd, auth_example)
     push!(sections, authsection)
     #==
     Contribute
     ==#
     contrib_example = section()
     contrib_tmd = tmd"""# Contribute!
     Contribute your own extension! You can create an extension using
     [this guide](https://doc.toolips.app/tutorial/extensions?page=3). They can also
     be featured here on toolips app, the instructions for which are available in
     the [toolips app contribution documentation](https://toolips.app/?page=contribute)
     """
     contribsection = extension_section("contribute", "toolips/toolipsapp.png",
             contrib_tmd, contrib_example)
     push!(sections, contribsection)
    #==
    Main
    ==#
    maindiv = div("gallery", align = "center", selected = "#", "overflow-x" => "hidden !important")
    overviewbuttons = div("overviewbuttons", align = "center")
    backbutton = button("backbutton", text = "go back")
    backbutton["width"] = "100%"
    style!(backbutton, "background-color" => "red !important")
    on(c, backbutton, "click") do cm::ComponentModifier
        set_children!(cm, maindiv, sections)
        cm[maindiv] = "selected" => "#"
    end
    backdiv = div("backdiv", align = "left")
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
    arguments = getargs(c)
    if :selected in keys(arguments)
            maindiv[:children] = [backdiv, sections[arguments[:selected]]]
    end
    maindiv
end
