

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

HSD.test(y = lm_model,trt = 'env',main = 'Mean Separation for Env',console = TRUE)

# LSD
LSD.test(y = lm_model,trt = 'env',main = 'Mean Separation for Env',console = TRUE)

## Duncan
duncan.test(y = lm_model,trt = 'env',main = 'Mean Separation for Env',console = TRUE)

## Interaction

HSD.test(y = lm_model,trt = c('gen','env'),
main = 'Interaction between Gen and Env',console = TRUE)

head(mtcars)
View(mtcars)


# Correlation -------------------------------------------------------------

library(correlation)
library(metan)
