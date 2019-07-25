include karax/prelude
import d3

const
  orig1 = 5

let
  scaleLin: D3ContinuousScale = scaleLinear()
                                  .continuousDomain(0, 100)
                                  .continuousRange(200, 500)
  scaleLinR: D3ContinuousScale = scaleLinear()
                                   .continuousDomain(0, 100)
                                   .continuousRange(500, 200)
  scaleLinColor: D3ContinuousScale = scaleLinear()
                                       .continuousDomain(0, 100)
                                       .continuousRange("brown", "steelblue")
  scalePieces: D3ContinuousScale = scaleLinear()
                                     .continuousDomain(@[-1, 0, 1])
                                     .continuousRange(@["red", "white", "blue"])
  scaleOrd: D3OrdinalScale = scaleOrdinal()
                               .ordinalDomain(@[0,1,2,3])
                               .ordinalRange(schemeRdBu(4))

proc runOnce() =
  echo "runOnce"

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
            th: text "Type"
            th: text "Domain"
            th: text "Range"
            th: text "Original Value"
            th: text "Scaled Value"
            th: text "Expected Value"
        tbody:
          tr:
            td: text "linear continuous"
            td: text $continuousDomain[int](scaleLin)
            td: text $continuousRange[int](scaleLin)
            td: text $orig1
            td(id = "scaleLin"): text "-"
            td: text "215"
          tr:
            td: text "linear continuous"
            td: text $continuousDomain[int](scaleLinR)
            td: text $continuousRange[int](scaleLinR)
            td: text $orig1
            td(id = "scaleLinR"): text "-"
            td: text "485"
          tr:
            td: text "linear continuous"
            td: text $continuousDomain[int](scaleLinColor)
            td: text $continuousRange[cstring](scaleLinColor)
            td: text $orig1
            td(id = "scaleLinColor"): text "-"
            td: text "rgb(160, 46, 49)"
          tr:
            td: text "linear continuous"
            td: text $continuousDomain[int](scalePieces)
            td: text $continuousRange[cstring](scalePieces)
            td: text "-0.5"
            td(id = "scalePieces1"): text "-"
            td: text "rgb(255, 128, 128)"
          tr:
            td: text "linear continuous"
            td: text $continuousDomain[int](scalePieces)
            td: text $continuousRange[cstring](scalePieces)
            td: text "0.5"
            td(id = "scalePieces2"): text "-"
            td: text "rgb(128, 128, 255)"
          tr:
            td: text "ordinal"
            td: text $ordinalDomain[int](scaleOrd)
            td: text $ordinalRange[cstring](scaleOrd)
            td: text "0"
            td(id = "scaleOrd1"): text "-"
            td: text "#ca0020"
          tr:
            td: text "ordinal"
            td: text $ordinalDomain[int](scaleOrd)
            td: text $ordinalRange[cstring](scaleOrd)
            td: text "1"
            td(id = "scaleOrd2"): text "-"
            td: text "#f4a582"
          tr:
            td: text "ordinal"
            td: text $ordinalDomain[int](scaleOrd)
            td: text $ordinalRange[cstring](scaleOrd)
            td: text "3"
            td(id = "scaleOrd3"): text "-"
            td: text "#0571b0"
    button(`type` = "button"):
      text "Scale values"
      proc onclick(ev: Event, n: VNode) =
        discard select("#testarea #scaleLin").text($exec(scaleLin, orig1))
        discard select("#testarea #scaleLinR").text($exec(scaleLinR, orig1))
        discard select("#testarea #scaleLinColor").text($exec(scaleLinColor,
                                                              orig1))
        discard select("#testarea #scalePieces1").text($exec(scalePieces, -0.5))
        discard select("#testarea #scalePieces2").text($exec(scalePieces, 0.5))
        discard select("#testarea #scaleOrd1").text($exec(scaleOrd, 0))
        discard select("#testarea #scaleOrd2").text($exec(scaleOrd, 1))
        discard select("#testarea #scaleOrd3").text($exec(scaleOrd, 3))

setRenderer createDom
setForeignNodeId("testarea")
#--------------------------------------
redrawSync()
runOnce()
