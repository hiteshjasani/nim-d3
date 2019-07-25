## Transformation functions
##
## SVG origin is defined to be the top-left corner. Moving right is
## the positive x axis and moving down is the positive y axis.
##
## These routines are utility routines to help construct the value on
## a transform attribute.
##
## .. code::nim
##    .attr("transform", translate(-5, 30))
##


import strformat

proc translate*[T](x, y: T): cstring =
  ## Linear move of x and y offset
  cstring(&"translate({x},{y})")

proc scaleAndTranslate*[T](sx, sy, tx, ty: T): cstring =
  ## Scale by sx and sy and then linear move tx and ty
  cstring(&"""scale({sx},{sy})
              translate({tx},{ty})""")

proc translateAndScale*[T](tx, ty, sx, sy: T): cstring =
  ## Linear move tx and ty and then scale by sx and sy
  cstring(&"""translate({tx},{ty})
              scale({sx},{sy})""")

proc translateAndRotate*[T](tx, ty, deg: T): cstring =
  ## Linear move tx and ty and then rotate by deg degrees
  cstring(&"""translate({tx},{ty})
              rotate({deg})""")
