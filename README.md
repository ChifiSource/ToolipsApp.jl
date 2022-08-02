<img src = "https://github.com/ChifiSource/image_dump/blob/main/toolips/toolipsapp.png" href = "https://toolips.app"></img>
##### A webapp built in [toolips](https://ChifiSource/Toolips.jl) which acts as a central hub for Toolips.jl extensions and web-sites.
<img src = "https://github.com/ChifiSource/ToolipsApp.jl/blob/Unstable/public/tlappexplorer.png"></img>
Welcome to the home of Toolips.jl - an extendable web-development framework written in Julia. This app is deployed at [toolips.app](https://toolips.app). This app seeks to do a few different things involving toolips.jl. Firstly, a home for [toolips documentation](https://doc.toolips.app). Secondly, an easy to interpret [extension gallery](https://doc.toolips.app/?page=gallery) including more information on various extensions. Finally, we would like to have user-created projects, as well as our own pages, there will eventually be a register page to go along with this, as well as a site-nav page when pressing up in the future.
</br>
</br>
<img src = "https://github.com/ChifiSource/ToolipsApp.jl/blob/Unstable/public/extensiongallery.png"></img></br>
The extension gallery is the first pf many new section additions to toolips.jl
### (planned) documentation
### (planned) panel submission, extension submitions.
### (planned) history, ideas, examples
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
