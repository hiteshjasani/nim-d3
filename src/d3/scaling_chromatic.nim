#-------------------------------------------------------------------------
# Color Schemes
#
# https://github.com/d3/d3-scale-chromatic


# Categorical
# https://github.com/d3/d3-scale-chromatic#categorical

proc schemeCategory10*(): cstring {.importc: "function(){ return d3.schemeCategory10 }".}
proc schemeAccent*(): cstring {.importc: "function(){ return d3.schemeAccent }".}
proc schemeDark2*(): cstring {.importc: "function(){ return d3.schemeDark2 }".}
proc schemePaired*(): cstring {.importc: "function(){ return d3.schemePaired }".}
proc schemePastel1*(): cstring {.importc: "function(){ return d3.schemePastel1 }".}
proc schemePastel2*(): cstring {.importc: "function(){ return d3.schemePastel2 }".}
proc schemeSet1*(): cstring {.importc: "function(){ return d3.schemeSet1 }".}
proc schemeSet2*(): cstring {.importc: "function(){ return d3.schemeSet2 }".}
proc schemeSet3*(): cstring {.importc: "function(){ return d3.schemeSet3 }".}

# Diverging
# https://github.com/d3/d3-scale-chromatic#diverging
# k ranges between 3 to 11

proc schemeBrBG*(k: int): cstring {.importc: "function(k){ return d3.schemeBrBG[k] }".}
proc schemePRGn*(k: int): cstring {.importc: "function(k){ return d3.schemePRGn[k] }".}
proc schemePiYG*(k: int): cstring {.importc: "function(k){ return d3.schemePiYG[k] }".}
proc schemePuOr*(k: int): cstring {.importc: "function(k){ return d3.schemePuOr[k] }".}
proc schemeRdBu*(k: int): cstring {.importc: "function(k){ return d3.schemeRdBu[k] }".}
proc schemeRdGy*(k: int): cstring {.importc: "function(k){ return d3.schemeRdGy[k] }".}
proc schemeRdYlBu*(k: int): cstring {.importc: "function(k){ return d3.schemeRdYlBu[k] }".}
proc schemeRdYlGn*(k: int): cstring {.importc: "function(k){ return d3.schemeRdYlGn[k] }".}
proc schemeSpectral*(k: int): cstring {.importc: "function(k){ return d3.schemeSpectral[k] }".}

# Sequential (Single Hue)
# https://github.com/d3/d3-scale-chromatic#sequential-single-hue
# k - sequential color scheme of size 3 to 9

proc schemeBlues*(k: int): cstring {.importc: "function(k){ return d3.schemeBlues[k] }".}
proc schemeGreens*(k: int): cstring {.importc: "function(k){ return d3.schemeGreens[k] }".}
proc schemeGrey*(k: int): cstring {.importc: "function(k){ return d3.schemeGreys[k] }".}
proc schemeOranges*(k: int): cstring {.importc: "function(k){ return d3.schemeOranges[k] }".}
proc schemePurples*(k: int): cstring {.importc: "function(k){ return d3.schemePurples[k] }".}
proc schemeReds*(k: int): cstring {.importc: "function(k){ return d3.schemeReds[k] }".}

# Sequential (Multi-Hue)
# https://github.com/d3/d3-scale-chromatic#sequential-multi-hue
# k - sequential color scheme in range of 3 to 9

proc schemeBuGn*(k: int): cstring {.importc: "function(k){ return d3.schemeBuGn[k] }".}
proc schemeBuPu*(k: int): cstring {.importc: "function(k){ return d3.schemeBuPu[k] }".}
proc schemeGnBu*(k: int): cstring {.importc: "function(k){ return d3.schemeGnBu[k] }".}
proc schemeOrRd*(k: int): cstring {.importc: "function(k){ return d3.schemeOrRd[k] }".}
proc schemePuBuGn*(k: int): cstring {.importc: "function(k){ return d3.schemePuBuGn[k] }".}
proc schemePuBu*(k: int): cstring {.importc: "function(k){ return d3.schemePuBu[k] }".}
proc schemePuRd*(k: int): cstring {.importc: "function(k){ return d3.schemePuRd[k] }".}
proc schemeRdPu*(k: int): cstring {.importc: "function(k){ return d3.schemeRdPu[k] }".}
proc schemeYlGnBu*(k: int): cstring {.importc: "function(k){ return d3.schemeYlGnBu[k] }".}
proc schemeYlGn*(k: int): cstring {.importc: "function(k){ return d3.schemeYlGn[k] }".}
proc schemeYlOrBr*(k: int): cstring {.importc: "function(k){ return d3.schemeYlOrBr[k] }".}
proc schemeYlOrRd*(k: int): cstring {.importc: "function(k){ return d3.schemeYlOrRd[k] }".}
