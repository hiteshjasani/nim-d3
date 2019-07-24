include karax/prelude
import d3

const
  orig1 = 5
var
  scaleLin: D3ContinuousScale
  scaleLinR: D3ContinuousScale
  scaleLinColor: D3ContinuousScale
  scalePieces: D3ContinuousScale

proc runOnce() =
  scaleLin = scaleLinear().continuousDomain(0, 100).continuousRange(200, 500)
  scaleLinR = scaleLinear().continuousDomain(0, 100).continuousRange(500, 200)
  scaleLinColor = scaleLinear().continuousDomain(0, 100).continuousRange("brown", "steelblue")
  scalePieces = scaleLinear().continuousDomain(@[-1, 0, 1]).continuousRange(@["red", "white", "blue"])

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
          tr:
            td: text $orig1
            td: text "0 - 100"
            td: text "brown - steelblue"
            td(id = "scaleLinColor"): text "-"
          tr:
            td: text "-0.5"
            td: text "-1, 0, 1"
            td: text "red, white, blue"
            td(id = "scalePieces1"): text "-"
          tr:
            td: text "0.5"
            td: text "-1, 0, 1"
            td: text "red, white, blue"
            td(id = "scalePieces2"): text "-"
    button(`type` = "button"):
      text "Scale values"
      proc onclick(ev: Event, n: VNode) =
        discard select("#testarea #scaleLin").text($exec(scaleLin, orig1))
        discard select("#testarea #scaleLinR").text($exec(scaleLinR, orig1))
        discard select("#testarea #scaleLinColor").text($exec(scaleLinColor,
                                                              orig1))
        discard select("#testarea #scalePieces1").text($exec(scalePieces, -0.5))
        discard select("#testarea #scalePieces2").text($exec(scalePieces, 0.5))

setRenderer createDom
setForeignNodeId("testarea")
#--------------------------------------
redrawSync()
runOnce()
