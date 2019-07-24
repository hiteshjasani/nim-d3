import jsbind
import d3 / [selections, scaling, transforms]

export selections, scaling, transforms

type
  D3Event* = ref object of JSObj

proc d3Event*(): D3Event {.jsimportgWithName: "function(){return d3.event}"}
proc pageX*(ev: D3Event): float {.jsimportProp.}
proc pageY*(ev: D3Event): float {.jsimportProp.}
