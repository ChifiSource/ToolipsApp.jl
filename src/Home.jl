function tellastory(http)
    story = """There once was a Julia programmer named Emmett.
    Emmett sought to create a great web-development framework inside of
    Julia. Although it was certainly a lot of work, and at times was
    surprisingly challenging, you are now viewing the results!"""
    for character in story
        write(http, string(character))
        sleep(.07)
    end
end
heading = html("""<div align = "center">
<img src = "https://cdn-images-1.medium.com/max/800/1*YCUbLMlIGfaV5enj6ycquw.png" /img>
<h1>Welcome to ToolipsApp</h1>
""")
sub_heading = html("<h3>A collection of Toolips examples</h3>")
summary = html("""<p>Toolips.jl is a web-development framework for Julia.
The framework features a full front-end templating and building engine as well
as a functional API. The following are some examples which utilize the various
capabilities of Toolips.jl.</p></br></br>
""")
story_button = Toolips.Button("story", onAction = tellastory, label = "Tell a story")
text_editor = html("""<form action="/text-editor">
    <button value="Text Editor" />Text Editor</button>
</form>""")
style = Toolips.css("""div {
  background-image: url('https://i.postimg.cc/JzD6s6Vx/bgexamp.png');
  background-repeat: no-repeat;
  background-size: cover;
  }
  button {
	background-color:#db8cdb;
	border-radius:22px;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Impact;
	font-size:17px;
	font-weight:bold;
	padding:17px 39px;
	text-decoration:none;
}
button:hover {
	background-color:#80b5ea;
}
button:active {
	position:relative;
	top:1px;
}
  """)
spacing = html("""</br></br></br></br></br></br></br><p style="color:white;">This software, and its contents are MIT-licensed.
You can view more information on <a href="http://github.com/ChifiSource/Toolips.jl">Toolips here.</a></p></br>
</div>
<b align = "center" style="color:purple;">Created by Emmy Boudreau :)""")
page_contents = [style, heading, sub_heading, summary, story_button, text_editor, spacing]

home = Page(page_contents, "ToolipsApp")
