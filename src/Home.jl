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
capabilities of Toolips.jl.</p>
""")
story_button = Toolips.Button("story", onAction = tellastory, label = "Tell a story!")
page_contents = [heading, sub_heading, summary, story_button]
home = Page(page_contents, "ToolipsApp")
