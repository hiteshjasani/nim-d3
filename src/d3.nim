import d3 / [selections, scaling, transforms]

export selections, scaling, transforms

type
  D3Event* = ref object

proc d3Event*(): D3Event {.importc: "function(){return d3.event}".}
proc pageX*(ev: D3Event): float {.importcpp: "#.pageX".}
proc pageY*(ev: D3Event): float {.importcpp: "#.pageY".}
