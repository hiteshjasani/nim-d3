import jsbind

type
  D3Selection* {.importc.} = ref object of JSObj
  D3ContinuousScale* = ref object of JSObj

proc select*(tag: cstring): D3Selection {.importc: "d3.select".}
proc select*(parent: D3Selection, tag: cstring): D3Selection {.importcpp.}
proc selectAll*(tag: cstring): D3Selection {.importc: "d3.selectAll".}
proc selectAll*(parent: D3Selection, tag: cstring): D3Selection {.importcpp.}

proc style*(node: D3Selection, sName, sValue: cstring): D3Selection {.importcpp.}
proc append*(node: D3Selection, tag: cstring): D3Selection {.importcpp.}
proc attr*(node: D3Selection, name: cstring, val: cstring): D3Selection {.importcpp.}
proc attr*(node: D3Selection, name: cstring, val: int): D3Selection {.importcpp.}
proc attr*(node: D3Selection, name: cstring, val: float): D3Selection {.importcpp.}
proc text*(node: D3Selection): cstring {.importcpp.}
proc text*(node: D3Selection, val: cstring): D3Selection {.importcpp.}
proc text*(node: D3Selection, fn: proc(x: int): cstring): D3Selection {.importcpp.}


proc scaleLinear*(): D3ContinuousScale {.jsimportgWithName: "d3.scaleLinear".}
proc exec*(scale: D3ContinuousScale, v: int): int {.jsimportgWithName: "function(scale, v) {return scale(v)}"}
proc continuousDomain*(scale: D3ContinuousScale; minVal, maxVal: int): D3ContinuousScale {.jsimportgWithName: "function(scale, minVal, maxVal){ return scale.domain([minVal, maxVal])}".}
proc continuousRange*(scale: D3ContinuousScale; minVal, maxVal: int): D3ContinuousScale {.jsimportgWithName: "function(scale, minVal, maxVal){return scale.range([minVal, maxVal])}".}
