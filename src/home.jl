include("ExtensionGallery.jl")
tllogomain = img("tllogomain", src = "favicon.png", width = "30")
tlapplogo = img("tlapplogomain", src = "toolips/toolipsapp.png")
maingreeting = tmd"""[![version](https://juliahub.com/docs/Toolips/version.svg)](https://juliahub.com/ui/Packages/Toolips/TrAr4) \
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

function main(c::Connection)
    tlapp_title = title("tlapp_title", text = "toolips app !")
    charset_meta = meta(charset = "UTF-8")
    tlappcursor = ToolipsDefaults.cursor("tlappcursor")
    # Styles
    styles = stylesheet("toolips app !")
    bodys = Style("body", "overflow-x" => "hidden", "overflow-y" => "hidden")
    push!(styles, bodys)
    push!(styles, tlapp_title)
    push!(styles, kbbbuttons())
    styles[:children]["p"]["font-size"] = "14pt"
    style!(styles[:children]["section"], "border-color" => "gray",
    "border-width" => 2px, "border-radius" => 10px, "margin" => 0px,
    "margin-left" => 0px)
    write!(c, styles)
    maindiv = div("pagemain", page = "home")
      leftkeybox = kbd("leftkeybox", text = "<-")
      style!(leftkeybox, "display" => "inline-block")
      rightkeybox = kbd("rightkeybox", text = "->", align = "left")
      style!(rightkeybox, "display" => "inline-block")
      leftkeybuttoncomp = a("leftkeybuttonlabel", text = "extension gallery", )
      rightkeybuttoncomp = a("rightkeybuttonlabel", text = "toolips docs",
      align = "left")
      style!(leftkeybuttoncomp, "font-size" => "14pt !important",
      "font-weight" => "bold !important", "margin" => "10px")
      style!(rightkeybuttoncomp, "font-size" => "14pt !important",
      "font-weight" => "bold !important", "margin" => "10px")
      keybindings = div("keybindingsdiv", align = "center")
      style!(keybindings, "position" => "block", "top" => "0px", "width" => "99%",
      "margin" => "0px !important", "border-radius" => "15px !important",
      "border-radius" => "0px",
      "z-index" => "10", "height" => "4%")
      push!(keybindings, leftkeybox, leftkeybuttoncomp, rightkeybuttoncomp, rightkeybox )
    foot = div("mainfooter")
    style!(foot, "background-color" => "whitesmoke")
    footmessage = p("mainfootmessage", text = "Github links: ")
    push!(foot, tllogomain, footmessage)
    leftkey_welcome = kbd("leftkey_welcome", text = "<-")
    rightkey_welcome = kbd("rightkey_welcome", text = "->")
    key_notifier = div("key_notifier", align = "center")
    p_notifier = p("p_notifier", text = "swipe, or press ")
    bold_knotifier = Component("bold_knotifier", "b")
    bold_knotifier[:text] = "  to explore !"
    push!(key_notifier, p_notifier, leftkey_welcome, rightkey_welcome,
     bold_knotifier)
    push!(maindiv, tlapplogo, maingreeting, key_notifier, foot)
    extensiongallery = gallery(c)
    style!(extensiongallery, "position" => "fixed",
    "z-index" => "1", "top" => "0", "overflow-x" => "hidden !important",
     "width" => "0", "height" => "95%",
     "transition" => "0.8s", "margin" => "0px !important", "opacity" => "0%", "margin-left" => "0%",
     "margin-top" => "5%", "padding-top" => "5%")
     style!(maindiv, "transition" => ".8s", "overflow-y" => "scroll")
    on_keydown(c, "ArrowLeft") do cm::ComponentModifier
        style!(cm, extensiongallery, "width" => 100percent, "opacity" => "100%")
        style!(cm, maindiv, "margin-left" => "100%")
        style!(cm, maindiv, "opacity" => "0%")
        cm[maindiv] = "page" => "gallery"
        set_text!(cm, tlapp_title, "extension gallery|toolips")
    end
    on_keydown(c, "ArrowRight") do cm::ComponentModifier
        if cm[maindiv]["page"] == "gallery"
            style!(cm, maindiv, "margin-left" => "0%")
            style!(cm, extensiongallery, "opacity" => "0%", "width" => "0%", "margin-right" => "1%")
            style!(cm, maindiv, "opacity" => "100%")
            cm[maindiv] = "page" => "home"
            set_text!(cm, tlapp_title, "toolips app !")
        end
    end
    on_keydown(c, "tab") do cm::ComponentModifier
        alert!(cm, "tabpresss")
    end
    bod = body("toolips_app")
    push!(bod, keybindings, extensiongallery, maindiv, tlappcursor)
    write!(c, bod)
end
