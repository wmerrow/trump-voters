
# create a new variable for simplified favorability (combining "very" and "somewhat" responses)
vote$fav_trump_2016_simple[vote$fav_trump_2016 %in% c(1, 2)] <- "fav"
vote$fav_trump_2016_simple[vote$fav_trump_2016 %in% c(3, 4)] <- "unfav"
vote$fav_trump_2016_simple[vote$fav_trump_2016 == 8] <- "dk"
vote$fav_trump_2017_simple[vote$fav_trump_2017 %in% c(1, 2)] <- "fav"
vote$fav_trump_2017_simple[vote$fav_trump_2017 %in% c(3, 4)] <- "unfav"
vote$fav_trump_2017_simple[vote$fav_trump_2017 == 8] <- "dk"
vote$fav_trump_2018_simple[vote$fav_trump_2018 %in% c(1, 2)] <- "fav"
vote$fav_trump_2018_simple[vote$fav_trump_2018 %in% c(3, 4)] <- "unfav"
vote$fav_trump_2018_simple[vote$fav_trump_2018 == 8] <- "dk"
#str(vote)

# create a new variable for change in favorability from 2016 to 2017
vote$change_16_17[vote$fav_trump_2016_simple == "fav" & vote$fav_trump_2017_simple %in% c("unfav", "dk")] <- "decrease"
vote$change_16_17[vote$fav_trump_2016_simple == "dk" & vote$fav_trump_2017_simple == "unfav"] <- "decrease"
vote$change_16_17[vote$fav_trump_2016_simple == "unfav" & vote$fav_trump_2017_simple %in% c("fav", "dk")] <- "increase"
vote$change_16_17[vote$fav_trump_2016_simple == "dk" & vote$fav_trump_2017_simple == "fav"] <- "increase"
vote$change_16_17[vote$fav_trump_2016_simple == "fav" & vote$fav_trump_2017_simple == "fav"] <- "remain fav"
vote$change_16_17[vote$fav_trump_2016_simple == "unfav" & vote$fav_trump_2017_simple == "unfav"] <- "remain unfav"
vote$change_16_17[vote$fav_trump_2016_simple == "dk" & vote$fav_trump_2017_simple == "dk"] <- "remain dk"
table(vote$change_16_17)

# and from 2017 to 2018
vote$change_17_18[vote$fav_trump_2017_simple == "fav" & vote$fav_trump_2018_simple %in% c("unfav", "dk")] <- "decrease"
vote$change_17_18[vote$fav_trump_2017_simple == "dk" & vote$fav_trump_2018_simple == "unfav"] <- "decrease"
vote$change_17_18[vote$fav_trump_2017_simple == "unfav" & vote$fav_trump_2018_simple %in% c("fav", "dk")] <- "increase"
vote$change_17_18[vote$fav_trump_2017_simple == "dk" & vote$fav_trump_2018_simple == "fav"] <- "increase"
vote$change_17_18[vote$fav_trump_2017_simple == "fav" & vote$fav_trump_2018_simple == "fav"] <- "remain fav"
vote$change_17_18[vote$fav_trump_2017_simple == "unfav" & vote$fav_trump_2018_simple == "unfav"] <- "remain unfav"
vote$change_17_18[vote$fav_trump_2017_simple == "dk" & vote$fav_trump_2018_simple == "dk"] <- "remain dk"
table(vote$change_17_18)
