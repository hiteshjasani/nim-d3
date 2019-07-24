import strformat

proc translate*[T](x, y: T): cstring =
  cstring(&"translate({x},{y})")
