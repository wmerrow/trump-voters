# k means to identify clusters

# define vars of interest for clustering
vars <- c("case_identifier",
          "change_16_17",
          "change_17_18",
          #"age",
          #"gender_baseline",
          #"race_white",
          #"educ_baseline",
          "econ_ineq",
          "econ_govt",
          "econ_ssmc",
          "econ_trad",
          "immi",
          "muslim",
          "black",
          "moral",
          "gender_roles",
          "sys",
          "losing_ground",
          "pride"
          )

# create dataframes for Trump voters (R) and Clinton voters (D) with just variables of interest
vote_km_R <- na.omit(vote %>% filter(vote_2016 == "Trump")
                     %>% select(vars))
vote_km_D <- na.omit(vote %>% filter(vote_2016 == "Clinton")
                     %>% select(vars))
# na.omit drops around 100 NAs for Rs and 150 for Ds

# determine number of clusters for Rs and for Ds

wss_tot <- 0
for (i in 1:15) {
  set.seed(1234)
  km_out <- kmeans(vote_km_R[,-1:-3], centers = i, iter.max = 20, nstart = 10)
  # Save total within sum of squares to wss variable
  wss_tot[i] <- km_out$tot.withinss/km_out$totss
}

plot(1:15, wss_tot, type = "b",
     xlab = "Number of Clusters",
     ylab = "WSS/TSS")
# R elbow is at 4

wss_tot <- 0
for (i in 1:15) {
  set.seed(1234)
  km_out <- kmeans(vote_km_D[,-1:-3], centers = i, iter.max = 20, nstart = 10)
  # Save total within sum of squares to wss variable
  wss_tot[i] <- km_out$tot.withinss/km_out$totss
}

plot(1:15, wss_tot, type = "b",
     xlab = "Number of Clusters",
     ylab = "WSS/TSS")
# D elbow is at 4


# k means
set.seed(1234)
R_clusters <- kmeans(vote_km_R[,-1:-3], centers=4, nstart=10)
R_clusters
set.seed(1234)
D_clusters <- kmeans(vote_km_D[,-1:-3], centers=4, nstart=10)
D_clusters

# add clusters to data (so that we can see how present each cluster is in our fav change categories)
vote_km_R$cluster <- as.factor(R_clusters$cluster)
vote_km_D$cluster <- as.factor(D_clusters$cluster)
# note: don't need to worry about handling NAs since vote_km_R and vote_km_D already had NAs removed

# change to long format for ggplot

vote_km_R_long <- melt(vote_km_R, id.vars = c("case_identifier", "change_16_17", "change_17_18", "cluster"))
colnames(vote_km_R_long) <- gsub("variable", "issue", colnames(vote_km_R_long))
colnames(vote_km_R_long) <- gsub("value", "ideology_score", colnames(vote_km_R_long))
str(vote_km_R_long)

vote_km_D_long <- melt(vote_km_D, id.vars = c("case_identifier", "change_16_17", "change_17_18", "cluster"))
colnames(vote_km_D_long) <- gsub("variable", "issue", colnames(vote_km_D_long))
colnames(vote_km_D_long) <- gsub("value", "ideology_score", colnames(vote_km_D_long))
str(vote_km_D_long)


# plot all Trump voters
ggplot(vote_km_R_long, aes(x = ideology_score, y = 0, fill = "red")) +
  geom_density_ridges() +
  xlim(-1.4,1.4) +
  ylim(0,7) +
  scale_x_continuous(breaks = seq(-2, 2, by = 1)) +
  theme_ridges() + 
  facet_wrap(.~issue) +
  theme(legend.position = "none") +
  theme_tufte()
ggsave("plots/ideology-all.pdf", width = 6, height = 4)

# plot Trump groups (number)
ggplot(vote_km_R, aes(x = cluster, fill = "red")) +
  geom_bar(show.legend = FALSE) +
  ylim(0,600) +
  #scale_fill_brewer(palette="Reds") +
  theme_tufte()
ggsave("plots/bar.pdf", width = 4, height = 4)

# plot Trump groups (ideology)
ggplot(vote_km_R_long, aes(x = ideology_score, y = cluster, fill = "red")) +
  geom_density_ridges() +
  theme_ridges() + 
  theme(legend.position = "none") +
#  scale_fill_brewer(palette="Reds") +
  facet_wrap(.~issue) +
  theme_tufte()
ggsave("plots/ideology-groups.pdf", width = 6, height = 4)


# plot Clinton groups (number)
ggplot(vote_km_D, aes(x = cluster, fill = "blue")) +
  geom_bar(show.legend = FALSE) +
  ylim(0,600) +
  #scale_fill_brewer(palette="Blues") +
  theme_tufte()
ggsave("plots/bar-Clinton.pdf", width = 4, height = 4)

# plot Clinton groups (ideology)
ggplot(vote_km_D_long, aes(x = ideology_score, y = cluster, fill = "blue")) +
  geom_density_ridges() +
  theme_ridges() + 
  theme(legend.position = "none") +
  #  scale_fill_brewer(palette="Blues") +
  facet_wrap(.~issue) +
  theme_tufte()
ggsave("plots/ideology-groups-Clinton.pdf", width = 6, height = 4)


