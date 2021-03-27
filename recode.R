
# 2016 vote
vote$vote_2016[vote$presvote16post_2016 == 1] <- "Clinton"
vote$vote_2016[vote$presvote16post_2016 == 2] <- "Trump"

# change demographic variables to numeric
vote$race_white[vote$race_baseline %in% c(2:8)] <- 0 # non-white
vote$race_white[vote$race_baseline == 1] <- 1 # white
vote$age <- 2016 - vote$birthyr_baseline  # create age for easier interpretation
##vote$faminc_2016_simple[vote$faminc_2016 == 97] <- NA


# create ideological variables recoded to numeric political axis (-1 = left, 1 = right)
# and create composite indices

# econ_ineq

vote$econ_ineq_system_bias[vote$RIGGED_SYSTEM_3_2016 == 1] <- -1  # strongly agree
vote$econ_ineq_system_bias[vote$RIGGED_SYSTEM_3_2016 == 2] <- -.5  # agree
vote$econ_ineq_system_bias[vote$RIGGED_SYSTEM_3_2016 == 3] <- .5  # disagree
vote$econ_ineq_system_bias[vote$RIGGED_SYSTEM_3_2016 == 4] <- 1  # strongly disagree

vote$econ_ineq_tax_wealthy[vote$taxdoug_2016 == 1] <- -1  # yes
vote$econ_ineq_tax_wealthy[vote$taxdoug_2016 == 2] <- 1  # no
vote$econ_ineq_tax_wealthy[vote$taxdoug_2016 == 3] <- NA  # don't know

vote$econ_ineq_dist_fair[vote$wealth_2016 == 1] <- 1 # fair
vote$econ_ineq_dist_fair[vote$wealth_2016 == 2] <- -1 # not fair
vote$econ_ineq_dist_fair[vote$wealth_2016 == 8] <- NA # don't know

vote$econ_ineq <- rowMeans(vote[c("econ_ineq_system_bias",
                                  "econ_ineq_tax_wealthy",
                                  "econ_ineq_dist_fair"
)],
na.rm = TRUE)
#hist(vote$econ_ineq)

# econ_govt

vote$econ_govt_role[vote$gvmt_involment_2016 == 1] <- -1  # strong govt
vote$econ_govt_role[vote$gvmt_involment_2016 == 2] <- 1  # less govt
vote$econ_govt_role[vote$gvmt_involment_2016 == 3] <- NA  # don't know

vote$econ_govt_regulation[vote$govt_reg_2016 == 1] <- 1  # too much
vote$econ_govt_regulation[vote$govt_reg_2016 == 2] <- 0  # about the right amt
vote$econ_govt_regulation[vote$govt_reg_2016 == 3] <- -1  # not enough
vote$econ_govt_regulation[vote$govt_reg_2016 == 8] <- NA  # don't know

vote$econ_govt <- rowMeans(vote[c("econ_govt_role",
                                  "econ_govt_regulation"
)],
na.rm = TRUE)
#hist(vote$econ_govt)

# econ_ssmc

vote$econ_ssmc_socsec[vote$imiss_m_2016 == 1] <- -1  # very important
vote$econ_ssmc_socsec[vote$imiss_m_2016 == 2] <- .5  # somewhat
vote$econ_ssmc_socsec[vote$imiss_m_2016 == 3] <- -.5  # not very important
vote$econ_ssmc_socsec[vote$imiss_m_2016 == 4] <- 1  # unimportant


vote$econ_ssmc_medic[vote$imiss_s_2016 == 1] <- -1  # very important
vote$econ_ssmc_medic[vote$imiss_s_2016 == 2] <- .5  # somewhat
vote$econ_ssmc_medic[vote$imiss_s_2016 == 3] <- -.5  # not very important
vote$econ_ssmc_medic[vote$imiss_s_2016 == 4] <- 1  # unimportant

vote$econ_ssmc <- rowMeans(vote[c("econ_ssmc_socsec",
                                  "econ_ssmc_medic"
)],
na.rm = TRUE)

#hist(vote$econ_ssmc)

# econ_trad

vote$econ_trad_jobs[vote$free_trade_1_2016 == 1] <- 1 # increase
vote$econ_trad_jobs[vote$free_trade_1_2016 == 2] <- -1 # decrease
vote$econ_trad_jobs[vote$free_trade_1_2016 == 3] <- 0 # no impact

vote$econ_trad_wages[vote$free_trade_2_2016 == 1] <- 1 # increase
vote$econ_trad_wages[vote$free_trade_2_2016 == 2] <- -1 # decrease
vote$econ_trad_wages[vote$free_trade_2_2016 == 3] <- 0 # no impact

vote$econ_trad_prices[vote$free_trade_3_2016 == 1] <- 1 # increase
vote$econ_trad_prices[vote$free_trade_3_2016 == 2] <- -1 # decrease
vote$econ_trad_prices[vote$free_trade_3_2016 == 3] <- 0 # no impact

vote$econ_trad_qualprods[vote$free_trade_4_2016 == 1] <- 1 # increase
vote$econ_trad_qualprods[vote$free_trade_4_2016 == 2] <- -1 # decrease
vote$econ_trad_qualprods[vote$free_trade_4_2016 == 3] <- 0 # no impact

vote$econ_trad_amtprods[vote$free_trade_5_2016 == 1] <- 1 # increase
vote$econ_trad_amtprods[vote$free_trade_5_2016 == 2] <- -1 # decrease
vote$econ_trad_amtprods[vote$free_trade_5_2016 == 3] <- 0 # no impact

vote$econ_trad <- rowMeans(vote[c("econ_trad_jobs",
                                  "econ_trad_wages",
                                  "econ_trad_prices",
                                  "econ_trad_qualprods",
                                  "econ_trad_amtprods"
)],
na.rm = TRUE)

# sys

vote$sys_matter_who[vote$RIGGED_SYSTEM_1_2016 == 1] <- -1  # strongly agree
vote$sys_matter_who[vote$RIGGED_SYSTEM_1_2016 == 2] <- -.5  # agree
vote$sys_matter_who[vote$RIGGED_SYSTEM_1_2016 == 3] <- .5  # disagree
vote$sys_matter_who[vote$RIGGED_SYSTEM_1_2016 == 4] <- 1  # strongly disagree

vote$sys_no_say[vote$RIGGED_SYSTEM_5_2016 == 1] <- -1  # strongly agree
vote$sys_no_say[vote$RIGGED_SYSTEM_5_2016 == 2] <- -.5  # agree
vote$sys_no_say[vote$RIGGED_SYSTEM_5_2016 == 3] <- .5  # disagree
vote$sys_no_say[vote$RIGGED_SYSTEM_5_2016 == 4] <- 1  # strongly disagree

vote$sys_elites_und[vote$RIGGED_SYSTEM_6_2016 == 1] <- -1  # strongly agree
vote$sys_elites_und[vote$RIGGED_SYSTEM_6_2016 == 2] <- -.5  # agree
vote$sys_elites_und[vote$RIGGED_SYSTEM_6_2016 == 3] <- .5  # disagree
vote$sys_elites_und[vote$RIGGED_SYSTEM_6_2016 == 4] <- 1  # strongly disagree

vote$sys <- rowMeans(vote[c("sys_matter_who",
                            "sys_no_say",
                            "sys_elites_und"
)],
na.rm = TRUE)

#hist(vote$sys)

# immi

vote$immi_contrib[vote$immi_contribution_2016 == 1] <- -1  # contribution
vote$immi_contrib[vote$immi_contribution_2016 == 2] <- 0  # neither
vote$immi_contrib[vote$immi_contribution_2016 == 3] <- 1  # drain
vote$immi_contrib[vote$immi_contribution_2016 == 8] <- NA  # don't know

vote$immi_pathway[vote$immi_naturalize_2016 == 1] <- -1  # favor
vote$immi_pathway[vote$immi_naturalize_2016 == 2] <- 1  # oppose
vote$immi_pathway[vote$immi_naturalize_2016 == 8] <- NA  # don't know

vote$immi_ease[vote$immi_makedifficult_2016 == 1] <- -1  # much easier
vote$immi_ease[vote$immi_makedifficult_2016 == 2] <- -.5  # slightly easier
vote$immi_ease[vote$immi_makedifficult_2016 == 3] <- 0  # no change
vote$immi_ease[vote$immi_makedifficult_2016 == 4] <- .5  # slightly harder
vote$immi_ease[vote$immi_makedifficult_2016 == 5] <- 1  # much harder
vote$immi_ease[vote$immi_makedifficult_2016 == 8] <- NA  # don't know

vote$immi <- rowMeans(vote[c("immi_contrib",
                             "immi_pathway",
                             "immi_ease"
)],
na.rm = TRUE)

#hist(vote$immi)

# muslim

vote$muslim_ban[vote$immi_muslim_2016 == 1] <- 1  # strong favor ban
vote$muslim_ban[vote$immi_muslim_2016 == 2] <- .5  # somewhat favor ban
vote$muslim_ban[vote$immi_muslim_2016 == 3] <- -.5  # somewhat oppose ban
vote$muslim_ban[vote$immi_muslim_2016 == 4] <- -1  # strong oppose ban
vote$muslim_ban[vote$immi_muslim_2016 == 8] <- NA # don't know

vote$muslim_feel <- vote$ft_muslim_2016
vote$muslim_feel[vote$muslim_feel == 997] <- NA # don't know (need to do this before rescaling)
vote$muslim_feel <- (vote$muslim_feel / -50) + 1  # thermometer scale (need to do rescaling after removing the DKs)

vote$muslim <- rowMeans(vote[c("muslim_ban",
                               "muslim_feel"
)],
na.rm = TRUE)

#hist(vote$muslim)

# black

vote$black_deserve[vote$race_deservemore_2016 == 1] <- -1 # strongly agree
vote$black_deserve[vote$race_deservemore_2016 == 2] <- -.5 # somewhat agree
vote$black_deserve[vote$race_deservemore_2016 == 3] <- .5 # somewhat disagree
vote$black_deserve[vote$race_deservemore_2016 == 4] <- 1 # strongly disagree
vote$black_deserve[vote$race_deservemore_2016 == 8] <- NA # don't know

vote$black_overcome[vote$race_overcome_2016 == 1] <- 1 # strongly agree
vote$black_overcome[vote$race_overcome_2016 == 2] <- .5 # somewhat agree
vote$black_overcome[vote$race_overcome_2016 == 3] <- -.5 # somewhat disagree
vote$black_overcome[vote$race_overcome_2016 == 4] <- -1 # strongly disagree
vote$black_overcome[vote$race_overcome_2016 == 8] <- NA # don't know

vote$black_try[vote$race_tryharder_2016 == 1] <- 1 # strongly agree
vote$black_try[vote$race_tryharder_2016 == 2] <- .5 # somewhat agree
vote$black_try[vote$race_tryharder_2016 == 3] <- -.5 # somewhat disagree
vote$black_try[vote$race_tryharder_2016 == 4] <- -1 # strongly disagree
vote$black_try[vote$race_tryharder_2016 == 8] <- NA # don't know

vote$black_slave[vote$race_slave_2016 == 1] <- -1 # strongly agree
vote$black_slave[vote$race_slave_2016 == 2] <- -.5 # somewhat agree
vote$black_slave[vote$race_slave_2016 == 3] <- .5 # somewhat disagree
vote$black_slave[vote$race_slave_2016 == 4] <- 1 # strongly disagree
vote$black_slave[vote$race_slave_2016 == 8] <- NA # don't know

vote$black <- rowMeans(vote[c("black_deserve",
                              "black_overcome",
                              "black_try",
                              "black_slave"
)], na.rm = TRUE)

#hist(vote$black)

# moral

vote$moral_abortion[vote$abortview3_2016 == 1] <- -1 # legal all
vote$moral_abortion[vote$abortview3_2016 == 2] <- 0 # legal some
vote$moral_abortion[vote$abortview3_2016 == 3] <- 1 # illlegal all
vote$moral_abortion[vote$abortview3_2016 == 8] <- NA # don't know

vote$moral_gay[vote$gaymar_2016 == 1] <- -1 # favor
vote$moral_gay[vote$gaymar_2016 == 2] <- 1 # oppose
vote$moral_gay[vote$gaymar_2016 == 8] <- NA # don't know

vote$moral_transgender[vote$view_transgender_2016 == 1] <- -1  # restrooms identify with
vote$moral_transgender[vote$view_transgender_2016 == 2] <- 1  # restrooms born with
vote$moral_transgender[vote$view_transgender_2016 == 8] <- NA  # don't know

vote$moral <- rowMeans(vote[c("moral_abortion",
                              "moral_gay",
                              "moral_transgender"
)], 
na.rm = TRUE)

#hist(vote$moral)

# gender

vote$gender_traditional[vote$sexism1_2016 == 1] <- 1 # strongly agree
vote$gender_traditional[vote$sexism1_2016 == 2] <- .5 # somewhat agree
vote$gender_traditional[vote$sexism1_2016 == 3] <- -.5 # somewhat disagree
vote$gender_traditional[vote$sexism1_2016 == 4] <- -1 # strongly disagree

vote$gender_favors[vote$sexism2_2016 == 1] <- 1 # strongly agree
vote$gender_favors[vote$sexism2_2016 == 2] <- .5 # somewhat agree
vote$gender_favors[vote$sexism2_2016 == 3] <- -.5 # somewhat disagree
vote$gender_favors[vote$sexism2_2016 == 4] <- -1 # strongly disagree

vote$gender_miss_jobs[vote$sexism3_2016 == 1] <- -1 # strongly agree
vote$gender_miss_jobs[vote$sexism3_2016 == 2] <- -.5 # somewhat agree
vote$gender_miss_jobs[vote$sexism3_2016 == 3] <- .5 # somewhat disagree
vote$gender_miss_jobs[vote$sexism3_2016 == 4] <- 1 # strongly disagree

vote$gender_complain[vote$sexism4_2016 == 1] <- 1 # strongly agree
vote$gender_complain[vote$sexism4_2016 == 2] <- .5 # somewhat agree
vote$gender_complain[vote$sexism4_2016 == 3] <- -.5 # somewhat disagree
vote$gender_complain[vote$sexism4_2016 == 4] <- -1 # strongly disagree

vote$gender_harass[vote$sexism5_2016 == 1] <- 1 # strongly agree
vote$gender_harass[vote$sexism5_2016 == 2] <- .5 # somewhat agree
vote$gender_harass[vote$sexism5_2016 == 3] <- -.5 # somewhat disagree
vote$gender_harass[vote$sexism5_2016 == 4] <- -1 # strongly disagree

vote$gender_opportunities[vote$sexism6_2016 == 1] <- -1 # strongly agree
vote$gender_opportunities[vote$sexism6_2016 == 2] <- -.5 # somewhat agree
vote$gender_opportunities[vote$sexism6_2016 == 3] <- .5 # somewhat disagree
vote$gender_opportunities[vote$sexism6_2016 == 4] <- 1 # strongly disagree

vote$gender_roles <- rowMeans(vote[c("gender_traditional",
                                     "gender_favors",
                                     "gender_miss_jobs",
                                     "gender_complain",
                                     "gender_harass",
                                     "gender_opportunities"
)], 
na.rm = TRUE)

#hist(vote$gender_roles)

# losing_ground
# These don't obviously correspond to left/right positions, 
# but using them in analysis is still valid

vote$losing_ground_better[vote$Americatrend_2016 == 1] <- 1 # better
vote$losing_ground_better[vote$Americatrend_2016 == 2] <- 0 # same
vote$losing_ground_better[vote$Americatrend_2016 == 3] <- -1 # worse
vote$losing_ground_better[vote$Americatrend_2016 == 8] <- NA # don't know

vote$losing_ground_culture[vote$values_culture_2016 == 1] <- 1 # more accepted
vote$losing_ground_culture[vote$values_culture_2016 == 2] <- 0 # steady
vote$losing_ground_culture[vote$values_culture_2016 == 3] <- -1 # rarer
vote$losing_ground_culture[vote$values_culture_2016 == 8] <- NA # don't know

vote$losing_ground <- rowMeans(vote[c("losing_ground_better",
                                      "losing_ground_culture"
)], 
na.rm = TRUE)

#hist(vote$losing_ground)

# pride

vote$pride_history[vote$proudhis_2016 == 1] <- 1 # very proud
vote$pride_history[vote$proudhis_2016 == 2] <- .5 # somewhat proud
vote$pride_history[vote$proudhis_2016 == 3] <- -.5 # not very proud
vote$pride_history[vote$proudhis_2016 == 4] <- -1 # not proud at all
vote$pride_history[vote$proudhis_2016 == 8] <- NA # don't know

vote$pride_citizen[vote$amcitizen_2016 == 1] <- 1 # strongly agree
vote$pride_citizen[vote$amcitizen_2016 == 2] <- .5 # somewhat agree
vote$pride_citizen[vote$amcitizen_2016 == 3] <- -.5 # somewhat disagree
vote$pride_citizen[vote$amcitizen_2016 == 4] <- -1 # strongly disagree
vote$pride_citizen[vote$amcitizen_2016 == 8] <- NA # don't know

vote$pride <- rowMeans(vote[c("pride_history",
                              "pride_citizen"
)], 
na.rm = TRUE)

#hist(vote$pride)

