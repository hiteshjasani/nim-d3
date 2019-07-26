## See
##
## * https://github.com/d3/d3-scale
##

import sequtils

import ./types


proc exec*(scale: D3ContinuousScale | D3OrdinalScale, v: int): int {.importc: "function(scale, v){ return scale(v) }".} ## \
  ## Given a value in the domain, map to a value in the range
  ##
  ## .. code::javascript
  ##    // in javascript
  ##    var x = d3.scaleLinear()
  ##        .domain([10, 130])
  ##        .range([0, 960]);
  ##
  ##    x(130); // 960
  ##
  ## .. code::nim
  ##    # in nim
  ##    let x = d3.scaleLinear()
  ##              .continuousDomain(@[10, 130])
  ##              .continuousRange(@[0, 960])
  ##
  ##    x.exec(130) # 960

proc exec*(scale: D3ContinuousScale | D3OrdinalScale, v: float): float {.importc: "function(scale, v){ return scale(v) }".} ## \
  ## Given a value in the domain, map to a value in the range

proc invert*(scale: D3ContinuousScale | D3OrdinalScale, v: int): int {.importc: "function(scale, v){ return scale.invert(v) }".} ## \
  ## Given a value in the range, map to a value in the domain
  ##
  ## .. code::javascript
  ##    // in javascript
  ##    var x = d3.scaleLinear()
  ##        .domain([10, 130])
  ##        .range([0, 960]);
  ##
  ##    x.invert(960); // 130
  ##
  ## .. code::nim
  ##    # in nim
  ##    let x = d3.scaleLinear()
  ##              .continuousDomain(@[10, 130])
  ##              .continuousRange(@[0, 960])
  ##
  ##    x.invert(960) # 130

proc invert*(scale: D3ContinuousScale | D3OrdinalScale, v: float): float {.importc: "function(scale, v){ return scale.invert(v) }".} ## \
  ## Given a value in the range, map to a value in the domain


proc scaleLinear*(): D3ContinuousScale {.importc: "d3.scaleLinear".}


proc continuousDomain*[T](scale: D3ContinuousScale): seq[T] {.importc: "function(scale){ return scale.domain() }".}
proc continuousDomain*[T](scale: D3ContinuousScale; minVal, maxVal: T): D3ContinuousScale {.importc: "function(scale, minVal, maxVal){ return scale.domain([minVal, maxVal]) }".}
# proc continuousDomain*(scale: D3ContinuousScale; minVal, maxVal: int): D3ContinuousScale {.importc: "function(scale, minVal, maxVal){ return scale.domain([minVal, maxVal]) }".}
proc continuousDomain*(scale: D3ContinuousScale; extents: seq[int]): D3ContinuousScale {.importc: "function(scale, extents){ return scale.domain(extents) }".}


proc continuousRange*[T](scale: D3ContinuousScale): seq[T] {.importc: "function(scale){ return scale.range() }".}
proc continuousRange*(scale: D3ContinuousScale; minVal, maxVal: int): D3ContinuousScale {.importc: "function(scale, minVal, maxVal){ return scale.range([minVal, maxVal]) }".}
proc continuousRange*(scale: D3ContinuousScale; extents: seq[int]): D3ContinuousScale {.importc: "function(scale, extents){ return scale.range(extents) }".}
proc continuousRange*(scale: D3ContinuousScale; minVal, maxVal: cstring): D3ContinuousScale {.importc: "function(scale, minVal, maxVal){ return scale.range([minVal, maxVal]) }".}
proc continuousRange*(scale: D3ContinuousScale; extents: seq[cstring]): D3ContinuousScale {.importc: "function(scale, extents){ return scale.range(extents) }".}
proc continuousRange*(scale: D3ContinuousScale;
                      extents: seq[string]): D3ContinuousScale =
  continuousRange(scale, map(extents, proc(x: string): cstring =
                                          cstring(x)))
# This causes string ranges to not work as expected
# proc continuousRange*[T](scale: D3ContinuousScale; minVal, maxVal: T): D3ContinuousScale {.importc: "function(scale, minVal, maxVal){ return scale.range([minVal, maxVal]) }".}



proc axisTop*(scale: D3ContinuousScale | D3OrdinalScale): D3Axis {.importc: "d3.axisTop".} ## \
  ## Horizontal axis with tick marks on the top
proc axisRight*(scale: D3ContinuousScale | D3OrdinalScale): D3Axis {.importc: "d3.axisRight".} ## \
  ## Vertical axis with tick marks on the right
proc axisBottom*(scale: D3ContinuousScale | D3OrdinalScale): D3Axis {.importc: "d3.axisBottom".} ## \
  ## Horizontal axis with tick marks on the bottom
proc axisLeft*(scale: D3ContinuousScale | D3OrdinalScale): D3Axis {.importc: "d3.axisLeft".} ## \
  ## Vertical axis with tick marks on the left


proc scaleOrdinal*(): D3OrdinalScale {.importc: "d3.scaleOrdinal".}
proc scaleOrdinal*(rng: cstring): D3OrdinalScale {.importc: "d3.scaleOrdinal".}
proc scaleOrdinal*(rng: seq[cstring]): D3OrdinalScale {.importc: "d3.scaleOrdinal".}


proc ordinalDomain*[T](scale: D3OrdinalScale): seq[T] {.importc: "function(scale){ return scale.domain() }".}
proc ordinalDomain*[T](scale: D3OrdinalScale; minVal, maxVal: T): D3OrdinalScale {.importc: "function(scale, minVal, maxVal){ return scale.domain([minVal, maxVal]) }".}
proc ordinalDomain*(scale: D3OrdinalScale; extents: seq[int]): D3OrdinalScale {.importc: "function(scale, extents){ return scale.domain(extents) }".}


proc ordinalRange*[T](scale: D3OrdinalScale): seq[T] {.importc: "function(scale){ return scale.range() }".}
proc ordinalRange*(scale: D3OrdinalScale; extents: cstring): D3OrdinalScale {.importc: "function(scale, extents){ return scale.range(extents) }".}
proc ordinalRange*(scale: D3OrdinalScale; extents: seq[int]): D3OrdinalScale {.importc: "function(scale, extents){ return scale.range(extents) }".}
proc ordinalRange*(scale: D3OrdinalScale; minVal, maxVal: cstring): D3OrdinalScale {.importc: "function(scale, minVal, maxVal){ return scale.range([minVal, maxVal]) }".}
proc ordinalRange*(scale: D3OrdinalScale; extents: seq[cstring]): D3OrdinalScale {.importc: "function(scale, extents){ return scale.range(extents) }".}
proc ordinalRange*(scale: D3OrdinalScale,
                   extents: seq[string]): D3OrdinalScale =
  ordinalRange(scale, map(extents, proc(x: string): cstring = cstring(x)))
