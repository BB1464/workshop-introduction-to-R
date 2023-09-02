
# Introduction to ggplot2 -------------------------------------------------

library(tidyverse)


## Load the data

data(mtcars)

## Plotting for Scatter Plot

ggplot(data = mtcars,mapping = aes(x = mpg,y = disp))+
  geom_point(aes(col=factor(gear)))+
  labs(color='gear')

## Histogram

p <- ggplot(data = mtcars,aes(x = mpg))+
  geom_histogram(aes(fill=factor(gear)))+
  labs(fill='gear')
p


## Violin Plot

ggplot(data = mtcars,aes(x = factor(gear),y = mpg))+
  geom_violin(aes(fill=factor(gear)),show.legend = FALSE)+
  labs(fill='gear',x='gear')

## Bar Plot

ggplot(data = mtcars,aes(x=factor(gear)))+
  geom_bar()

## Box Plot

ggplot(data = mtcars,aes(x=factor(gear),y = mpg))+
  geom_boxplot(aes(fill=factor(gear)))

## Save the Plot

ggsave(filename = 'boxplot.png',
plot = last_plot(),
path = here::here('plot'),width = 7,
height = 7,dpi = 300)


