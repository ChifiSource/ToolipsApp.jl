```@raw html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins&family=Roboto+Mono:wght@100&family=Rubik:wght@500&display=swap" rel="stylesheet">

<style>
body {background-color: white !important;}
header {background-color: white !important;}
div {width: 100% important!;}
h1 {
  font-family: 'Poppins', sans-serif !important;
  font-family: 'Roboto Mono', monospace !important;
  font-family: 'Rubik', sans-serif !important;}

  h2 {
    font-family: 'Poppins', sans-serif !important;
    font-family: 'Roboto Mono', monospace !important;
    font-family: 'Rubik', sans-serif !important;}
    h4 { color: #03045e !important;
      font-family: 'Poppins', sans-serif !important;
      font-family: 'Roboto Mono', monospace !important;
      font-family: 'Rubik', sans-serif !important;}
article {
  padding: 20px;
  width: 100% !important;
  border-radius: 30px !important;
  border-color: red !important;
}
pre {
  border-radius: 10px !important;
  border-color: pink !important;
  border-style: dashed !important;
}
p { color: #00147e !important;}
  font-family: 'Poppins', sans-serif;
font-family: 'Roboto Mono', monospace;
font-family: 'Rubik', sans-serif; color: black;}
</style>
<div align = "center">
<img src = "../../assets/toolipssession.png"></img>
</div>
```
# ToolipsSession

## overview
`Session` is a ServerExtension, and can be loaded just like any other ServerExtension.
- **positional arguments**
- activeroutes**::Vector{String}** = ["/"]
- **key-word arguments**
- transitionduration**::AbstractFloat** = 0.5
- transition**::String** = "ease-in-out"
- timeout**::Integer** = 30\n
`activeroutes` determines which routes `Session` should run on. The two transitions provide defaults for style transitions changed with the ComponentModifier, and timeout is an `Integer`, in minutes, of how long we want a session to continue last before timing out.
```@example
ws = WebServer(extensions = [Logger(), Session(["/", "/extensions/"], timeout = 1)])
```
Session primarily exports this `ServerExtension`, the `Servable` `ComponentModifier`, a sub-type of `Modifier`, and the `on` method. Modifiers take some HTML in a constructor and turn them into something, they can also take different arguments depending on the application. Modifiers are a lot like Connections, only they are used to respond with modifications to `Components`. The ComponentModifier can be indexed in order to get different attributes from the client, and setting the index to a `Pair` can modify the key of the pair to the value of the pair.
```julia
using Toolips
using ToolipsSession

changealign = route("/") do c::Connection
  mybutton::Component{:button} = button("mybutton", align = "center", text = "click me!")
 #c- v vvv Component  v -event
  on(c, mybutton, "click") do cm::ComponentModifier
    if cm[mybutton]["align"] == "center"
      cm[mybutton] = "align" => "right"
    else
      cm[mybutton] = "align" => "center"
    end
  end
  write!(c, mybutton)
end
```
Another common example of a method that might be used is `style!`
```julia
changecolor = route("/") do c::Connection
  mybutton::Component{:button} = button("mybutton", align = "center", text = "click me to change colors")
  style!(mybutton, "color" => "blue")
  on(c, mybutton, "click") do cm::ComponentModifier
    style!(cm, mybutton, "color" => "red")
  end
end
```
## reference
```@autodocs
Modules = [ToolipsSession]
```
