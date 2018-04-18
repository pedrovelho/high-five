#!/usr/bin/env Rscript
##install.packages("highcharter")
##install.packages("htmlwidgets")
devs <- read.table('sample.data', header=TRUE)
devstats <- data.frame(devs)
devstats$total = devstats$minor + devstats$major + devstats$critical

## sort by most issues
rownames(devstats) = devstats$name

library("highcharter")


## Summary
devstats = devstats[order(devstats$total),]
devstatsSummary <- highchart() %>% 
    hc_chart(type = "column") %>% 
    hc_title(text = "SUMMARY of issues per developer") %>%
    hc_xAxis(categories = devstats$name) %>% 
    hc_yAxis(title = list(text = "Issues")) %>% 
    hc_plotOptions(column = list(
                       stacking = "normal",
                       enableMouseTracking = FALSE)
                   ) %>%
    hc_series(list(name="minor",data=devstats$minor),
              list(name="major",data=devstats$major),
              list(name="critical",data=devstats$critical))
## Export the html    
htmlwidgets::saveWidget(widget = devstatsSummary, file = "./output/summary.html")


## Critical
##90ed7d
devstats = devstats[order(devstats$critical),]
devstatsCritical <- highchart() %>% 
    hc_chart(type = "column") %>% 
    hc_title(text = "CRITICAL issues per developer") %>%
    hc_xAxis(categories = devstats$name) %>% 
    hc_yAxis(title = list(text = "Issues")) %>%
    hc_colors(
    hc_plotOptions(column = list(
                       stacking = "normal",
                       enableMouseTracking = FALSE)
                   ) %>% 
    hc_colors("#90ed7d") %>%
    hc_series(list(name="critical",data=devstats$critical)) 
## Export the html    
htmlwidgets::saveWidget(widget = devstatsCritical, file = "./output/critical.html")


## Major
##434348

## Minor
#7cb5ec
