include("ExtensionGallery.jl")

kbbbuttons() = link("kbbbuttons", rel = "stylesheet",
href = "https://unpkg.com/keyboard-css@1.2.4/dist/css/main.min.css")
function kbd(name::String; args ...)
    kdbc = Component(name, "kbd", args)
    kdbc[:class] = "kbc-button"
    kdbc
end
function main(c::Connection)
    tlapp_title = title("tlapp_title", text = "toolips app !")
    tlapp_description = meta("tlapp_description", name = "description",
    content = """toolips app is the home of the toolips web-development, which
    features extendable and versatile web-development for julia.""")
    tlapp_keywords = meta("tlapp_keywords",
    content = "web-development, programming, julia, javascript, web, html, css")
    charset_meta = meta(charset = "UTF-8")
    # Styles
    styles = stylesheet()
    push!(styles, tlapp_title, tlapp_description, charset_meta)

    push!(styles, kbbbuttons())
    styles["div"]["background-color"] = "white"
    styles["a"]["color"] = "#79464A"
    styles["p"]["color"] = "#5B4679"
    bold = Style("b", color = "#466479")
    push!(styles, bold)
    styles["h2"]["color"] = "#754679"
    styles["h3"]["color"] = "#795B46"
    styles["h4"]["color"] = "#4B7946"
    styles["p"]["font-size"] = "14pt"
    sectionst = Style("section", padding = "30px")
    sectionst["border-color"] = "gray"
    sectionst["border-width"] = "2px"
    sectionst["border-radius"] = "10px"
    sectionst["border-style"] = "solid"
    sectionst["background-color"] = "white"
    sectionst["transition"] = "1s"
    push!(styles, sectionst)
    write!(c, styles)
    maindiv = divider("homemaindiv", page = "home")
    tllogomain = img("tllogomain", src = "favicon.png", width = "30")
#    <span class="material-symbols-outlined">
#    keyboard_arrow_left
#    </span>
      leftkeybox = kbd("leftkeybox", text = "<-")
      style!(leftkeybox, "display" => "inline-block")
      leftkeybuttoncomp = a("leftkeybuttonlabel", text = "extension gallery", )
      style!(leftkeybuttoncomp, "font-size" => "14pt !important",
      "font-weight" => "bold !important", "margin" => "10px")
      keybindings = divider("keybindingsdiv")
      style!(keybindings, "position" => "block", "top" => "0px", "width" => "99%",
      "margin-left" => "0px !important", "border-radius" => "15px !important",
      "z-index" => "10", "height" => "4%", "background-color" => "#FDF8FF")
      push!(keybindings, leftkeybox, leftkeybuttoncomp)
#      style!()
    tlapplogo = img("tlapplogomain", src = "toolips/toolipsapp.png")
    maincompdiv = divider("maincompdiv")
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
    foot = divider("mainfooter")
    style!(foot, "background-color" => "whitesmoke")
    footmessage = p("mainfootmessage", text = "Github links: ")
    push!(foot, tllogomain, footmessage)
    leftkey_welcome = kbd("leftkey_welcome", text = "<-")
    rightkey_welcome = kbd("rightkey_welcome", text = "->")
    key_notifier = divider("key_notifier", align = "center")
    p_notifier = p("p_notifier", text = "swipe, or press ")
    bold_knotifier = Component("bold_knotifier", "b")
    bold_knotifier[:text] = "  to explore !"
    push!(key_notifier, p_notifier, leftkey_welcome, rightkey_welcome,
     bold_knotifier)
    push!(maincompdiv, tlapplogo, maingreeting, key_notifier, foot)
    push!(maindiv, maincompdiv)
    incoming_div = divider("incomingdiv")
    style!(incoming_div, "position" => "fixed",
    "z-index" => "1", "top" => "0", "overflow-x" => "hidden !important", "overflow-y" => "scroll",
     "padding-top" => "30px", "width" => "0", "height" => "95%", "left" => "0",
     "transition" => "0.8s", "margin" => "0px", "opacity" => "0%", "margin-left" => "0%",
     "margin-top" => "3%")
     extensiongallery = gallery(c)
     push!(incoming_div, extensiongallery)
     style!(maindiv, "transition" => ".8s", "background-color" => "white")
    on_keydown(c, "ArrowLeft") do cm::ComponentModifier
        style!(cm, incoming_div, "width" => "99%", "overflow-x" => "scroll",
         "opacity" => "100%")
        style!(cm, maindiv, "margin-left" => "100%")
        style!(cm, maindiv, "opacity" => "0%")
        cm[maindiv] = "page" => "gallery"
        set_text!(cm, tlapp_title, "extension gallery|toolips")
    end
    on_keydown(c, "ArrowRight") do cm::ComponentModifier
        if cm[maindiv]["page"] == "gallery"
            style!(cm, maindiv, "margin-left" => "0%")
            style!(cm, incoming_div, "opacity" => "0%", "width" => "0%")
            style!(cm, maindiv, "opacity" => "100%")
            cm[maindiv] = "page" => "home"
            set_text!(cm, tlapp_title, "toolips app !")
        end
    end
    on_keydown(c, "tab") do cm::ComponentModifier
        alert!(cm, "tabpresss")
    end
    bod = body("toolips_app")
    style!(bod, "overflow" => "hidden")

    push!(bod, keybindings, incoming_div, maindiv)
    write!(c, bod)
end
