import jsbind

type
  D3Selection* {.importc.} = ref object of JSObj

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
