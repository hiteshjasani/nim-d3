import asynchttpserver, asyncdispatch, strformat, strutils

proc link(exampleNumber: int): string =
  &"""<a href="/ex/ex{exampleNumber}">Example {exampleNumber}</a>"""

proc index(): string =
  result = """
<!DOCTYPE html>
<html lang="en">
<head>
</head>
<body>
<ul>
"""
  for i in 1..4:
    result.add("<li>" & link(i) & "</li>")
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
                          newHttpHeaders([("Content-Type","application/json")]))
      except:
        await req.respond(Http500, "Could not load " & jsfilename)
    else:
      await req.respond(Http404, "Resource not found!")

when isMainModule:
  var server = newAsyncHttpServer()
  echo "Point your browser to http://localhost:9000/"
  waitFor server.serve(Port(9000), routeHandler)
