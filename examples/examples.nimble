# Package

version       = "0.1.0"
author        = "Hitesh Jasani"
description   = "Examples using nim and D3"
license       = "MIT"
srcDir        = "src"
bin           = @["examples"]



# Dependencies

requires "nim >= 0.20.0"
requires "karax"

from os import splitFile, addFileExt

task pages, "Build javascript pages":
  if dirExists("public/js"):
    rmDir("public/js")

  mkDir("public/js")
  for file in listfiles("src/pages/"):
    let fileparts = splitFile(file)
    if fileparts.ext == ".nim":
      let
        opts = "--hints:off"
        jsfile = "public/js/" & fileparts.name.addFileExt("js")
        cmd = "nim js " & opts & " -o:" & jsfile & " " & file
      exec cmd
