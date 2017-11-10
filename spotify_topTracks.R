getwd() #get current directory
setwd('/Users/Ananya/myProjects/spotify_topTracks_visualization')

#Read csv file and create dataset
spotifyDataset <- read.csv(file='song_data_cleaned.csv', header = TRUE, sep = ',')
spotifyDatasetOld <- read.csv(file='originalData.csv', header = TRUE, sep = ',')
View(spotifyDataset)
View(spotifyDatasetOld)

#Delete time signature column because did not seem useful for analysis
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
spotify_new_subset <- subset(spotify_dt, select = -c(X, song_title, artist_name))

#Merge to new dataset
spotify_dt_new <- merge.data.frame(spotify_dt_old, spotify_dt, by.x = 'songid', by.y = 'songid')
View(spotify_dt_new)

#View cleaned data
spotifyDatasetCleaned <- read.csv(file='spotifyData.csv', header = TRUE, sep = ',')
View(spotifyDatasetCleaned)

#Visualization of danceability vs. popularity by category 
ggplot(data = spotifyDatasetCleaned, 
       aes(x = danceability, 
           y = popularity,
           col = category)) +
  geom_point() + 
  geom_smooth(method = 'lm') +
  ggtitle('Scatter Plot: Danceability Vs. Popularity') +
  labs(x = 'Danceability', 
       y = 'Popularity') + 
  theme_minimal() + 
  facet_wrap(~category)

#Visualization of energy vs. popularity by category 
ggplot(data = spotifyDatasetCleaned, 
       aes(x = energy, 
           y = popularity,
           col = category)) +
  geom_point() + 
  #Add geom_smooth to see trends
  geom_smooth(method = 'lm') +
  ggtitle('Scatter Plot: Energy Vs. Popularity') +
  labs(x = 'Energy', 
       y = 'Popularity') + 
  theme_minimal() + 
  facet_wrap(~category)

#Visualization of key vs. popularity by category 
ggplot(data = spotifyDatasetCleaned, 
       aes(x = key, 
           y = popularity,
           col = category)) +
  geom_point() + 
  geom_smooth(method = 'lm') +
  ggtitle('Scatter Plot: Key Vs. Popularity') +
  labs(x = 'Key', 
       y = 'Popularity') + 
  theme_minimal() + 
  facet_wrap(~category)

#Visualization of loudness vs. popularity by category 
ggplot(data = spotifyDatasetCleaned, 
       aes(x = loudness, 
           y = popularity,
           col = category)) +
  geom_point() + 
  geom_smooth(method = 'lm') +
  ggtitle('Scatter Plot: Loudness Vs. Popularity') +
  labs(x = 'Loudness', 
       y = 'Popularity') + 
  theme_minimal() + 
  facet_wrap(~category)

#Visualization of energy vs. danceablility by category 
ggplot(data = spotifyDatasetCleaned, 
       aes(x = energy, 
           y = danceability,
           col = category)) +
  geom_point() + 
  geom_smooth(method = 'lm') +
  ggtitle('Scatter Plot: Energy Vs. Danceability') +
  labs(x = 'Energy', 
       y = 'Danceability') + 
  theme_minimal() + 
  facet_wrap(~category)

#Visualization of valence vs. popularity by category 
ggplot(data = spotifyDatasetCleaned, 
       aes(x = valence, 
           y = popularity,
           col = category)) +
  geom_point() + 
  geom_smooth(method = 'lm') +
  ggtitle('Scatter Plot: Valence Vs. Popularity') +
  labs(x = 'Valence', 
       y = 'Popularity') + 
  theme_minimal() + 
  facet_wrap(~category)

#Visualization of category vs. popularity by category 
ggplot(data = spotifyDatasetCleaned, 
       aes(x = category, 
           y = popularity,
           col = category)) +
  geom_point() + 
  geom_smooth(method = 'lm') +
  ggtitle('Scatter Plot: Category Vs. Popularity') +
  labs(x = 'Category', 
       y = 'Popularity') + 
  theme_minimal()

#???
spotify_dt %>% 
  filter(category == 'Pop') %>%
  select(danceability)
