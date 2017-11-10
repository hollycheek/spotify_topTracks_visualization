getwd() #get current directory
setwd('/Users/Ananya/myProjects/spotify_topTracks_visualization')

#install packages ggplot2, plotly, dplyr
install.packages('ggplot2')
install.packages('plotly')
install.packages('dplyr')
library('ggplot2')
library('plotly')
library('dplyr')

#Read csv file and create dataset
spotifyDatasetOld <- read.csv(file='originalData.csv', header = TRUE, sep = ',')
manualCleaned <- read.csv(file='dataManualClean.csv', header = TRUE, sep = ',')
fourGenreData <- read.csv(file='fourGenreData.csv', header = TRUE, sep= ',')
View(spotifyDatasetOld)
View(manualCleaned)
View(fourGenreData)

#make subsets of spotifyDatasetOld(removing rows) and fourGenreData(removing columns)
#copy Original Data
copyDataOld <- spotifyDatasetOld
View(copyDataOld)
#remove rows with category =Pop,EDM,Rock, Hip Hop
copyDataOld <- slice(copyDataOld,3509:8763) #the remaining genre begin at row 3509
View(copyDataOld)
#Made copy by removing three columns not present in spotifyDatasetOld
copyfourGenreData <- subset(fourGenreData, select = -c(X, song_title, artist_name))
View(copyfourGenreData)

#combined copyDataOld AND copyfourGenreData
completeData <- rbind(copyfourGenreData,copyDataOld)
View(completeData)

#write combined completeData to a CSV file
write.csv(completeData, 'cleanedData.csv', row.names=FALSE)

#Delete time signature column because did not seem useful for analysis
completeData$time_signature=NULL

#Visualization of danceability vs. popularity by category 
ggplot(data = completeData, 
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
ggplot(data = completeData, 
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
ggplot(data = completeData, 
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
ggplot(data = completeData, 
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
ggplot(data = completeData, 
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
ggplot(data = completeData, 
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
ggplot(data = completeData, 
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
