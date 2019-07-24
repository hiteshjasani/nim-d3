########################################################################
## Transformation functions
##
## SVG origin is defined to be the top-left corner. Moving right is
## the positive x axis and moving down is the positive y axis.
##

import strformat

proc translate*[T](x, y: T): cstring =
  cstring(&"translate({x},{y})")

proc scaleAndTranslate*[T](sx, sy, tx, ty: T): cstring =
  cstring(&"""scale({sx},{sy})
              translate({tx},{ty})""")

proc translateAndScale*[T](tx, ty, sx, sy: T): cstring =
  cstring(&"""translate({tx},{ty})
              scale({sx},{sy})""")

proc translateAndRotate*[T](tx, ty, deg: T): cstring =
  cstring(&"""translate({tx},{ty})
              rotate({deg})""")
