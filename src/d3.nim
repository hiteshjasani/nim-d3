import jsbind, sequtils

type
  D3Selection* {.importc.} = ref object of JSObj
  D3ContinuousScale* = ref object of JSObj

proc select*(tag: cstring): D3Selection {.importc: "d3.select".}
proc select*(parent: D3Selection, tag: cstring): D3Selection {.importcpp.}
proc selectAll*(tag: cstring): D3Selection {.importc: "d3.selectAll".}
proc selectAll*(parent: D3Selection, tag: cstring): D3Selection {.importcpp.}

proc data*[T](sel: D3Selection, vals: seq[T]): D3Selection {.importcpp.}
proc style*(sel: D3Selection, sName, sValue: cstring): D3Selection {.importcpp.}

proc enter*(sel: D3Selection): D3Selection {.importcpp.}
proc exit*(sel: D3Selection): D3Selection {.importcpp.}
proc append*(sel: D3Selection, tag: cstring): D3Selection {.importcpp.}
proc remove*(sel: D3Selection): D3Selection {.importcpp.}

proc attr*(sel: D3Selection, name: cstring, val: cstring): D3Selection {.importcpp.}
proc attr*(sel: D3Selection, name: cstring, val: int): D3Selection {.importcpp.}
proc attr*(sel: D3Selection, name: cstring, val: float): D3Selection {.importcpp.}
proc attr*[T, U](sel: D3Selection, name: cstring, fn: proc(d: T): U): D3Selection {.importcpp.}

proc text*(sel: D3Selection): cstring {.importcpp.}
proc text*(sel: D3Selection, val: cstring): D3Selection {.importcpp.}
proc text*(sel: D3Selection, fn: proc(x: int): cstring): D3Selection {.importcpp.}


proc scaleLinear*(): D3ContinuousScale {.jsimportgWithName: "d3.scaleLinear".}
proc exec*(scale: D3ContinuousScale, v: int): int {.jsimportgWithName: "function(scale, v) {return scale(v)}"}
proc exec*(scale: D3ContinuousScale, v: float): float {.jsimportgWithName: "function(scale, v) {return scale(v)}"}
proc continuousDomain*(scale: D3ContinuousScale; minVal, maxVal: int): D3ContinuousScale {.jsimportgWithName: "function(scale, minVal, maxVal){ return scale.domain([minVal, maxVal])}".}
proc continuousDomain*(scale: D3ContinuousScale; extents: seq[int]): D3ContinuousScale {.jsimportgWithName: "function(scale, extents){ return scale.domain(extents)}".}
proc continuousRange*(scale: D3ContinuousScale; minVal, maxVal: int): D3ContinuousScale {.jsimportgWithName: "function(scale, minVal, maxVal){return scale.range([minVal, maxVal])}".}
proc continuousRange*(scale: D3ContinuousScale; extents: seq[int]): D3ContinuousScale {.jsimportgWithName: "function(scale, extents){return scale.range(extents)}".}
proc continuousRange*(scale: D3ContinuousScale; minVal, maxVal: cstring): D3ContinuousScale {.jsimportgWithName: "function(scale, minVal, maxVal){return scale.range([minVal, maxVal])}".}
proc continuousRange*(scale: D3ContinuousScale; extents: seq[cstring]): D3ContinuousScale {.jsimportgWithName: "function(scale, extents){return scale.range(extents)}".}
proc continuousRange*(scale: D3ContinuousScale;
                      extents: seq[string]): D3ContinuousScale =
  continuousRange(scale, map(extents, proc(x: string): cstring =
                                          cstring(x)))
