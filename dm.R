getwd()
setwd('D:dmtable')

install.packages("readxl")
install.packages("dplyr")
install.packages("table1")
library(readxl)
library(dplyr)
library(table1)
demo1<-read_xls("dm.xls")    
demo1
str(demo1)
demo2<- demo1%>%mutate(age_num=as.numeric(age))

table1(~Gender + Race + age_num + Height + Weight |Trtgrp ,data=demo2, caption = 'demographic')



demo2 %>%
  rtf_title("Demographic and Anthropometric Characteristics",
            "ITT Subjects") %>%
  rtf_colheader(" | QW1| QW@ | Overall",
                col_rel_width = c(3, rep(2,4)),
                first_row = TRUE) %>%
  rtf_colheader(" | n | (%) | n | (%) | n | (%) | n |(%)",
                border_top = c("", rep("single", 8)),
                border_left = c("single", rep(c("single",""), 4))) %>%
  rtf_body(page_by = "var_label",
           col_rel_width = c(3, rep(c(1.2, 0.8), 4)) ,
           text_justification = c("l", rep("d",8)),
           border_left = c("single", rep(c("single",""), 4) )) %>%
  rtf_footnote("This is a footnote", justification = "l") %>%
  rtf_source("Source: xxx", justification = "l") %>%
  rtf_encode() %>%
  write_rtf("demo2.rtf");

