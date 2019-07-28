## See
##
## * https://github.com/d3/d3-scale
##

import sequtils

import ./types


proc exec*(scale: D3ContinuousScale | D3OrdinalScale | D3BandScale;
           v: int): int {.importc: "function(scale, v){ return scale(v) }".} ## \
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

proc exec*(scale: D3ContinuousScale | D3OrdinalScale | D3BandScale;
           v: float): float {.importc: "function(scale, v){ return scale(v) }".} ## \
  ## Given a value in the domain, map to a value in the range

proc exec*[T](scale: D3ContinuousScale | D3OrdinalScale | D3BandScale;
              v: T): int {.importc: "function(scale, v){ return scale(v) }".} ## \
  ## Given a value in the domain, map to a value in the range

proc invert*(scale: D3ContinuousScale | D3OrdinalScale | D3BandScale;
             v: int): int {.importc: "function(scale, v){ return scale.invert(v) }".} ## \
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

proc invert*(scale: D3ContinuousScale | D3OrdinalScale | D3BandScale;
             v: float): float {.importc: "function(scale, v){ return scale.invert(v) }".} ## \
  ## Given a value in the range, map to a value in the domain

proc invert*[T, U](scale: D3ContinuousScale | D3OrdinalScale | D3BandScale;
                   v: T): U {.importc: "function(scale, v){ return scale.invert(v) }".} ## \
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



proc axisTop*(scale: D3ContinuousScale | D3OrdinalScale | D3BandScale): D3Axis {.importc: "d3.axisTop".} ## \
  ## Horizontal axis with tick marks on the top
proc axisRight*(scale: D3ContinuousScale | D3OrdinalScale | D3BandScale): D3Axis {.importc: "d3.axisRight".} ## \
  ## Vertical axis with tick marks on the right
proc axisBottom*(scale: D3ContinuousScale | D3OrdinalScale | D3BandScale): D3Axis {.importc: "d3.axisBottom".} ## \
  ## Horizontal axis with tick marks on the bottom
proc axisLeft*(scale: D3ContinuousScale | D3OrdinalScale | D3BandScale): D3Axis {.importc: "d3.axisLeft".} ## \
  ## Vertical axis with tick marks on the left
proc scale*(axis: D3Axis, scaleObj: D3ContinuousScale | D3OrdinalScale | D3BandScale) {.importcpp.}


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


proc scaleBand*(): D3BandScale {.importc: "d3.scaleBand".}
proc scaleBand*(rng: seq[int]): D3BandScale {.importc: "function(rng){ d3.scaleBand(rng) }".}
proc scaleBand*(dom, rng: seq[int]): D3BandScale {.importc: "function(dom, rng){ d3.scaleBand(dom, rng) }".}

proc bandDomain*(scale: D3BandScale): seq[cstring] {.importc: "function(scale){ return scale.domain() }".}
proc bandDomain*(scale: D3BandScale, extents: seq[cstring]): D3BandScale {.importc: "function(scale, extents){ return scale.domain(extents) }".}

proc bandRange*(scale: D3BandScale; minR, maxR: int | float): D3BandScale {.importc: "function(scale, minv, maxv){ return scale.range([minv, maxv]) }".}

proc bandRangeRound*(scale: D3BandScale; minR, maxR: int | float): D3BandScale {.importc: "function(scale, minv, maxv){ return scale.rangeRound([minv, maxv]) }".} ## \
  ## Convenience function equivalent to setting bandRange and calling
  ## scale.round(true)

proc round*(scale: D3BandScale): bool {.importcpp.} ## \
  ## Get rounding setting
proc round*(scale: D3BandScale, val: bool): D3BandScale {.importcpp.} ## \
  ## Set rounding

proc paddingInner*(scale: D3BandScale): float {.importcpp.} ## \
  ## Get inner padding setting
proc paddingInner*(scale: D3BandScale, pad: int | float): D3BandScale {.importcpp.} ## \
  ## Set inner padding

proc paddingOuter*(scale: D3BandScale): float {.importcpp.} ## \
  ## Get outer padding setting
proc paddingOuter*(scale: D3BandScale, pad: int | float): D3BandScale {.importcpp.} ## \
  ## Set outer padding

proc padding*(scale: D3BandScale): int {.importcpp.} ## \
  ## Get inner padding setting
proc padding*(scale: D3BandScale, pad: int): D3BandScale {.importcpp.} ## \
  ## Set both inner and outer padding

proc align*(scale: D3BandScale): float {.importcpp.} ## \
  ## Get the alignment
proc align*(scale: D3BandScale, val: float): D3BandScale {.importcpp.} ## \
  ## Set the alignment

proc bandwidth*(scale: D3BandScale): int {.importcpp.} ## \
  ## Return the width of each band

proc step*(scale: D3BandScale): int {.importcpp.} ## \
  ## Distance between the starts of adjacent bands

proc copy*(scale: D3BandScale): D3BandScale {.importcpp.} ## \
  ## Returns an exact copy of this scale.  Changes will not affect the other.
