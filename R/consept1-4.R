library(ggplot2)
library("ganttrify")
library(readxl)

#https://pythonawesome.com/create-beautiful-gantt-charts-with-ggplot2/?ref=morioh.com&utm_source=morioh.com


dummyData <- read_excel("data/dat.xlsx")

labs <- c("Konsept 4",
          "Konsept 3",
          "Konsept 2",
          "Konsept 1")

brk <- seq(from=as.Date("2021-01-15"),
           to=as.Date("2021-04-15"),
           by="month")
length(brk)
length(labs)

gantt <- ganttrify(project = dummyData,
          project_start_date = "2021-01",
          size_text_relative = 3, 
          month_number = FALSE,
          font_family = "Roboto Condensed",
          x_axis_position = "bottom",
          hide_wp = TRUE
          )+
  coord_flip()+
  scale_y_discrete(position = "right",
                   expand = expansion(mult=c(.1,.2))) +
  ylab("")+
  xlab("")+
  theme(
    axis.title = element_text(size=30),
    plot.margin = margin(0.5, 0.8, .5, 0.5, "cm")
    )+
  scale_x_date(breaks = brk,
               labels = labs)+
  
  geom_segment(aes(x = as.Date("2021-01-15"), 
                   y = .5, xend = as.Date("2021-01-15"), yend = 6),
               lineend = 'round', linejoin = 'round',
               arrow = arrow(length = unit(0.5, "cm")),
               size=3,
               colour="chartreuse3")+
  geom_segment(aes(x = as.Date("2021-02-15"), 
                   y = .5, xend = as.Date("2021-02-15"), yend = 6),
               lineend = 'round', linejoin = 'round',
               arrow = arrow(length = unit(0.5, "cm")),
               size=3,
               colour="chartreuse3")+
  geom_segment(aes(x = as.Date("2021-03-15"), 
                   y = .5, xend = as.Date("2021-03-15"), yend = 6),
               lineend = 'round', linejoin = 'round',
               arrow = arrow(length = unit(0.5, "cm")),
               size=3,
               colour="chartreuse3")
     

gantt

tiff(width = 560, height = 480, units = "px", pointsize = 12,
     compression = "lzw", "output/4konsepter.tif")     
gantt
dev.off()

