rm(list = ls(all = TRUE))

library(dplyr)
library(class)
library(tidyverse)
library(rpart)
library(rpart.plot)
library(rattle)
library(RColorBrewer)
library(class)
library(factoextra)
library(ggplot2)
library(ggridges)
library(ggthemes)
library(reshape2)

voter_study_group <- read.csv(file = "VOTER_Survey_April18_Release1.csv", header = TRUE, stringsAsFactors = FALSE)
#str(voter_study_group)


vote <- voter_study_group

# filter to just voters who responded in all years and remove NAs for favorability questions
source("filter.R")
#str(vote)

# select variables of interest
source("select.R")
#str(vote)

# create variables for change in favorability
source("favorability.R")
#str(vote)

# recode variables so they are numeric and meaningful, and create composite indices
source("recode.R")
#str(vote)

# k means to identify clusters
source("cluster.R")

# analysis
source("analysis.R")
