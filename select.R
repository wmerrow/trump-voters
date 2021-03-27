vote <- vote %>% select(
                        #ID
                        case_identifier,
                        
                        # weights
                        weight_panel,
                        
                        # 2016 vote
                        presvote16post_2016,
                        
                        # favorability
                        fav_trump_2016,
                        fav_trump_2017,
                        fav_trump_2018,
                        
                        # demographics
                        birthyr_baseline,
                        gender_baseline,
                        race_baseline,
                        educ_baseline,
                        faminc_2016,
                        
                        # ideological
                        
                        # economic inequality
                        RIGGED_SYSTEM_3_2016, # econ system biased toward wealthiest (1=sa, 4=sd)
                        taxdoug_2016, # raise taxes on wealthy (1=y, 2=n, 3=dk)
                        wealth_2016, # distribution of wealth (1=fair, 2=not fair, 3=dk)
                        
                        # government intervention in economy
                        gvmt_involment_2016, # role of govt in economy (1=strong govt, 2=less govt, 3=dk)
                        govt_reg_2016, # regulation of business (1=too much, 3 = too little, 8=dk)
                        
                        # social security and medicare (coincidentally, m = social security and s = medicare)
                        imiss_m_2016, # how important soc sec (1=very, 4=not)
                        imiss_s_2016, # how important medicare (1=very, 4=not)
                        
                        # trade
                        free_trade_1_2016, # free trade effect on jobs (1 = inc, 2 = dec, 3 = no impact)
                        free_trade_2_2016, # free trade effect on wages (1 = inc, 2 = dec, 3 = no impact)
                        free_trade_3_2016, # free trade effect on prices (1 = inc, 2 = dec, 3 = no impact)
                        free_trade_4_2016, # free trade effect on quality of products (1 = inc, 2 = dec, 3 = no impact)
                        free_trade_5_2016, # free trade effect on amount of products (1 = inc, 2 = dec, 3 = no impact)
                        
                        # system rigged
                        RIGGED_SYSTEM_1_2016, # doesn't matter who we elect (1=sa, 4=sd)
                        RIGGED_SYSTEM_5_2016, # people like me don't have any say (1=sa, 4=sd)
                        RIGGED_SYSTEM_6_2016, # elites in country don't understand (1=sa, 4=sd)
                        
                        # immigration
                        immi_contribution_2016, # immigrants contribution or drain (1=contrib, 2=neither, 3=drain, 8=dk)
                        immi_naturalize_2016, # legal way for undocumented immigrants to become citizens (1=fav, 2=opp, 8=dk)
                        immi_makedifficult_2016, # easier or harder to immigrate (1=much eas, 2=slightly eas, 3=no hcange, 4=slightly harder, 5=much harder, 8=dk)
                        
                        # feelings toward Muslims
                        immi_muslim_2016, # ban muslims from entering US (1=strong favor, 4=strong oppose, 8=dk)
                        ft_muslim_2016, # feeling thermometer (0=unfav, 50=no feeling, 100=fav, 997=dk)
                        
                        # attitues toward African-Americans
                        race_deservemore_2016, # blacks gotten less than deserve (1=strong agree, 4=strong disagree, 8=dk)
                        race_overcome_2016, # blacks should overcome without favors (1=strong agree, 4=strong disagree, 8=dk)
                        race_tryharder_2016, # blacks should try harder (1=strong agree, 4=strong disagree, 8=dk)
                        race_slave_2016, # generations of slavery make it hard for blacks (1=strong agree, 4=strong disagree, 8=dk)
                        
                        # moral issues
                        abortview3_2016, # abortion legal (1=legal all, 2=legal some, 3=illegal all, 8=dk)
                        gaymar_2016, # gay marriage (1=favor, 2=oppose, 8=dk)
                        view_transgender_2016, # transgender restroom (1=restroom they identify, 2=restroom born with, 8=dk)
                        
                        # gender roles
                        sexism1_2016, # women return to traditional role (1=strong agree, 4=strong disagree)
                        sexism2_2016, # when women demand equality they are seeking favors (1=strong agree, 4=strong disagree)
                        sexism3_2016, # women miss out on jobs bc of discrim (1=strong agree, 4=strong disagree)
                        sexism4_2016, # women who complain cause more problems (1=strong agree, 4=strong disagree)
                        sexism5_2016, # sexual harassment no longer problem (1=strong agree, 4=strong disagree)
                        sexism6_2016, # increased opps for women improved qual of life (1=strong agree, 4=strong disagree)
                        
                        # perception people like me losing ground
                        Americatrend_2016, # life better for people like me (1=better, 2=same, 3=worse, 8=dk)
                        values_culture_2016, # values and culture of people like me (1=more accepted, 2=steady, 3=rarer, 8=dk)
                        
                        # pride in America
                        proudhis_2016, # how proud of America's history (1=very, 4=not at all, 8=dk)
                        amcitizen_2016 # would rather be citizen than other country (1=strong agree, 4=strong disagree, 8dk)
)