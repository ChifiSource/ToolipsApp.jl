<img src = https://github.com/ChifiSource/ToolipsApp.jl/blob/ToolipsApp-2/public/Screenshot%20from%202022-06-12%2009-46-47.png href = "https://toolips.app"></img>
##### A webapp built in [toolips](https://ChifiSource/Toolips.jl) which acts as a central hub for Toolips.jl extensions and web-sites.
### Get it working
As far as starting or working with toolips project, we can do so in one of two ways.
- You may add the **Module** with Pkg. This is ideal for projects that have easy start methods. In toolips, websites are regular Julia modules.
```julia
using Pkg; Pkg.add(url = "https://github.com/emmettgb/ToolipsApp.jl/")
using ToolipsApp

ToolipsAppServer = ToolipsApp.start("127.0.0.1", 8000)
```
- Or you can git clone the module and use the module's files. This is ideal if you want to actually host the module, or just if the module was designed to run with environmental variables.

```julia
shell> git clone https://github.com/ChifiSource/ToolipsApp.jl/
shell> cd ToolipsApp.jl
julia> include("dev.jl")
```
