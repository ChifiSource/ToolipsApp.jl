using CarouselArrays
include("ExtensionGallery.jl")
tllogomain = img("tllogomain", src = "favicon.png", width = "30")
tlapplogo = img("tlapplogomain", src = "toolips/toolipsapp.png")
maingreeting = tmd"""[![version](https://juliahub.com/docs/Toolips/version.svg)](https://juliahub.com/ui/Packages/Toolips/TrAr4)
# Welcome to toolips app
This app is dedicated to the exploration of awesome toolips projects, extensions, and more!
This project contains
- an extension gallery
- (future) documentation pane [defer to doc.toolips.app](https://doc.toolips.app/) for now.
- (future) projects pane \
Use your right and left arrow keys to navigate the different showcases!
#### Toolips.jl in a nutshell:
- **Extendable** servers, components, and methods, they are all extendable!
- **Modular** applications. Toolips applications are regular Julia modules.
- **Declarative**, high-level syntax.
- **Asynchronous**. Run multiple functions at the same time as you serve to each incoming request.
- **Versatile**. Toolips.jl can be used for all scenarios, from full-stack web-development to APIs.
```julia
using Pkg; Pkg.add("Toolips")
```
"""
kbbbuttons() = link("kbbbuttons", rel = "stylesheet",
href = "https://unpkg.com/keyboard-css@1.2.4/dist/css/main.min.css")
function kbd(name::String, p::Pair{String, String} ...; args ...)
    kdbc = Component(name, "kbd", p ..., args ...)
    kdbc[:class] = "kbc-button"
    kdbc
end

function contribute(c::Connection)
    maindiv::Component{:div} = div("contribute")
    contribtmd = tmd"""## Contribute to toolips app!"""
    push!(maindiv, contribtmd)
    maindiv::Component{:div}
end

function history(c::Connection)
    maindiv::Component{:div} = div("history")
    contribtmd = tmd"""# The history of toolips app
    Welcome to toolips app, the app that started with the creation of toolips itself.
     Thanks to this close partnership, toolips and toolips app have evolved together,
     and what is representative of beauty and advancement coming to toolips app is also
     representative of what is happening to toolips. Let's first touch on why toolips itself
     was created. After all, there are other options for web-development framework, even
     in the world of Julia, so... why Toolips?
     ### Versatility
     While there are a lot of really fantastic web-development frameworks, such as
     `Genie.jl`, for Julia, many of these web-frameworks have very specific applications.
     Those who might want to create a web-app that is both fullstack and Science related
     might find scarce options in both this language, and many other languages. Toolips seeks
     to solve the classic `two framework problem`, where two frameworks are used to build
     different types of applications, and the solution to this for toolips is the extendable
     nature of the module. While the core remains quite minimalist, and at least relatively
     easy to maintain, other projects can be far more complex and complexity is completely
     optional and modular.
     ### Applications
     Another problem that toolips seeks to solve is `two language problem` when it comes
     to web-development. We have seen Julia solve similar problems to this when it comes
     to prototyping, and now Julia is solving the same problems in the world of web-development.
     A typical web-app with a data-engineered, or scientific back-end, involves three different
     applications that all work independently of one another. The first is the mostly client-side
     front-end development in Javascript. The frontend team then queries the backend team's API,
     who then queries the data and Scientific programming team's API. Needless to say, that is
     a lot of steps and a lot of different applications. Many different applications means
     more system resources and more potential for a break. Toolips comprises all web-apps into
         pure Julia code. While some Julia libraries do offer this to some extent, often the
         solution is writing JavaScript into Strings. While there is one potentially great
         solution to this problem, JSExpr, this is certainly not a concrete solution
         to interactive web-development for Julia.
    ## Humble beginnings
    """
    sc1 = img("historyone", src = "toolipsappsc.png")
    push!(maindiv, contribtmd, sc1)
    humbletmd = tmd"""Toolips started as a very different framework to what it is
    today. While some things remain the same, such as the functional core and the standard
    technique of writing to a defined value, old toolips code is almost unrecognizable.
        The app was wildly different at this stage, and it is pretty obvious this
        was a very early version, especially given the way that Components were written.
        ### Taking off with 0.1
        Toolips 0.1 is where the toolips we know and love today came into fruition.
        Prior to this, toolips was actually pretty lame. 0.0.7-0.0.9 saw the implementation
        of everything from `ServerExtensions` to `Connections` and `Components`. Slowly but
        surely, new extensions came along and Toolips gets better nearly everyday as a result.
        This culminated into `ToolipsApp2`."""
        push!(maindiv, humbletmd)
    maindiv::Component{:div}
end

function notapage(c::Connection)
    s = Style("h1.test", "color" => "orange")
    newhead = h("myhead", 1, text = "Page not found.")
    style!(newhead, s)
    write!(c, newhead)
end

function explorer(c::Connection)
    maindiv::Component{:div} = div("explore")
    foot::Component{:div} = div("mainfooter")
    style!(foot, "background-color" => "whitesmoke")
    footmessage::Component{:p} = p("mainfootmessage", text = "Github links: ")
    push!(foot, tllogomain, footmessage)
    leftkey_welcome::Component{:kbd} = kbd("leftkey_welcome", text = "<-")
    rightkey_welcome::Component{:kbd} = kbd("rightkey_welcome", text = "->")
    key_notifier::Component{:div} = div("key_notifier", align = "center")
    p_notifier::Component{:p} = p("p_notifier", text = "swipe, or press ")
    bold_knotifier::Component{:b} = Component("bold_knotifier", "b")
    bold_knotifier[:text] = "  to explore !"
    push!(key_notifier, p_notifier, leftkey_welcome, rightkey_welcome,
     bold_knotifier)
    push!(maindiv, tlapplogo, maingreeting, key_notifier, foot)
    maindiv::Component{:div}
end

function fadein()
    fl = Animation("from_left", length = 10.0)
    fl[:from] = "opacity" => 0percent
    fl[:to] = "opacity" => 100percent
    fl
end

tlapp_pages = CarouselArray(["explore" => explorer, "gallery" => gallery,
"contribute" => contribute, "history" => history
])

function main(c::Connection)
    #==
    Styles
    ==#
    fadeanim = fadein()
    tlapp_title::Component{:title} = title("tlapp_title", text = "toolips app !")
    charset_meta::Component{:meta} = meta(charset = "UTF-8")
    styles::Component{:sheet} = ToolipsDefaults.sheet("toolips app !")
    bodys = Style("body", "overflow-x" => "hidden", "overflow-y" => "scroll !important")
    push!(styles, bodys)
    push!(styles, tlapp_title)
    push!(styles, fadeanim)
    push!(styles, kbbbuttons())
    styles[:children]["p"]["font-size"] = "14pt"
    style!(styles[:children]["section"], "border-color" => "gray",
    "border-width" => 2px, "border-radius" => 10px, "margin" => 0px,
    "margin-left" => 0px)
    write!(c, styles)
    #==
    Universal app
    ==#
    tlappcursor = ToolipsDefaults.cursor("tlappcursor")
      leftkeybox = kbd("leftkeybox", text = "<-")
      style!(leftkeybox, "display" => "inline-block")
      rightkeybox = kbd("rightkeybox", text = "->", align = "left")
      style!(rightkeybox, "display" => "inline-block")
      leftkeybuttoncomp = a("leftkeybuttonlabel")
      rightkeybuttoncomp = a("rightkeybuttonlabel", align = "left")
      style!(leftkeybuttoncomp, "font-size" => "14pt !important",
      "font-weight" => "bold !important", "margin" => "15px")
      style!(rightkeybuttoncomp, "font-size" => "14pt !important",
      "font-weight" => "bold !important", "margin" => "15px")
      keybindings = div("keybindingsdiv", align = "center")
      style!(keybindings, "position" => "block", "top" => "0px", "width" => "99%",
      "margin" => "0px !important", "border-radius" => "15px !important",
      "border-radius" => "0px",
      "z-index" => "10", "height" => "4%")
      midbuttoncomp = a("centerkeybuttonlabel", align = "center")
      style!(midbuttoncomp, "font-size" => "15pt !important",
      "font-weight" => "bold !important", "margin" => "10px", "color" => "#8b7dc1")
      push!(keybindings, leftkeybox, leftkeybuttoncomp, midbuttoncomp, rightkeybuttoncomp, rightkeybox )
      bod = body("toolips_app")
      push!(bod, keybindings, tlappcursor)
      #==
      pages
      ==#
      args = getargs(c)
      selected_page::String = "explore"
      if :page in keys(args)
          selected_page = args[:page]
      end
      selpagei = findall(x -> x[1] == selected_page, tlapp_pages)[1]
      selpage = tlapp_pages[selpagei][2](c)
      pagebehind = tlapp_pages[selpagei - 1][2](c)
      pageinfront = tlapp_pages[selpagei + 1][2](c)
      containerdiv = div("maincontainer", page = selected_page)
      style!(containerdiv, "overflow-x" => "hidden !important")
      leftkeybuttoncomp[:text] = pagebehind.name
      rightkeybuttoncomp[:text] = pageinfront.name
      midbuttoncomp[:text] = selpage.name
    style!(pagebehind,
     "overflow-x" => "hidden !important",
     "width" => "0", "transition" => "0.8s", "margin" => "0px !important", "opacity" => "0%", "margin-left" => "0%",
     "margin-top" => 10px, "padding" => 0px, "display" => "inline-block !important",
     "position" => "fixed")
     style!(pageinfront,
      "overflow-x" => "hidden !important",
      "width" => "0", "transition" => "0.8s", "margin" => "0px !important", "opacity" => "0%", "margin-left" => "100%",
      "margin-top" => 10px, "padding" => 0px, "display" => "inline-block !important",
      "position" => "fixed")
     style!(selpage, "transition" => ".8s", "overflow-y" => "scroll",
     "display" => "inline-block !important", "width" => 100percent)
     #==
     Change pages
     ==#
    on_keydown(c, "ArrowLeft", ["maincontainer"]) do cm::ComponentModifier
        # get new pages
        selpagei = findall(x -> x[1] == cm[containerdiv]["page"], tlapp_pages)[1]
        selpage = tlapp_pages[selpagei][2](c)
        pagebehind = tlapp_pages[selpagei - 1][2](c)
        pageinfront = tlapp_pages[selpagei + 1][2](c)
        # change the styles:
        style!(cm, pagebehind,  "transition" => ".8s", "overflow-y" => "scroll",
        "display" => "inline-block !important", "width" => 100percent,
        "opacity" => 100percent, "position" => "relative", "margin-right" => 0percent)
        style!(cm, selpage, "overflow-x" => "hidden !important",
        "width" => "0", "transition" => "0.8s", "margin" => "0px !important", "opacity" => "0%", "margin-left" => "100%",
        "margin-top" => 10px, "padding" => 0px, "display" => "inline-block !important",
        "position" => "fixed")
        # update attribute
        cm[containerdiv] = "page" => pagebehind.name
        # callback for when transition completes
        observe!(c, cm, "obsl") do cm::ComponentModifier
            selpagei = findall(x -> x[1] == cm[containerdiv]["page"], tlapp_pages)[1]
            selpage = tlapp_pages[selpagei][2](c)
            pagebehind = tlapp_pages[selpagei - 1][2](c)
            pageinfront = tlapp_pages[selpagei + 1][2](c)
            # update key text
            set_text!(cm, leftkeybuttoncomp, pagebehind.name)
            set_text!(cm, midbuttoncomp, selpage.name)
            set_text!(cm, rightkeybuttoncomp, pageinfront.name)
            sleep(.8)
            style!(pageinfront, "overflow-x" => "hidden !important",
            "width" => "0", "transition" => "0s", "margin" => "0px !important", "opacity" => "0%", "margin-left" => "100%",
            "margin-top" => 10px, "padding" => 0px, "display" => "inline-block !important",
            "position" => "fixed")
            style!(pagebehind, "overflow-x" => "hidden !important",
             "width" => "0", "transition" => "0s", "margin" => "0px !important", "opacity" => "0%", "margin-left" => "0%",
             "margin-top" => 10px, "padding" => 0px, "display" => "inline-block !important",
             "position" => "fixed", "margin-right" => 100percent)
            style!(selpage, "transition" => "0s", "overflow-y" => "scroll !important",
            "display" => "inline-block !important", "width" => 100percent, "position" => "relative")
            set_children!(cm, containerdiv, [pagebehind, selpage, pageinfront])
        end
        set_text!(cm, tlapp_title, "$(pagebehind.name) | toolips app !")
    end
    on_keydown(c, "ArrowRight", ["maincontainer"]) do cm::ComponentModifier
        # get new pages
        selpagei = findall(x -> x[1] == cm[containerdiv]["page"], tlapp_pages)[1]
        selpage = tlapp_pages[selpagei][2](c)
        pagebehind = tlapp_pages[selpagei - 1][2](c)
        pageinfront = tlapp_pages[selpagei + 1][2](c)
        # change the styles:
        style!(cm, pageinfront,  "transition" => ".8s", "overflow-y" => "scroll",
        "display" => "inline-block !important", "width" => 100percent, "opacity" => 100percent, "position" => "relative",
        "margin-left" => 0percent, "margin-right" => 100percent)
        style!(cm, selpage, "overflow-x" => "hidden !important",
        "width" => "0", "transition" => "0.8s", "margin" => "0px !important", "opacity" => "0%",
        "margin-top" => 10px, "padding" => 0px, "display" => "inline-block !important",
        "position" => "fixed", "margin-left" => 100percent)
        # update attribute
        cm[containerdiv] = "page" => pageinfront.name
        # callback for when transition completes
        observe!(c, cm, "obsr") do cm::ComponentModifier
            selpagei = findall(x -> x[1] == cm[containerdiv]["page"], tlapp_pages)[1]
            selpage = tlapp_pages[selpagei][2](c)
            pagebehind = tlapp_pages[selpagei - 1][2](c)
            pageinfront = tlapp_pages[selpagei + 1][2](c)
            # update key text
            set_text!(cm, leftkeybuttoncomp, pagebehind.name)
            set_text!(cm, midbuttoncomp, selpage.name)
            set_text!(cm, rightkeybuttoncomp, pageinfront.name)
            sleep(.8)
            style!(pageinfront, "overflow-x" => "hidden !important",
            "width" => "0", "transition" => "0s", "margin" => "0px !important", "opacity" => "0%", "margin-left" => "100%",
            "margin-top" => 10px, "padding" => 0px, "display" => "inline-block !important",
            "position" => "fixed")
            style!(pagebehind, "overflow-x" => "hidden !important",
             "width" => "0", "transition" => "0s", "margin" => "0px !important", "opacity" => "0%", "margin-left" => "0%",
             "margin-top" => 10px, "padding" => 0px, "display" => "inline-block !important",
             "position" => "fixed")
            style!(selpage, "transition" => "0s", "overflow-y" => "scroll !important",
            "display" => "inline-block !important", "width" => 100percent, "position" => "relative")
            set_children!(cm, containerdiv, [pagebehind, selpage, pageinfront])
        end
        set_text!(cm, tlapp_title, "$(pageinfront.name) | toolips app !")
    end
    push!(containerdiv, pagebehind, pageinfront, selpage)
    push!(bod, containerdiv)
    write!(c, bod)
end
