## See
##
## * https://github.com/d3/d3-time-format
##

import sequtils

import ./types

proc timeFormat*(specifier: cstring): D3TimeFormat {.importc: "d3.timeFormat".} ## \
  ## Create a time format

proc timeParse*(specifier: cstring): D3TimeFormat {.importc: "d3.timeParse".} ## \
  ## Create a time parsing format

proc utcFormat*(specifier: cstring): D3TimeFormat {.importc: "d3.utcFormat".}
proc utcParse*(specifier: cstring): D3TimeFormat {.importc: "d3.utcParse".}

proc isoFormat*(): D3TimeFormat {.importc: "function(){ return d3.isoFormat }."}
proc isoParse*(): D3TimeFormat {.importc: "function(){ return d3.isoParse }".}

proc execFormat*(formatter: D3Format, date: Date): cstring {.importcpp: "function(formatter, date){ return formatter(date) }".}
proc execParse*(parser: D3Format, s: cstring): Date {.importcpp: "function(parser, s){ return parser(s) }".}

proc newDate*(): Date {.importc: "function(){ return new Date() }."} ## \
  ## Create a new Date object set to the current date and time.
  ##
  ## .. code::javascript
  ##    // equivalent in javascript
  ##    new Date();  // 2019-08-02T22:37:54+00:00

proc newDate*(msUnixTimestamp: int): Date {.importc: "function(msUnixTimestamp){ return new Date(msUnixTimestamp) }."} ## \
  ## Create a new Date object set to the number of milliseconds since
  ## Jan 1, 1970 00:00:00 UTC.
  ##
  ## .. code::javascript
  ##    // equivalent in javascript
  ##    new Date(1564785474);  // 2019-08-02T22:37:54+00:00

proc newDate*(dateString: cstring): Date {.importc: "function(dateString){ return new Date(dateString) }."} ## \
  ## Create a new Date object
  ##
  ## .. code::javascript
  ##    // equivalents in javascript
  ##    new Date('December 17, 1995 03:24:00');
  ##    new Date('1995-12-17T03:24:00');

proc newDate*(year: int, monthIndex: int, day: int = 1, hours: int = 0,
              minutes: int = 0, seconds: int = 0, milliseconds: int = 0): Date {.importc: "function(dateString){ return new Date(dateString) }."} ## \
  ## Create a new Date object specifying each part of the date and time
  ##
  ## .. code::javascript
  ##    // equivalents in javascript
  ##    new Date(2019, 0);  // Jan 1, 2019 00:00:00
  ##    new Date(2019, 11, 31, 23, 59, 50) // Dec 31, 2019 23:59:50
