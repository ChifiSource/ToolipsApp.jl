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

function anotherpage(c::Connection)
    maindiv::Component{:div} = div("anotherpage")
    contribtmd = tmd"""## another example"""
    push!(maindiv, contribtmd)
    maindiv::Component{:div}
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
"contribute" => contribute, #"anotherpage" => anotherpage
])

function main(c::Connection)
    #==
    Styles
    ==#
    fadeanim = fadein()
    tlapp_title::Component{:title} = title("tlapp_title", text = "toolips app !")
    charset_meta::Component{:meta} = meta(charset = "UTF-8")
    styles::Component{:sheet} = ToolipsDefaults.sheet("toolips app !")
    bodys = Style("body", "overflow-x" => "hidden")
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
    on_keydown(c, "ArrowLeft") do cm::ComponentModifier
        # get new pages
        selpagei = findall(x -> x[1] == cm[containerdiv]["page"], tlapp_pages)[1]
        selpage = tlapp_pages[selpagei][2](c)
        pagebehind = tlapp_pages[selpagei - 1][2](c)
        pageinfront = tlapp_pages[selpagei + 1][2](c)
        # change the styles:
        style!(cm, pagebehind,  "transition" => ".8s", "overflow-y" => "scroll",
        "display" => "inline-block !important", "width" => 100percent, "opacity" => 100percent)
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
            style!(cm, pageinfront, "overflow-x" => "hidden !important",
            "width" => "0", "transition" => "0s", "margin" => "0px !important", "opacity" => "0%", "margin-left" => "100%",
            "margin-top" => 10px, "padding" => 0px, "display" => "inline-block !important",
            "position" => "fixed")
            style!(cm, pagebehind, "overflow-x" => "hidden !important",
             "width" => "0", "transition" => "0s", "margin" => "0px !important", "opacity" => "0%", "margin-left" => "0%",
             "margin-top" => 10px, "padding" => 0px, "display" => "inline-block !important",
             "position" => "fixed")
            style!(cm, selpage, "transition" => "0s", "overflow-y" => "scroll",
            "display" => "inline-block !important", "width" => 100percent)
        end
        set_text!(cm, tlapp_title, "$(pagebehind.name) | toolips app !")
    end
    on_keydown(c, "ArrowRight") do cm::ComponentModifier
        # get new pages
        selpagei = findall(x -> x[1] == cm[containerdiv]["page"], tlapp_pages)[1]
        selpage = tlapp_pages[selpagei][2](c)
        pagebehind = tlapp_pages[selpagei - 1][2](c)
        pageinfront = tlapp_pages[selpagei + 1][2](c)
        # change the styles:
        style!(cm, pageinfront,  "transition" => ".8s", "overflow-y" => "scroll",
        "display" => "inline-block !important", "width" => 100percent, "opacity" => 100percent, "margin-left" => 0percent)
        style!(cm, selpage, "overflow-x" => "hidden !important",
        "width" => "0", "transition" => "0.8s", "margin" => "0px !important", "opacity" => "0%", "margin-right" => "100%",
        "margin-top" => 10px, "padding" => 0px, "display" => "inline-block !important",
        "position" => "fixed")
        # update attribute
        cm[containerdiv] = "page" => pageinfront.name
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
            style!(cm, pageinfront, "overflow-x" => "hidden !important",
            "width" => "0", "transition" => "0s", "margin" => "0px !important", "opacity" => "0%", "margin-left" => "100%",
            "margin-top" => 10px, "padding" => 0px, "display" => "inline-block !important",
            "position" => "fixed")
            style!(cm, pagebehind, "overflow-x" => "hidden !important",
             "width" => "0", "transition" => "0s", "margin" => "0px !important", "opacity" => "0%", "margin-left" => "0%",
             "margin-top" => 10px, "padding" => 0px, "display" => "inline-block !important",
             "position" => "fixed")
            style!(cm, selpage, "transition" => "0s", "overflow-y" => "scroll",
            "display" => "inline-block !important", "width" => 100percent)
        end
        set_text!(cm, tlapp_title, "$(pageinfront.name) | toolips app !")
    end
    push!(containerdiv, pagebehind, pageinfront, selpage)
    push!(bod, containerdiv)
    write!(c, bod)
end
