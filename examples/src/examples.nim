import asynchttpserver, asyncdispatch, strformat, strutils

type
  Example = ref object
    id: int
    name: string

proc link(ex: Example): string =
  &"""<a href="/ex/ex{ex.id}">Example {ex.id}: {ex.name}</a>"""

proc index(): string =
  let examples = @[Example(id: 1, name: "Selecting elements and applying styles")
                   ,Example(id: 2, name: "Appending elements")
                   ,Example(id: 3, name: "Scaling using domain and range")
                   ,Example(id: 4, name: "Simple plot of circles")
                   ,Example(id: 5, name: "Sample scatterplot")
                   ,Example(id: 6, name: "Seattle rainfall column chart")]

  result = """
<!DOCTYPE html>
<html lang="en">
<head>
</head>
<body>
<ul>
"""
  for x in examples:
    result.add("<li>" & link(x) & "</li>")
  result.add("""
</ul>
</body>
</html>
""")

proc loadJS(jspath: string): string =
  let style = """
<style>
div#testarea {
  border: 1px solid black;
  padding: 20px;
  margin: 10px;
}

th, td {
  padding: 10px;
}

div.tooltip {
  position: absolute;
  text-align: center;
  width: 100px;
  height: 28px;
  padding: 2px;
  font: 12px sans-serif;
  background: lightsteelblue;
  border: 0px;
  border-radius: 8px;
  pointer-events: none;
}
</style>
"""

  &"""
<!DOCTYPE html>
<html lang="en">
  <head>
  {style}
  </head>
  <body>
    <main role="main">
      <div id="ROOT" />
    </main>
    <script src="https://d3js.org/d3.v5.min.js"></script>
    <script type="text/javascript" src="{jspath}"></script>
  </body>
</html>
"""

proc routeHandler(req: Request) {.async.} =
  case req.url.path
  of "/":
    await req.respond(Http200, index())
  else:
    if startsWith(req.url.path, "/ex/"):
      let
        ex = req.url.path[4..^1]
        path = "/js/" & ex & ".js"
      await req.respond(Http200, loadJS(path))
    elif startsWith(req.url.path, "/js/"):
      let jsfilename = "public" & req.url.path
      try:
        await req.respond(Http200, readFile(jsfilename),
                          newHttpHeaders([("Content-Type","application/javascript")]))
      except:
        await req.respond(Http500, "Could not load " & jsfilename)
    else:
      await req.respond(Http404, "Resource not found!")

when isMainModule:
  var server = newAsyncHttpServer()
  echo "Point your browser to http://localhost:9000/"
  waitFor server.serve(Port(9000), routeHandler)
