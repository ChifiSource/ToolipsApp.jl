<div align = "center">
<img src = "https://github.com/ChifiSource/image_dump/blob/main/toolips/toolipsapp.png" href = "https://toolips.app"></img>

##### toolips app ! home of [toolips](https://ChifiSource/Toolips.jl)

<img src = "https://github.com/ChifiSource/ToolipsApp.jl/blob/Unstable/public/tlapp3.png"></img>

Welcome to the home of Toolips.jl - an extendable web-development framework written in Julia. This app is deployed at [toolips.app](https://toolips.app). This module includes both ToolipsDocs and ToolipsApp itself.

</div>
</br>
</br>

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
