include("ExtensionGallery.jl")

function iconstyle()
    s = Style(".material-symbols-outlined", cursor = "pointer")
    s["font-size"] = "300pt"
    s:"hover":["color" => "orange", "transform" => "scale(1.1) !important"]
    s
end
google_icons() = link("google-icons",
href = "https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200",
rel = "stylesheet")

function main(c::Connection)
    # Styles
    styles = stylesheet()

    push!(styles, iconstyle(), google_icons())
    styles["div"]["background-color"] = "white"
    styles["a"]["color"] = "lightblue"
    styles["p"]["color"] = "darkgray"
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
    tllogomain = img("tllogomain", src = "favicon.png", width = "80")
#    <span class="material-symbols-outlined">
#    keyboard_arrow_left
#    </span>
     leftboxicon = span("lefticon",
      class = "material-symbols-outlined", text = "arrow_left")
      style!(leftboxicon, "font-size" => "25pt !important")
      leftkeybox = divider("leftkeybox")
      on(c, leftkeybox, "click") do cm::ComponentModifier
        style!(cm, incoming_div, "width" => "100%", "overflow-x" => "scroll",
        "opacity" => "100%")
        style!(cm, maindiv, "margin-left" => "100%")
        style!(cm, maindiv, "opacity" => "0%")
        cm[maindiv] = "page" => "gallery"
      end
      style!(leftkeybox,
      "background" => "url(images/key_bg.png) no-repeat", "background-size" => "auto",
      "display" => "inline-block", "position" => "fixed", "cursor" => "pointer",
       "top" => "50%", "z-index" => "10", "background-color" => "transparent")
      push!(leftkeybox, leftboxicon)
      leftkeybuttoncomp = h("leftkeybuttonlabel", 3, text = "extension gallery")
      style!(leftkeybuttoncomp, "margin-left" => "10px")
      push!(leftkeybox, leftkeybuttoncomp)
    tlapplogo = img("tlapplogomain", src = "toolips/toolipsapp.png")
    maincompdiv = divider("maincompdiv")
    maingreeting = tmd"""[![version](https://juliahub.com/docs/Toolips/version.svg)](https://juliahub.com/ui/Packages/Toolips/TrAr4) \
    
# Welcome to toolips app
**Toolips.jl** is a **fast**, **asynchronous**, **low-memory**, **full-stack**, and **reactive** web-development framework **always** written in **pure** Julia. Here is Toolips.jl in a nutshell:
- **Fast and secure**. All routes are served through Julia, and anything that can be written must be written using a method that can only write very specific types.
- **HTTPS capable**, load balancer friendly. Can easily be deployed with SSL.
- **Extendable** servers, components, and methods, they are all extendable!
- **Modular** applications. Toolips applications are regular Julia modules.
- **Regular Julia** projects.
- **Declarative**, high-level syntax.
- Extremely **low memory usage**.
- **Asynchronous**. Run multiple functions at the same time as you serve to each incoming request.
- **Versatile**. Toolips.jl can be used for all scenarios, from full-stack web-development to APIs.
```julia
using Pkg; Pkg.add("Toolips")
```
This app is dedicated to the exploration of awesome toolips projects, extensions, and more!
Use your right and left arrow keys to navigate the different showcases!
#### jump to:
- [extension gallery]()
- []
    """
    foot = divider("mainfooter")
    style!(foot, "background-color" => "whitesmoke")
    push!(foot, tllogomain)
    push!(maincompdiv, tlapplogo, maingreeting, foot)
    push!(maindiv, maincompdiv)
    incoming_div = divider("incomingdiv")
    style!(incoming_div, "position" => "fixed",
    "z-index" => "1", "top" => "0", "overflow-x" => "hidden !important", "overflow-y" => "scroll",
     "padding-top" => "30px", "width" => "0", "height" => "100%", "left" => "0",
     "transition" => "0.8s", "margin" => "0px", "opacity" => "0%", "margin-left" => "0%")
     extensiongallery = gallery(c)
     push!(incoming_div, extensiongallery)
     style!(maindiv, "transition" => ".8s", "background-color" => "white")
    on_keydown(c, "ArrowLeft") do cm::ComponentModifier
        style!(cm, incoming_div, "width" => "100%", "overflow-x" => "scroll",
         "opacity" => "100%")
        style!(cm, maindiv, "margin-left" => "100%")
        style!(cm, maindiv, "opacity" => "0%")
        cm[maindiv] = "page" => "gallery"
    end
    on_keydown(c, "ArrowRight") do cm::ComponentModifier
        if cm[maindiv]["page"] == "gallery"
            style!(cm, maindiv, "margin-left" => "0%")
            style!(cm, incoming_div, "opacity" => "0%", "width" => "0%")
            style!(cm, maindiv, "opacity" => "100%")
            cm[maindiv] = "page" => "home"
        end
    end
    on_keydown(c, "tab") do cm::ComponentModifier
        alert!(cm, "tabpresss")
    end
    bod = body("toolips_app")
    style!(bod, "overflow-x" => "hidden")
    push!(bod, incoming_div, maindiv, leftkeybox)
    write!(c, bod)
end
