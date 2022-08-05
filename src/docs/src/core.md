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
# core
```@docs
AbstractRoute
Servable
AbstractConnection
ServerExtension
ToolipsServer
Toolips.CoreException
```
## connections
```@docs
SpoofStream
Connection
SpoofConnection
getindex(::AbstractConnection, ::Symbol)
getindex(::AbstractConnection, ::Type)
setindex!(::AbstractConnection, ::Function, ::String)
setindex!(::AbstractConnection, ::AbstractRoute, ::String)
write!
getargs
getarg
getip
getpost
Toolips.download!
navigate!
push!(::AbstractConnection, ::Any)
Toolips.startread!(::AbstractConnection)
route!(c::AbstractConnection, route::AbstractRoute)
route!(::Function, ::AbstractConnection, ::String)
unroute!(::AbstractConnection, ::String)
routes(::AbstractConnection)
Toolips.extensions(::AbstractConnection)
has_extension
```
## routes
```@docs
Route
route
routes
setindex!(::Vector{AbstractRoute}, ::Function, ::String)
```
## servers
```@docs
WebServer
ServerTemplate
getindex(::ToolipsServer, ::Symbol)
routes(::ToolipsServer)
Toolips.extensions(::ToolipsServer)
kill!(::ToolipsServer)
kill!(::ServerTemplate)
route!(::Function, ::ToolipsServer, ::String)
route!(::ToolipsServer, ::String, ::Function)
route!(::ToolipsServer, ::AbstractRoute)
```
## requests
```@docs
get(::String)
post
```
