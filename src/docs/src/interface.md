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
# Interface
```@docs
AbstractComponent
StyleComponent
```
## file
```@docs
File
```
## components
```@docs
Component
Style
Animation
getindex(::AbstractComponent, ::Symbol)
getindex(::AbstractComponent, ::String)
setindex!(::AbstractComponent, ::Any, ::Symbol)
setindex!(::Servable, ::Any, ::String)
img
link
meta
input
a
p
h
Toolips.h1
ul
li
div
divider
br
i
title
span
iframe
svg
element
label
script
nav
button
form
section
body
header
footer
Toolips.b
Toolips.DOCTYPE
properties!
getproperties
children
get(::AbstractComponent, ::String)
Toolips.copy
has_children
push!(::AbstractComponent, ::AbstractComponent ...)
Toolips.style!
Toolips.:
Toolips.animate!
Toolips.delete_keyframe!
setindex!(::Animation, ::Pair, ::Int64)
Toolips.components
string(::AbstractComponent)
showchildren
Toolips.WebMeasure
Toolips.gradient
Toolips.rgba
```
## extensions
```@docs
Logger
Files
```
