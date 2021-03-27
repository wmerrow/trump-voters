# filter to just voters who responded in all years (2016, 2017,2018)
vote <- vote[!is.na(vote$weight_panel),] # remove anyone who doesn't have a weight for 2018
vote <- vote[!is.na(vote$weight_2017),] # remove anyone who doesn't have a weight for 2017
vote <- vote[!is.na(vote$weight_2016),] # remove anyone who doesn't have a weight for 2016

# check for NAs for Trump favorability
sum(is.na(vote$fav_trump_2018))
sum(is.na(vote$fav_trump_2017))
sum(is.na(vote$fav_trump_2016))

# remove NAs for Trump favorability
vote <- vote[!is.na(vote$fav_trump_2018),]
vote <- vote[!is.na(vote$fav_trump_2017),]
vote <- vote[!is.na(vote$fav_trump_2016),]
