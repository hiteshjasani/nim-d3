import jsbind, sequtils

type
  D3ContinuousScale* = ref object of JSObj
  D3Axis* = ref object of JSObj


proc scaleLinear*(): D3ContinuousScale {.jsimportgWithName: "d3.scaleLinear".}
proc exec*(scale: D3ContinuousScale, v: int): int {.jsimportgWithName: "function(scale, v) {return scale(v)}"}
proc exec*(scale: D3ContinuousScale, v: float): float {.jsimportgWithName: "function(scale, v) {return scale(v)}"}
proc continuousDomain*[T](scale: D3ContinuousScale; minVal, maxVal: T): D3ContinuousScale {.jsimportgWithName: "function(scale, minVal, maxVal){ return scale.domain([minVal, maxVal])}".}
# proc continuousDomain*(scale: D3ContinuousScale; minVal, maxVal: int): D3ContinuousScale {.jsimportgWithName: "function(scale, minVal, maxVal){ return scale.domain([minVal, maxVal])}".}
proc continuousDomain*(scale: D3ContinuousScale; extents: seq[int]): D3ContinuousScale {.jsimportgWithName: "function(scale, extents){ return scale.domain(extents)}".}
proc continuousRange*(scale: D3ContinuousScale; minVal, maxVal: int): D3ContinuousScale {.jsimportgWithName: "function(scale, minVal, maxVal){return scale.range([minVal, maxVal])}".}
proc continuousRange*(scale: D3ContinuousScale; extents: seq[int]): D3ContinuousScale {.jsimportgWithName: "function(scale, extents){return scale.range(extents)}".}
proc continuousRange*(scale: D3ContinuousScale; minVal, maxVal: cstring): D3ContinuousScale {.jsimportgWithName: "function(scale, minVal, maxVal){return scale.range([minVal, maxVal])}".}
proc continuousRange*(scale: D3ContinuousScale; extents: seq[cstring]): D3ContinuousScale {.jsimportgWithName: "function(scale, extents){return scale.range(extents)}".}
proc continuousRange*(scale: D3ContinuousScale;
                      extents: seq[string]): D3ContinuousScale =
  continuousRange(scale, map(extents, proc(x: string): cstring =
                                          cstring(x)))
# This causes string ranges to not work as expected
# proc continuousRange*[T](scale: D3ContinuousScale; minVal, maxVal: T): D3ContinuousScale {.jsimportgWithName: "function(scale, minVal, maxVal){return scale.range([minVal, maxVal])}".}

proc axisTop*(scale: D3ContinuousScale): D3Axis {.importc: "d3.axisTop".}
proc axisRight*(scale: D3ContinuousScale): D3Axis {.importc: "d3.axisRight".}
proc axisBottom*(scale: D3ContinuousScale): D3Axis {.importc: "d3.axisBottom".}
proc axisLeft*(scale: D3ContinuousScale): D3Axis {.importc: "d3.axisLeft".}
