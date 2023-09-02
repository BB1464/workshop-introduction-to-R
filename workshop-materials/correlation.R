###########################################################################
###########################################################################
###                                                                     ###
###                      CORRELATION ANALYSIS IN R                      ###
###                                                                     ###
###########################################################################
###########################################################################

## Load Required Packages

library(correlation)
library(tidyverse)
library(metan)
library(ggcorrplot)



## Load the dataset

data(mtcars)


## Base R Function

cor(mtcars)  %>%
  knitr::kable()


## Make use of correlation function

Cor <- correlation(data = mtcars)

Cor

summary(object = Cor,redundant=T)



# calculate the correlations

cor <- cor(mtcars, use="complete.obs")

round(cor,2)


## Correlation

ggcorrplot::ggcorrplot(cor,
          hc.order = TRUE,
         type = "lower",
        lab = TRUE)



## Second Approach with metan

p=metan::corr_coef(data = mtcars,type = 'linear',method = 'pearson') %>%
  plot()

p
