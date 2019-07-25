import sequtils

import scaling_chromatic

export scaling_chromatic

type
  D3ContinuousScale* = ref object
  D3OrdinalScale* = ref object
  D3Axis* = ref object


proc scaleLinear*(): D3ContinuousScale {.importc: "d3.scaleLinear".}
proc exec*(scale: D3ContinuousScale, v: int): int {.importc: "function(scale, v){ return scale(v) }".}
proc exec*(scale: D3ContinuousScale, v: float): float {.importc: "function(scale, v){ return scale(v) }".}
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



proc axisTop*(scale: D3ContinuousScale | D3OrdinalScale): D3Axis {.importc: "d3.axisTop".}
proc axisRight*(scale: D3ContinuousScale | D3OrdinalScale): D3Axis {.importc: "d3.axisRight".}
proc axisBottom*(scale: D3ContinuousScale | D3OrdinalScale): D3Axis {.importc: "d3.axisBottom".}
proc axisLeft*(scale: D3ContinuousScale | D3OrdinalScale): D3Axis {.importc: "d3.axisLeft".}

proc scaleOrdinal*(): D3OrdinalScale {.importc: "d3.scaleOrdinal".}
proc scaleOrdinal*(rng: cstring): D3OrdinalScale {.importc: "d3.scaleOrdinal".}
proc scaleOrdinal*(rng: seq[cstring]): D3OrdinalScale {.importc: "d3.scaleOrdinal".}
proc exec*(scale: D3OrdinalScale, i: int): cstring {.importc: "function(scale, i){ return scale(i) }".}
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
