using Toolips, Documenter
using Toolips: Servable, ServerExtension, ToolipsServer, SpoofStream
using Toolips: SpoofConnection, StyleComponent, AbstractConnection, AbstractRoute
using Toolips: AbstractComponent, StyleComponent
using ToolipsSession, ToolipsMarkdown, ToolipsDefaults, ToolipsBase64
using ToolipsRemote, ToolipsUploader, ToolipsMemWrite
Documenter.makedocs(root = ".",
       source = "src",
       build = "../../public/docs",
       clean = false,
       doctest = true,
       modules = [Toolips, ToolipsSession, ToolipsMarkdown, ToolipsDefaults,
       ToolipsBase64, ToolipsRemote, ToolipsUploader, ToolipsMemWrite],
       repo = "https://github.com/ChifiSource/Toolips.jl",
       highlightsig = true,
       sitename = "toolips",
       expandfirst = [],
       pages = Any[
                "reference" => Any[
                "toolips" => "index.md",
                "overview" => "overview.md",
                "core" => "core.md",
                "interface" => "interface.md"
                ],
                "server extensions" => Any[
                "toolips session" => "extensions/toolips_session.md",
                "toolips defaults" => "extensions/toolips_defaults.md",
                "toolips markdown" => "extensions/toolips_markdown.md",
                "toolips memwrite" => "extensions/toolips_memwrite.md",
                "toolips base64" => "extensions/toolips_base64.md",
                "toolips remote" => "extensions/toolips_remote.md",
                "toolips uploader" => "extensions/toolips_uploader.md",
                "toolips interpolator" => "extensions/toolips_interpolator.md",
                "toolips export" => "extensions/toolips_export.md",
                "creating extensions" => "extensions/creating_extensions.md",
                ],
                "examples" => Any[
                "simple api" => "examples/simple_api.md",
                "simple website" => "examples/simple_website.md",
                "blog" => "examples/blog.md",
                "text editor" => "examples/text_editor.md",
                ],
                "developer API" => "developer_api.md",
               ]
       )
