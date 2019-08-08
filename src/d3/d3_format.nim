## See
##
## * https://github.com/d3/d3-format
##

import sequtils

import ./types

proc format*(specifier: cstring): D3Format {.importc: "d3.format".} ## \
  ## Create a format
  ##
  ## .. code::javascript
  ##    // in javascript
  ##    d3.format(",.0f")
  ##    d3.format("s")(1500);   // "1.50000k"
  ##    d3.format("~s")(1500);  // "1.5k"
  ##
  ## .. code::nim
  ##    // in nim
  ##    d3.format("~s").exec(1500)  # "1.5k"

proc formatPrefix*(specifier: cstring, value: int | float): D3Format {.importc: "d3.formatPrefix".}

proc exec*(format: D3Format, value: int | float): cstring {.importcpp: "function(f, v){ return f(v) }"} ## \
  ## Run the format on the value
