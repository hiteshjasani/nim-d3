include karax/prelude
import d3

proc createDom(): VNode =
  result = buildHtml(tdiv):
    h1: text "Example 2"
    p: text "Select elements and append SVG"
    tdiv:
      text "<< "
      a(href = "/"): text "home"
    tdiv(id = "testarea"):
      p: text "para element"
      p(class = "colorable"): text "Colorable para element"
    button(`type` = "button"):
      text "Add SVG"
      proc onclick(ev: Event, n: VNode) =
        discard d3.select("#testarea")
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
