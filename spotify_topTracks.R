setwd('/Users/Ananya/myProjects/spotify_topTracks_visualization')

#Read csv file and create dataset
spotifyDataset <- read.csv(file='song_data_cleaned.csv', header = TRUE, sep = ',')
spotifyDatasetOld <- read.csv(file='song-data-unique.csv', header = TRUE, sep = ',')
View(spotifyDataset)
View(spotifyDatasetOld)

#delete time signature column because did not seem useful for analysis
spotifyDataset$time_signature=NULL
spotifyDatasetOld$time_signature=NULL

#install.packages('ggplot2')
#install.packages('plotly')
#install.packages('ISLR')
#library(ISLR)
library(tidyverse)
library(ggplot2)
library(plotly)

#Loads data into data frame
spotify_dt <- data.frame(spotifyDataset)
spotify_dt_old <- data.frame(spotifyDatasetOld)

#Merge to new dataset
#?merge
spotify_dt_new <- merge.data.frame(spotify_dt_old, spotify_dt, by.x = 'songid', by.y = 'songid')
View(spotify_dt_new)

#Save to CSV
write.csv(spotify_dt_new, 'spotifyMerge.csv')
read.csv()

#Visualization of danceability vs. popularity by category 
ggplot(data = spotify_dt, 
       aes(x = danceability, 
           y = popularity,
           col = category)) +
  geom_point() + 
  ggtitle('Scatter Plot: Danceability Vs. Popularity') +
  labs(x = 'Danceability', 
       y = 'Popularity') + 
  theme_minimal() + 
  facet_wrap(~category)

#???
spotify_dt %>% 
  filter(category == 'Pop') %>%
  select(danceability)



