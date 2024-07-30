install.packages("tidytuesdayR")
install.packages("tidyverse")
install.packages("readxl")
install.packages("tidyr")
install.packages("readr")
install.packages("esquisse")
esquisse::esquisser(viewer = "browser")

tuesdata <- tidytuesdayR::tt_load('2021-02-09')
lifetime_earn <- tuesdata$lifetime_earn

