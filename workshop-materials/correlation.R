###########################################################################
###########################################################################
###                                                                     ###
###                      CORRELATION ANALYSIS IN R                      ###
###                                                                     ###
###########################################################################
###########################################################################

## Load Required Packages

library(correlation) # Correlation table
library(tidyverse) # Data Wrangling
library(metan) # Correlation Plot
library(ggcorrplot) # Correlation Plot



## Load the dataset

data(mtcars)


## Base R Function

round(cor(mtcars),2)  %>%
  knitr::kable()


## Make use of correlation function

Cor <- correlation::correlation(data = mtcars,redundant = TRUE)

Cor

summary(object = Cor,redundant=TRUE)



# calculate the correlations

cor <- cor(mtcars, use="complete.obs")

cor <- round(cor,2)

cor

## Correlation

ggcorrplot(corr = cor,
          hc.order = TRUE,
         type = "lower",
        lab = TRUE)



## Second Approach with metan

p=metan::corr_coef(data = mtcars,type = 'linear',method = 'pearson') %>%
  plot()

p


mtcars_selected <- mtcars %>%
  select(mpg,cyl)


dput(x = mtcars_selected)
