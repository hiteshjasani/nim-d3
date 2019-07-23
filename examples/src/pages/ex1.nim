include karax/prelude
import karax/vstyles
import d3

proc createDom(): VNode =
  result = buildHtml(tdiv):
    h1: text "Example 1"
    p: text "Select elements and apply style"
    tdiv(id = "testarea",
         style = vstyles.style((border, cstring"black solid 1px")
                               ,(padding, cstring"20px"))):
      p: text "para element"
      p(class = "colorable"): text "Colorable para element"
    button(`type` = "button"):
      text "Change color"
      proc onclick(ev: Event, n: VNode) =
        discard select("#testarea p").style("color", "red")
        discard select("#testarea .colorable").style("color", "green")

setRenderer createDom
