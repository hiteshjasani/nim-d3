include karax/prelude
import d3

type
  DataPt = ref object
    x: float
    y: float

let rawdata: seq[DataPt] = @[DataPt(x: 10.0, y: 12.1)
                             ,DataPt(x: 22.0, y: 32.5)
                             ,DataPt(x: 101.3, y: 5.0)
                             ,DataPt(x: 196.2, y: 8.5)
                             ,DataPt(x: 2.7, y: 174.3)
                             ,DataPt(x: 100.0, y: 100.0)
                             ,DataPt(x: 125.4, y: 184.9)]

proc runOnce() =
  let
    width = 200
    height = 200

  let svg = select("#testarea")
    .append("svg")
      .attr("width", width)
      .attr("height", height)

  discard svg.append("rect")
    .attr("width", width)
    .attr("height", height)
    .attr("fill", "yellow")
    .attr("fill-opacity", 0.3)

  discard svg.selectAll("circle")
    .data(rawdata)
    .enter().append("circle")
      .attr("cx", proc(d: DataPt): float = d.x)
      .attr("cy", proc(d: DataPt): float = d.y)
      .attr("r", 12.5)

proc createDom(): VNode =
  result = buildHtml(tdiv):
    h1: text "Example 4"
    p: text "Plot circles.  The circles are only drawn once on page load and will not be redrawn even if karax redraws the vdom.  Also note that the circles are plotted with their y values upside down because we haven't applied scaling yet."
    tdiv:
      text "<< "
      a(href = "/"): text "home"
    tdiv(id = "testarea")

setRenderer createDom
setForeignNodeId("testarea")
#--------------------------------------
redrawSync()
runOnce()
