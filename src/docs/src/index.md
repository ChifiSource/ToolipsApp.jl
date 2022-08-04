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
<div align = "center">
<img align = "center" width = 300 src = "assets/toolips.svg"></img></br></br></br>
<a href = "https://toolips.app"><button>home</button></a>
<a href = "https://github.com/ChifiSource/Toolips.jl"><button>github</button></a>
<h4 align = "center">a manic web-development framework</h4>
</div>
```
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
```@docs
Toolips
```
## adding toolips
The easiest way to add the package is to add it directly from the `Pkg` Registry.
Toolips is available in the julia/General Registry.

### stable
```julia
using Pkg; Pkg.add("Toolips")
```
```julia
julia> # Press ] to enter your Pkg REPL
julia> ]
pkg> add Toolips
```
You can also add the package by URL:
```julia
using Pkg; Pkg.add(url = "https://github.com/ChifiSource/Toolips.jl.git")
```
```julia
julia> # Press ] to enter your Pkg REPL
julia> ]
pkg> add https://github.com/ChifiSource/Toolips.jl.git
```
### unstable
Alternatively, you could also add the Unstable branch of toolips. This could provide
extended functionality and updates, but there is no guarantee that all of the additions
will be completely working. It is possible to add this revision from the General registry,
however, it is recommended that you add Unstable revisions by URL instead.
```julia
julia> # Press ] to enter your Pkg REPL
julia> ]
pkg> add Toolips#Unstable
```
You can also add the package by URL:
```julia
using Pkg; Pkg.add(url = "https://github.com/ChifiSource/Toolips.jl.git#Unstable")
```
```julia
julia> # Press ] to enter your Pkg REPL
julia> ]
pkg> add https://github.com/ChifiSource/Toolips.jl.git#Unstable
```
## methodology
- **Versatility** - Toolips seeks to be more versatile than your typical web-development frameworks.
In a typical web-development framework, you learn the framework for a specific application; some
frameworks are capable of creating API's, others are capable of developing an actual templated page,
and very few are capable of fullstack web-development. Toolips wraps all of these abilities into one
by allowing the developer to choose which features they want in thier project and add them
accordingly via extensions.
- **Julia-bound** - There is no writing HTML, CSS, or Javascript to get your projects working.
Everything is written in pure Julia, and rendered by a function pipeline. Toolips projects are
regular Julia modules that can be pushed to Pkg, distributed, and shared.
- **Low-memory** - Toolips has incredibly low memory usage. Whereas a typical asynchronous web-server
serving 100 people a day may use anywhere from 1GB-5GB of memory, toolips apps rarely crest over
the bounds of 1GB of memory usage.
- **Asynchronous** - Asynchronicity is incredibly important if you want to serve the same function
set with different definitions to multiple people. Toolips is completely Asynchronous.
- **Declarative** - Web-development frameworks shouldn't be hard to use. Toolips has an easy-to-use
high-level API, with a lot more capabilities under the hood via the extensions when needed.
- **Extendable** - Toolips has a core focus on extendability. Everything in the library, from Components, to
ServerExtensions, to Connections, to Servables, are all extendable. You can read guides on
extending each one in their respective sections. This makes it possible to do a lot more with
a lot less, as others might have already created what you are looking for.
### declarative programming
Toolips has a large central focus on declarative programming. Most calls in toolips are
method calls that are often used to mutate different types.
### multi-paradigm programming
Toolips follows a programming pattern of a functional core and an imperative shell,
with an API that follows a functional design pattern.
The center of toolips serving revolves around a function pipeline, with functions
held as fields of different types. The actual high-level interface to this, however,
is focused on being mutational and functional.
### incremental development
Toolips follows an incremental development process. This process consists of four
main steps that are incrementally repeated. The first step is the planning stage, where
new additions to toolips are planned and discussed. The second step is the design step,
where the core functionalities of a given addition are implemented. After this
comes the research and programming stage, where the exact details of how to do things
**the best way** in the context are researched and implemented.
## doc contents
```@contents
```
