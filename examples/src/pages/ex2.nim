include karax/prelude
import karax/vstyles
import d3

proc createDom(): VNode =
  result = buildHtml(tdiv):
    h1: text "Example 2"
    p: text "Select elements and apply style"
    tdiv(id = "testarea",
         style = vstyles.style((border, cstring"black solid 1px")
                               ,(padding, cstring"20px"))):
      p: text "para element"
      p(class = "colorable"): text "Colorable para element"
    button(`type` = "button"):
      text "Add SVG"
      proc onclick(ev: Event, n: VNode) =
        discard select("#testarea")
          .append("svg")
            .attr("width", "500")
            .attr("height", "300")
          .append("rect")
            .attr("width", "500")
            .attr("height", "300")
            .attr("fill", "yellow")
            .attr("border", "solid 1px blue")

setRenderer createDom
setForeignNodeId("testarea")
