type
  D3Selection* {.importc.} = ref object

proc select*(tag: cstring): D3Selection {.importc: "d3.select".}
proc select*(parent: D3Selection, tag: cstring): D3Selection {.importcpp.}
proc selectAll*(tag: cstring): D3Selection {.importc: "d3.selectAll".}
proc selectAll*(parent: D3Selection, tag: cstring): D3Selection {.importcpp.}

proc style*(node: D3Selection, sName, sValue: cstring): D3Selection {.importcpp.}
proc append*(node: D3Selection, tag: cstring): D3Selection {.importcpp.}
proc attr*(node: D3Selection, name: cstring, val: cstring): D3Selection {.importcpp.}
proc attr*(node: D3Selection, name: cstring, val: int): D3Selection {.importcpp.}
proc attr*(node: D3Selection, name: cstring, val: float): D3Selection {.importcpp.}
