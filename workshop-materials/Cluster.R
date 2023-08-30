##################
##Load Libraries #
##################

library(tidyverse)
library(agridat)
library(factoextra)




#############################
##    Cluster Analysis      #
#############################

data(steptoe.morex.pheno)
dat <- steptoe.morex.pheno
dat <- as_tibble(dat)
dat

summary(dat)

levels(dat$env)

#Let's consider only one env - "ID91"
dat.ID91 <- dat %>%
  filter(env=="ID91") %>%
  droplevels()

#lodging is missing for ALL genotype
summary(dat.ID91)

#Drop/Remove lodging
dat.ID91 <- dat.ID91 %>%
  select(-lodging)

names(dat.ID91)

#Good practice
dat.ID91 <- na.omit(dat.ID91)

#Keep the names of the genotypes
dat.ID91.label <- dat.ID91$gen

#Remove/Delete gen & env column
#dat.ID91$gen <- NULL
dat.ID91$env <- NULL

dat.ID91


dat.ID91 <- dat.ID91 %>%
  group_by(gen) %>%
  summarise_all(.funs = ~.) %>%
  column_to_rownames(var = 'gen')



#Standardize the data
dat.ID91.sc <- scale(dat.ID91)
summary(dat.ID91.sc)
#Distance metric
dist.ID91 <- dist(dat.ID91.sc, method = 'euclidean')

#Hierarchical Classification
hclust.ID91 <- hclust(dist.ID91, method = 'ward.D2')

#Visualize the dendrogram
plot(hclust.ID91)

#Add genotype labels
plot(hclust.ID91, hang = -1)# , labels = dat.ID91.label

#Add boarder
rect.hclust(hclust.ID91, k = 3, border = "red")


#Visualize the clusters with colours
#library(dendextend)

fviz_dend(x = hclust.ID91,k = 3,k_colors = 'aaas')

























#dend.ID91 <- as.dendrogram(hclust.ID91)
#col.dend.ID91 <- color_branches(dend.ID91, k = 3)

#Visualize the clusters
#plot(col.dend.ID91)

#Add genotype labels
# labels(col.dend.ID91) <- dat.ID91.label
# plot(col.dend.ID91)
#
# #Get cluster membership
# cut.ID91 <- cutree(hclust.ID91, k = 3)
#
#
# #Add cluster membership to the original data
# dat.ID91 <- dat.ID91 %>%
#   mutate(cluster = cut.ID91)
#
# dat.ID91
#
# #Aggregate the data by cluster membership
# dat.ID91.summary <- dat.ID91 %>%
#   group_by(cluster) %>%
#   summarize(
#     m_amylase=mean(amylase, na.rm=TRUE),
#     m_diapow=mean(diapow, na.rm=TRUE),
#     m_hddate=mean(hddate, na.rm=TRUE),
#     m_malt=mean(malt, na.rm=TRUE),
#     m_height=mean(height, na.rm=TRUE),
#     m_protein=mean(protein, na.rm=TRUE),
#     m_yield=mean(yield, na.rm=TRUE),
#     N_Obs=n()
#   )
#
# dat.ID91.summary
#
