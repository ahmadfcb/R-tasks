---
title: "Google Search Analytics"
author: "18F-0203 Muhammad Ahmad"
date: "6/3/22"
output: pdf_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## R Markdown

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:
#install.packages("gtrendsR")
```{r}

library(ggplot2)
library(scales)

library(gtrendsR)
```

## Including Plots

You can also embed plots, for example:

```{r}
data_set = gtrends(keyword = "Machine Learning")$interest_by_country
data_set = data_set[-c(3:5)]
data_set = na.omit(data_set)
head(data_set,10)
```
```{r}
data_setTemp= head(data_set,10)
ggplot(data_setTemp, aes(x=reorder(location,-hits), y=hits)) +
  geom_bar(stat="identity", fill="steelblue")+ labs(x = "geoName", y = "Machine learning", color = "Legend Title\n")+
theme(axis.text.x = element_text(angle = 90))


data_set = gtrends(keyword = "Machine Learning")$interest_over_time
data_set = data_set[-c(3:7)]
head(data_set,10)
tail(data_set,1)

```

```{r}
data_setTemp=data_set
ggplot(data_setTemp, aes(x=date, y=hits)) +
  geom_line(stat="identity",  color="steelblue")+ 
  labs(title="Total Google Searches for Machine Learning",  x = "Year",   y = "Total Count",  color = "Legend Title\n")+
  theme_minimal()
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
