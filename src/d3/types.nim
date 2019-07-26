type
  D3Event* = ref object

  D3Selection* = ref object

  D3ContinuousScale* = ref object ## \
    ## Continuous scales include linear, power, log, identity, time
  D3OrdinalScale* = ref object ## \
    ## Ordinal scales include band, point
  D3BandScale* = ref object ## \
    ## Similar to ordinal scale except output range is continuous and numeric

  D3Axis* = ref object ## \
    ## Representing a coordinate axis
