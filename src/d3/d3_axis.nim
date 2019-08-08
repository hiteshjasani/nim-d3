## See
##
## * https://github.com/d3/d3-axis
##

import sequtils

import ./types

proc axisTop*(scale: D3ContinuousScale | D3OrdinalScale | D3BandScale): D3Axis {.importc: "d3.axisTop".} ## \
  ## Horizontal axis with tick marks on the top
proc axisRight*(scale: D3ContinuousScale | D3OrdinalScale | D3BandScale): D3Axis {.importc: "d3.axisRight".} ## \
  ## Vertical axis with tick marks on the right
proc axisBottom*(scale: D3ContinuousScale | D3OrdinalScale | D3BandScale): D3Axis {.importc: "d3.axisBottom".} ## \
  ## Horizontal axis with tick marks on the bottom
proc axisLeft*(scale: D3ContinuousScale | D3OrdinalScale | D3BandScale): D3Axis {.importc: "d3.axisLeft".} ## \
  ## Vertical axis with tick marks on the left

proc scale*[T](axis: D3Axis): T {.importcpp.} ## \
  ## Return the current scale object
proc scale*(axis: D3Axis, scaleObj: D3ContinuousScale | D3OrdinalScale | D3BandScale) {.importcpp.} ## \
  ## Set the axis scale

proc ticks*(axis: D3Axis, count: int): D3Axis {.importcpp.} ## \
  ## Set number of ticks
proc ticks*(axis: D3Axis, count: int, specifier: cstring): D3Axis {.importcpp.} ## \
  ## Set number of ticks and format specifier

proc tickFormat*(axis: D3Axis, format: D3Format): D3Axis {.importcpp.} ## \
  ## Set tick label formatter
  ##
  ## .. code::javascript
  ##    // equivalent javascript
  ##    axis.tickFormat(d3.format(",.0f"));
  ##
  ## .. code::nim
  ##    # in nim
  ##    let axis = axisLeft(yScale).tickFormat(d3.format("~s"))
