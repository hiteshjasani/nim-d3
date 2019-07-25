include karax/prelude
import d3


proc createDom(): VNode =
  result = buildHtml(tdiv):
    h1: text "Example 1"
    p: text "Select elements and apply style"
    tdiv:
      text "<< "
      a(href = "/"): text "home"
    tdiv(id = "testarea"):
      p: text "para element"
      p(class = "colorable"): text "Colorable para element"
    button(`type` = "button"):
      text "Change color"
      proc onclick(ev: Event, n: VNode) =
        discard d3.select("#testarea p").style("color", "red")
        discard d3.select("#testarea .colorable").style("color", "green")

setRenderer createDom
