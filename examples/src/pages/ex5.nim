from sequtils import map
import strformat
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
    svgWidth = 400
    svgHeight = 300
    inset = 50
    gWidth = svgWidth - inset
    gHeight = svgHeight - inset
    minX = min(map(rawdata, proc(d: DataPt): float = d.x))
    maxX = max(map(rawdata, proc(d: DataPt): float = d.x))
    minY = min(map(rawdata, proc(d: DataPt): float = d.y))
    maxY = max(map(rawdata, proc(d: DataPt): float = d.y))
    xScale: D3ContinuousScale = scaleLinear()
                                  .continuousDomain(minX, maxX)
                                  .continuousRange(0, gWidth)
    yScale: D3ContinuousScale = scaleLinear()
                                  .continuousDomain(minY, maxY)
                                  .continuousRange(gHeight, 0)

  let svg = select("#testarea")
    .append("svg")
      .attr("width", svgWidth)
      .attr("height", svgHeight)

  discard svg.append("rect")
    .attr("width", svgWidth)
    .attr("height", svgHeight)
    .attr("fill", "yellow")
    .attr("fill-opacity", 0.3)

  let g = svg.append("g")
    .attr("width", gWidth)
    .attr("height", gHeight)
    .attr("transform", translate(inset, 0))

  discard g.selectAll("circle")
    .data(rawdata)
    .enter().append("circle")
      .attr("cx", proc(d: DataPt): float = exec(xScale, d.x))
      .attr("cy", proc(d: DataPt): float = exec(yScale, d.y))
      .attr("r", 12.5)

proc createDom(): VNode =
  result = buildHtml(tdiv):
    h1: text "Example 5"
    p: text "Plot circles.  The circles are only drawn once on page load and will not be redrawn even if karax redraws the vdom.  The input data is scaled so that the circles are drawn correctly."
    tdiv:
      text "<< "
      a(href = "/"): text "home"
    tdiv(id = "testarea")

setRenderer createDom
setForeignNodeId("testarea")
#--------------------------------------
redrawSync()
runOnce()
