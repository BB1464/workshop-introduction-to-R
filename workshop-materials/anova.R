

# Analysis of Variance ----------------------------------------------------

library(tidyverse)
library(agridat)

## Load the data
data("omer.sorghum")

## Linear Model

lm_model <- lm(formula = yield~rep+env+gen+env:gen,data = omer.sorghum)

## Summary
summary(object = lm_model)

## Anova

anova(object = lm_model)

## CV

cv.model(x = lm_model)

## Post Hoc Test

