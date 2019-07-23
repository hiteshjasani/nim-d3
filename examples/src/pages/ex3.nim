include karax/prelude
import d3

const
  orig1 = 5
var
  scaleLin: D3ContinuousScale
  scaleLinR: D3ContinuousScale

proc runOnce() =
  scaleLin = scaleLinear().continuousDomain(0, 100).continuousRange(200, 500)
  scaleLinR = scaleLinear().continuousDomain(0, 100).continuousRange(500, 200)

proc createDom(): VNode =
  result = buildHtml(tdiv):
    h1: text "Example 3"
    p: text "Scales - Linear ..."
    tdiv:
      text "<< "
      a(href = "/"): text "home"
    tdiv(id = "testarea"):
      table:
        thead:
          tr:
            th: text "Original"
            th: text "Domain"
            th: text "Range"
            th: text "Scaled"
        tbody:
          tr:
            td: text $orig1
            td: text "0 - 100"
            td: text "200 - 500"
            td(id = "scaleLin"): text "-"
          tr:
            td: text $orig1
            td: text "0 - 100"
            td: text "500 - 200"
            td(id = "scaleLinR"): text "-"
    button(`type` = "button"):
      text "Scale values"
      proc onclick(ev: Event, n: VNode) =
        discard select("#testarea #scaleLin").text($exec(scaleLin, orig1))
        discard select("#testarea #scaleLinR").text($exec(scaleLinR, orig1))

setRenderer createDom
setForeignNodeId("testarea")
#--------------------------------------
redrawSync()
runOnce()
