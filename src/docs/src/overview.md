```@raw html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Poppins&family=Roboto+Mono:wght@100&family=Rubik:wght@500&display=swap" rel="stylesheet">

<style>
body {background-color: #FDF8FF !important;}
header {background-color: #FDF8FF !important}
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
        border-radius: 30px !important;
        border-color: lightblue !important;
      }
      pre {
        border-radius: 10px !important;
        border-color: #FFE5B4 !important;
      }
p {font-family: 'Poppins', sans-serif;
font-family: 'Roboto Mono', monospace;
font-family: 'Rubik', sans-serif; color: #565656;}
button {border-radius: 5px; padding: 7px; background-color: lightblue;
color: white; font-size: 16pt; font-weight: bold; border-style: none; cursor: pointer; margin: 5px;}
button:hover {background-color: orange;}
</style>
```
# overview
Welcome to toolips, the hyper-extensible, versatile web-development framework for Julia. This web-framework focuses on extensibility, versatility, and ease of use. This overview will reveal how the different parts of toolips come together to create basic apps, as well as functioning web-apps.
# creating apps
The first step to any toolips project is creating an app! Though you can certainly build toolips projects from **normal julia modules**, it is certainly quicker and more convenient to utilize the `Toolips.new_app` and `Toolips.new_webapp` methods respectively. Both of these methods take a `String`, this being your Julia project name.
```julia
using Toolips
Toolips.new_app("ExampleApp")
```
```@docs
Toolips.new_app
Toolips.new_webapp
```
This will create a new Julia project with a `dev.jl` file and a `prod.jl` file, along with
## connections
Connections hold the routes, a selection of extensions, and the `HTTP.Stream` for the server. An `AbstractConnection` can also hold more depending on its type. Connections are passed as arguments into routes. We can write a route with this argument by either writing a function or by using the `route` syntax. Connections are written to using the `write!` method.
```@example
using Toolips

# function
function home(c::Connection)
  write!(c, "hello world!")
end

homeroute = route("/", home)
# route/do
homeroute = route("/") do c::Connection
  write!(c, "hello world!")
end
```

Connections can be indexed with a `Symbol` to yield a ServerExtension of that name, or indexed with a `String` to yield that route's function. They can also be rerouted with `route!` or setindex!.
## servables
Servables are any type that has a Function `f`, which takes a Connection. In the scope of toolips' base, this includes the `File` Servable and sub-types of `AbstractComponent`, which includes `Component`, `Style`, and `Animation`.
```@example
using Toolips
comp = div("mydiv", text = "hello world!")
typeof(comp)
```
Components are most often created via the various Component methods available across the toolips ecosystem, but can also be created via the `Component` constructor.

```@example
using Toolips
comp = Component("myb", "b", "align" => "center")
show(comp)
```
Components take an infinite number of arguments which are HTML attributes. In the example above, we set the align of our `myb` to `center`. There are also more methods for this type, such as `style!`, `animate!`, `push!`, and more where
- **style!** sets the `Style` of a `Component`, or styles a Component with `Pairs`.
- **animate!** animates a `Component` with an `Animation`.
- **push!** composes a `Component` into another `Component`.
```@example
using Toolips

function home(c::Connection)
  examplepdiv = div("examplepdiv")
  style!(examplepdiv, "border-width" => 2px, "border-style" => "solid", "border-color" => "lightblue") # <- Styles examplepdiv
  myp = p("exampleb", text = "hello world!")
  push!(examplepdiv, myp) # <- puts myb into examplepdiv
  write!(c, examplepdiv)
end
```
```@raw html
$examplepdiv
```
## extensions
Extensions are the bread to the butter of toolips. These are all sub-types of the `ServerExtension` type. Two examples of extensions from toolips are the `Files` and `Logger` extensions. These are typically provided to `ToolipsServer` constructors using the `extensions` key-word argument.
```@example
using Toolips

ws = WebServer("127.0.0.1", 8000, extensions = [Logger(), Files()])
show(ws)
```
Some extensions will be loaded into the `Connection`, some extensions modify the routes of a given `Connection`, and some extensions
```@example
using Toolips
show(Logger().type); print("\n")
show(Files().type)
```
An extension can also be of multiple types by using a `Vector{Symbol}`, as is the case with Session, for example.
```@example
using Toolips
using ToolipsSession
show(Session().type)
```
```@example
using Toolips
ws = WebServer("127.0.0.1", 8000, extensions = [Logger(), Files()])
```
## servers
Servers take your routes and start them using the `ToolipsServer.start()` method. We have the option to build a server with either a `WebServer` or a `ServerTemplate`. Of course, we can also create our own servers by following the consistencies of `ToolipsServer`. These constructors will take our routes, extensions, ip and port, and make a start/stoppable object
```@example
using Toolips

ws = WebServer("127.0.0.1", 8000, extensions = [Logger(), Files()])
show(ws); print("\n\n")

```
Similar to a Connection, we can access extensions by indexing `Symbols` and routes by indexing `Strings`.
```@example
using Toolips

ws = WebServer("127.0.0.1", 8000, extensions = [Logger(), Files()])
ws[:Logger].log("hello!")
```
```@example
using Toolips

st = ServerTemplate("127.0.0.1", 8000, extensions = [Logger(), Files()])
show(st)
```
# creating web-apps
Creating a web-app with toolips using the `new_webapp` method will add the extensions `Files` and `Session` to your server. The `Files` extension adds routes to your server for files stored inside of a particular directory, and the `Session` extension is used to bring full-stack functionality to toolips.
## files
Handling files with the `Files` extension is incredibly easy, simply add `Files(::String)` where the single positional argument is your directory from your project folder; by default this is `public`.
```@example
ws = WebServer("127.0.0.1", 8000, extensions = [Logger(), Files("public")])
```
## session
The session extension is a fullstack extension for toolips. You can view a full api reference for this extension [here](/extensions/toolips_session/). `Session` is a ServerExtension, and can be loaded just like any other ServerExtension.
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
