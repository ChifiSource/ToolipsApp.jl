<img src = "https://github.com/emmettgb/ToolipsApp.jl/blob/main/public/logo.jpg"></img>
# ToolipsApp
A webapp for testing and demonstrating Toolips.jl. This webapp provides numerous examples of how Toolips.jl can be used and how the software works in its current state. As of right now, it has a stream-writing story-teller, and a text editor. This is all done in pure Julia, there is no Javascript involved although there likely will be in the future. \
[What is a Toolips?](https://github.com/ChifiSource/Toolips.jl)
<img src = https://github.com/emmettgb/ToolipsApp.jl/blob/main/public/toolipsappsc.png></img>
### Get it working
Getting this web app working is incredibly simple. Step one is to git a clone of this repository.
```bash
git clone https://github.com/emmettgb/ToolipsApp.jl
```
Next, you will need to activate the project environment in Julia.
```bash
cd ToolipsApp
julia
```
```julia
using Pkg; Pkg.activate(".")
```
Lastly, include the project file.
```julia
include("src/ToolipsApp.jl")
[2022-03-28T14:51:22.108]: Toolips Server starting on port 8003
[2022-03-28T14:51:22.498]: Successfully started server on port 8003
[2022-03-28T14:51:22.950]: You may visit it now at http://127.0.0.1:8003
```

