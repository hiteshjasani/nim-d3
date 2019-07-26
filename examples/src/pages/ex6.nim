from sequtils import map
import strformat
include karax/prelude
import d3

type
  DataPt = ref object
    day: int
    rain: float

# data is rainfall in Seattle from Feb 1, 2019 - Feb 14, 2019
# https://www.ncdc.noaa.gov/cdo-web/datasets/GHCND/stations/GHCND:USW00024233/detail

let rawdata: seq[DataPt] = @[DataPt(day: 1, rain: 0.68)
                             ,DataPt(day: 2, rain: 0.03)
                             ,DataPt(day: 3, rain: 0.09)
                             ,DataPt(day: 4, rain: 0.13)
                             ,DataPt(day: 5, rain: 0.0)
                             ,DataPt(day: 6, rain: 0.0)
                             ,DataPt(day: 7, rain: 0.0)
                             ,DataPt(day: 8, rain: 0.46)
                             ,DataPt(day: 9, rain: 0.16)
                             ,DataPt(day: 10, rain: 0.16)
                             ,DataPt(day: 11, rain: 1.22)
                             ,DataPt(day: 12, rain: 0.86)
                             ,DataPt(day: 13, rain: 0.02)
                             ,DataPt(day: 14, rain: 0.12)]

proc runOnce() =
  let
    svgWidth = 600
    svgHeight = 300
    insetLeft = 80
    insetBottom = 50
    gWidth = svgWidth - insetLeft
    gHeight = svgHeight - insetBottom
    minY = min(map(rawdata, proc(d: DataPt): float = d.rain))
    maxY = max(map(rawdata, proc(d: DataPt): float = d.rain))
    domX = map(rawdata, proc(d: DataPt): cstring = cstring($d.day))
    xScale: D3BandScale = scaleBand()
                            .bandDomain(domX)
                            .bandRange(0, gWidth)
                            .paddingInner(0.1)
                            .paddingOuter(0.2)
                            .align(0.5)
                            .round(true)
    yScale: D3ContinuousScale = scaleLinear()
                                  .continuousDomain(minY, maxY)
                                  # Use with origin in top-left corner
                                  .continuousRange(gHeight, 0)
    xAxis: D3Axis = axisBottom(xScale)
    yAxis: D3Axis = axisLeft(yScale)

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
    # Origin is top-left corner, use with yRange [gHeight 0]
    .attr("transform", translate(insetLeft, 0))

  discard g.append("g")
    .attr("class", "x-axis axis")
    .attr("transform", translate(0, gHeight))
    .call(xAxis)
  discard g.append("g")
    .attr("class", "y-axis axis")
    .call(yAxis)

  discard svg.append("text")
    .attr("text-anchor", "middle")
    .attr("transform", translate(insetLeft.float + gWidth/2,
                                 svgHeight.float - insetBottom/4))
    .text("Feb 2019 (day)")

  discard svg.append("text")
    .attr("text-anchor", "middle")
    .attr("transform", translateAndRotate(insetLeft/3, gHeight/2, -90))
    .text("Rainfall (inches)")

  let tooltip = select("body")
    .append("div")
      .attr("class", "tooltip")
      .style("opacity", 0)

  discard g.selectAll("rect")
    .data(rawdata)
    .enter().append("rect")
      .attr("fill", "steelblue")
      .attr("x", proc(d: DataPt): int = exec(xScale, d.day))
      .attr("width", xScale.bandwidth())
      .attr("y", proc(d: DataPt): float = exec(yScale, d.rain))
      .attr("height", proc(d: DataPt): float = gHeight.float - exec(yScale, d.rain))
      .on("mouseover", proc(d: DataPt) =
                         discard tooltip
                           .html("day: " & $d.day & "<br/>" & "rain: " &
                             $d.rain & " inches")
                           .style("left", $(d3.event().pageX + 25) & "px")
                           .style("top", $d3.event().pageY & "px")
                         discard tooltip.transition()
                           .duration(200)
                           .style("opacity", 0.9))
      .on("mouseout", proc(d: DataPt) =
                        discard tooltip.transition()
                          .duration(500)
                          .style("opacity", 0.0))

proc createDom(): VNode =
  result = buildHtml(tdiv):
    h1: text "Example 6: Seattle Rainfall Column Chart"
    tdiv:
      text "<< "
      a(href = "/"): text "home"
    tdiv(id = "testarea")
    ul:
      li: text "Rainfall in Seattle from Feb 1, 2019 to Feb 14, 2019"
      li:
        span: text "Data sourced from "
        a(href = "https://www.ncdc.noaa.gov/cdo-web/datasets/GHCND/stations/GHCND:USW00024233/detail"): text "noaa.gov"

setRenderer createDom
setForeignNodeId("testarea")
#--------------------------------------
redrawSync()
runOnce()
