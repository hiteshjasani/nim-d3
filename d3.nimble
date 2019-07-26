# Package

version       = "0.1.1"
author        = "Hitesh Jasani"
description   = "Nim bindings to D3js"
license       = "MIT"
srcDir        = "src"

backend       = "js"

# Dependencies

requires "nim >= 0.20.0"

# Tasks

task docs, "Build documentation":
  mkDir("docs/d3")
  exec "nim doc --project --index:on --outdir:docs src/d3.nim"
  exec "nim buildIndex -o:docs/theindex.html docs"
