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
  border-color: darkgray !important;
}
pre {
  border-radius: 10px !important;
  border-color: gray !important;
}
p { color: #00147e !important;}
  font-family: 'Poppins', sans-serif;
font-family: 'Roboto Mono', monospace;
font-family: 'Rubik', sans-serif; color: blue;}
</style>
<div align = "center">
<img src = "http://127.0.0.1:8000/toolips/toolipsexport.png"></img>
</div>
```
# overview
Toolips export allows for the compilation of toolips applications into
- shared libraries
- compiled servers
- compiled applications\n
with future plans for mobile, as well. You can build an app from the root of
your project directory by using the `build` method and providing an ExportTemplate.
```julia
Toolips.new_app("ExampleApp")

cd("ExampleApp")

using ToolipsExport

build(app)
```
These templates are
- app
- so
- server
# reference
```@autodocs
Modules = [ToolipsExport]
```
