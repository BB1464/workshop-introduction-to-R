

library(tidyverse)
library(factoextra)
library(gridExtra)
library(metan)

## Load the data
data("data_ge2")

## View the summary of the data

summary(data_ge2)

skimr::skim(data_ge2)


data_ge2 <-
  data_ge2 %>%
  select(-c(ENV,REP)) %>%
  group_by(GEN) %>%
  summarise_all(.funs = mean) %>%
  column_to_rownames(var = 'GEN')

dat_pca <- prcomp(data_ge2, scale. = TRUE)


print(dat_pca)

summary(dat_pca)


## Get the Eigen Values

eig.val<-get_eigenvalue(dat_pca)

eig.val

## Screeplot

#fviz_eig(mtcars_pca, col.var="blue",addlabels = TRUE)

fviz_screeplot(dat_pca, col.var="blue",addlabels = TRUE)

## PCA Result Variables

var <- get_pca_var(dat_pca)

var


## PCA Result Individuals

var <- get_pca_ind(dat_pca)

var



## Visualize the contribution of the variable

a <- fviz_contrib(X = dat_pca,choice = 'var',axes = 1) # First

b <- fviz_contrib(X = dat_pca,choice = 'var',axes = 2) # Second


fviz_contrib(X =dat_pca,choice = 'var',axes = 1:2)


grid.arrange(a,b, ncol=2, top='Contribution of the variables to the first two PCs')

## Biplot

fviz_pca_biplot(X = dat_pca)

fviz_pca_var(X = dat_pca) # Variables

fviz_pca_ind(X = dat_pca) ## Individual


