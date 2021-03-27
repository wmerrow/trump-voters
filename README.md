# Voter Ideology and Changes in Trump Favorability

Project for Data Analysis, fall 2019

This analysis uses machine learning to group Trump voters based on their political ideologies, and then looks at how many voters from each group changed their opinions of Trump over time, in order to identify what types of Trump voters are most likely to change their mind. I use survey data from the Democracy Fund Voter Study Group which contains individuals’ responses to a large number of questions asked of the same people on an annual basis.

I cluster Trump voters based on their ideology on twelve political issues, which are each a composite of multiple questions, assigning answers a value from -1 to 1 and averaging a participant’s responses. To group Trump voters by ideology, I use k means clustering with the twelve ideological variables.

All scripts are run from master.R. The source data file is not included in the repo, but is available at https://www.voterstudygroup.org/data (the 2018 file).