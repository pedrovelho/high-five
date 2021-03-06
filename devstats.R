#!/usr/bin/env Rscript
##sudo apt-get install r-base
##sudo apt-get install pandoc pandoc-citeproc
##install.packages("highcharter")
##install.packages("htmlwidgets")
devs <- read.table('sample.data', header=TRUE)
devstats <- data.frame(devs)
devstats$total = devstats$minor + devstats$major + devstats$critical

library("highcharter")

## Summary
devstats = devstats[order(devstats$total),]
devstatsSummary <- highchart() %>% 
    hc_chart(type = "column") %>% 
    hc_title(text = "SUMMARY of issues per developer") %>%
    hc_xAxis(categories = devstats$name) %>% 
    hc_yAxis(title = list(text = "Issues")) %>% 
    hc_plotOptions(column = list(
                       stacking = "normal")) %>%
    hc_series(list(name="minor",data=devstats$minor),
              list(name="major",data=devstats$major),
              list(name="critical",data=devstats$critical))
htmlwidgets::saveWidget(widget = devstatsSummary, file = "./summary.html")


## Critical
##90ed7d
devstats = devstats[order(devstats$critical),]
devstatsCritical <- highchart() %>% 
    hc_chart(type = "column") %>% 
    hc_title(text = "CRITICAL") %>%
    hc_xAxis(categories = devstats$name) %>% 
    hc_yAxis(title = list(text = "Issues")) %>%
    hc_plotOptions(column = list(
                       stacking = "normal")) %>% 
    hc_series(list(name="minor",data=0),
              list(name="major",data=0),
              list(name="critical",data=devstats$critical))
htmlwidgets::saveWidget(widget = devstatsCritical, file = "./critical.html")


## Major
##434348
devstats = devstats[order(devstats$major),]
devstatsMajor <- highchart() %>% 
    hc_chart(type = "column") %>% 
    hc_title(text = "MAJOR") %>%
    hc_xAxis(categories = devstats$name) %>% 
    hc_yAxis(title = list(text = "Issues")) %>%
    hc_plotOptions(column = list(
                       stacking = "normal")) %>% 
    hc_series(list(name="minor",data=0),              
              list(name="major",data=devstats$major),
              list(name="critical",data=0))
htmlwidgets::saveWidget(widget = devstatsMajor, file = "./major.html")

## Minor
##7cb5ec
devstats = devstats[order(devstats$minor),]
devstatsMinor <- highchart() %>% 
    hc_chart(type = "column") %>% 
    hc_title(text = "MINOR") %>%
    hc_xAxis(categories = devstats$name) %>% 
    hc_yAxis(title = list(text = "Issues")) %>%
    hc_plotOptions(column = list(
                       stacking = "normal")) %>% 
    hc_series(list(name="minor",data=devstats$minor),              
              list(name="major",data=0),
              list(name="critical",data=0))
htmlwidgets::saveWidget(widget = devstatsMinor, file = "./minor.html")
