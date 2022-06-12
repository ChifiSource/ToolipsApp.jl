function fade_up()
    fup = Animation("fade_up")
    fup[:from] = :transform => "translateY(100%)"
    fup[:from] = :opacity => "0%"
    fup[:to] = :opacity => "100%"
    fup[:to] = :transform => "translateY(0%)"
    return(fup)
end

function nav_in()
    fup = Animation("nav_in")
    fup[:from] = :transform => "translateX(-400px)"
    fup[:from] = :opacity => "0%"
    fup[:to] = :opacity => "100%"
    fup[:to] = :transform => "translateX(0px)"
    return(fup)
end

function nav_out()
    fup = Animation("nav_out")
    fup[:from] = :transform => "translateX(0px)"
    fup[:from] = :opacity => "100%"
    fup[:to] = :opacity => "0%"
    fup[:to] = :transform => "translateX(-400px)"
    return(fup)
end

function logo_style()
    style = Style("logo_s")
    animate!(style, fade_up())
    return(style)
end
p_style() = begin
    ps = Style("p", color = "lightgray")
    ps["font-family"] = "\"Poppins\", sans-serif"
    ps["font-size"] = "20pt"
    ps
end

homestyles() = components(title(text = "toolips app"),
logo_style(), p_style(),
link("exampy",  href = "'styles/main_styles.css'", rel = "stylesheet"),
    link("Sofia", rel = "stylesheet",
        href = "https://fonts.googleapis.com/css2?family=Poppins&family=Roboto+Mono:wght@100&family=Rubik:wght@500&display=swap"))

# --------------

function navbar(links::Vector{Pair{String, String}}, ref = false)
    ds = "'animation-name: nav_in; animation-duration: 3s;'"
    if ref == true
        ds = "'animation-name: nav_out; animation-duration: 2s; opacity: 0%;'"
    end
    navbardiv = divider("navbardiv", class = "page", align = "center",
    style = ds)
    navbar = ul("navbar", class = "'menu__list r-list'")
    for link in links
        lnknme = link[1]
        list_item = li("li-$lnknme")
        list_item[:class] = "menu__group"
        aitem = a("$lnknme", href = link[2], text = link[1],
        class = "'menu__link r-link text-underlined'", style = "'text-color: blue;'")
        push!(list_item, aitem)
        push!(navbar, list_item)
    end
    push!(navbardiv, navbar)
    navbardiv
end

# ---------------

function home(c::Connection)
    args = Dict()
    try
        args = getargs(c)
    catch
        args = Dict()
    end
    if :pull in keys(args)
        navigate(c, args[:pull])
    else
        main(c)
    end
end

function navigate(c::Connection, pull::String)
    home_ref(c, pull)
end

function team(c::Connection)
    navs = ["< back" => "/",
        "join" => "/join", "sponsor" => "/join"]
    write!(c, homestyles())
    header_div = divider("header_div", align = "center")
    style!(header_div, "margin-top" => "250px")
    logo = img("tl_logo", src = "/images/toolips.png")
    push!(header_div, logo)
    nav = navbar(navs)
    push!(header_div, p("g", text = "check us out!"))
    write!(c, header_div)
    write!(c, nav_in())
    write!(c, nav)
    data = get("https://api.github.com/orgs/ChifiSource/members")
    dd = JSON.parse(data)
    teammem = divider("teammembs", align = "center")
    desc = p("ex", text = "These are the people who made projects like this possible.")
    teamheading = h("teamhead", 1,
    style = "'font-size: 30pt; color: #4F77AA;font-family:'Poppins', 'sans-serif';", text = "presenting, our team")
    push!(teammem, teamheading)
    push!(teammem, desc)
    for t in dd
        name = t["login"]
        ppurl = t["avatar_url"]
        url = t["html_url"]
        thisdiv = divider("where")
        thisdiv[:style] = "'border-width: 5px; border-color: lightblue; border-style: solid; margin-left: 100px; margin-right: 100px; margin-bottom: 200px; padding: 30px; float: left;'"
        push!(thisdiv, h("h$name", 2, text = name, link = url, style = "'color: gray;'"))
        push!(thisdiv, img("exampimg", src = "'$ppurl'", width = 150))
        push!(teammem, thisdiv)
    end
    write!(c, teammem)
end

function gallery(c::Connection)
    navs = ["< back" => "/",
        "Extensions" => "/gallery?filter=sextensions",
        "Components" => "/gallery?filter=components",
        "Sites" => "/gallery/?filter=sites"]
    write!(c, homestyles())
    header_div = divider("header_div", align = "center")
    style!(header_div, "margin-top" => "250px")
    logo = img("tl_logo", src = "/images/toolips.png")
    push!(header_div, logo)
    nav = navbar(navs)
    push!(header_div, p("g", text = "gallery"))
    write!(c, header_div)
    write!(c, nav_in())
    write!(c, nav)
end

function main(c::Connection)
    navs = ["gallery" => "/?pull=gallery",
        "team" => "/?pull=team", "Documentation" => "/doc"]
    write!(c, fade_up())
    write!(c, homestyles())
    header_div = divider("header_div", align = "center")
    style!(header_div, "margin-top" => "250px")
    logos = logo_style()
    style!(header_div, logos)
    logo = img("tl_logo", src = "/images/toolips.png")
    push!(header_div, logo)
    nav = navbar(navs)
    push!(header_div, p("g", text = "v 0.1.0"))
    write!(c, header_div)
    write!(c, nav_in())
    write!(c, nav)
end

function home_ref(c::Connection, link::String)
    navs = ["gallery" => "/?pull=gallery",
        "team" => "/?pull=team", "Documentation" => "/doc"]
    write!(c, homestyles())
    header_div = divider("header_div", align = "center")
    style!(header_div, "margin-top" => "250px")
    logo = img("tl_logo", src = "/images/toolips.png")
    push!(header_div, logo)
    nav = navbar(navs, true)
    push!(header_div, p("g", text = "v 0.1.0"))
    write!(c, header_div)
    write!(c, nav_out())
    write!(c, nav)

    write!(c, script("", text = """setTimeout(function(){
            window.location.href = '/$link';
         }, 2000);"""))
end
