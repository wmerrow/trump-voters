# how many Trump voters changed their minds about Trump fav?
table(vote_km_R$change_16_17)
table(vote_km_R$change_17_18)

# how many Clinton voters changed their minds about Trump fav?
table(vote_km_D$change_16_17)
table(vote_km_D$change_17_18)

# number in each cluster
table(vote_km_R$cluster)

# how many voters in each cluster changed their minds about Trump fav?
table(vote_km_R$cluster, vote_km_R$change_16_17)
write.csv(table(vote_km_R$cluster, vote_km_R$change_16_17), file = "cluster-change-16-17.csv")
table(vote_km_R$cluster, vote_km_R$change_17_18)
write.csv(table(vote_km_R$cluster, vote_km_R$change_17_18), file = "cluster-change-17-18.csv")

# charts

# Trump voters - colored by change 16-17
ggplot(vote_km_R, 
       aes(x = cluster, fill = change_16_17)) +
       geom_bar() +
       ylim(0,600) +
       #scale_color_brewer(palette="Reds") +
       theme_tufte()
ggsave("plots/bar-change-1617.pdf", width = 5, height = 4)

# Trump voters - colored by change 17-18
ggplot(vote_km_R, 
       aes(x = cluster, fill = change_17_18)) +
       geom_bar() +
       ylim(0,600) +
       #scale_color_brewer(palette="Reds") +
       theme_tufte()
ggsave("plots/bar-change-1718.pdf", width = 5, height = 4)
