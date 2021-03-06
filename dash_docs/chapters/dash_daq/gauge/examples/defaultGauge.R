library(dash)
library(dashDaq)
library(dashHtmlComponents)
library(dashCoreComponents)

app <- Dash$new()

app$layout(htmlDiv(list(
  daqGauge(id = 'my-gauge',
           label = 'Default',
           value = 6),
  dccSlider(
    id = 'my-gauge-slider',
    min = 0,
    max = 10,
    step = 1,
    value = 5
  )
)))
  
app$callback(
  output(id = "my-gauge", property = "value"),
  params = list(input(id = "my-gauge-slider", property = "value")),
  
  update_output <- function(value) {
    return(value)
  }
)

app$run_server()
