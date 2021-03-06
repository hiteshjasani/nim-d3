## D3js Foreign Function Interace (FFI)
##
## .. code::nim
##    import d3
##
##    d3.select("body").selectAll ....
##
##    select("body").selectAll ....
##
## The `d3` prefix is optional and really just represents the module
## name in Nim.

import d3 / [types, transforms, d3_axis, d3_format, d3_scale,
             d3_scale_chromatic, d3_selection, d3_time_format]

export types, transforms, d3_axis, d3_format, d3_scale, d3_scale_chromatic,
       d3_selection, d3_time_format
