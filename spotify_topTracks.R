getwd() #get current directory
setwd('/Users/Ananya/myProjects/spotify_topTracks_visualization')

#What makes a song a romance song?
#ggpairs ggplot2

#install packages ggplot2, plotly, dplyr
install.packages('ggplot2')
install.packages('plotly')
install.packages('dplyr')
install.packages('tidyverse')
library('ggplot2')
library('plotly')
library('dplyr')
library('tidyverse')

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

#change all integer data into numeric
completeData <- lapply(completeData, as.numeric)

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
  theme_minimal() #+ 
 # facet_wrap(~category)

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
  geom_jitter() +
  geom_smooth(method = 'lm') +
  ggtitle('Scatter Plot: Category Vs. Popularity') +
  labs(x = 'Category', 
       y = 'Popularity') + 
  theme_minimal()
  #look at spread use group by function to group each category/genre
  #dplyr::group_by(completeData, category) 
  #Group data by each category/genre
  EDM <- dplyr::filter(completeData, completeData$category== 'Electronic/Dance')
  HipHop <- dplyr::filter(completeData, completeData$category== 'Hip-Hop')
  Pop <- dplyr::filter(completeData, completeData$category== 'Pop')
  Rock <- dplyr::filter(completeData, completeData$category== 'Rock')
  Indie <- dplyr::filter(completeData, completeData$category== 'Indie')
  Jazz <- dplyr::filter(completeData, completeData$category== 'Jazz')
  Metal <- dplyr::filter(completeData, completeData$category== 'Metal')
  RandB <- dplyr::filter(completeData, completeData$category== 'R&B')
  Romance <- dplyr::filter(completeData, completeData$category== 'Romance')
  Soul <- dplyr::filter(completeData, completeData$category== 'Soul')
  #Look at spread of popularity between each category/genre
  row.names=c('Category/Genre', 'Stardard Deviation','Variance', 'IQR')
  categoryCol <- levels(completeData$category)
  standDevCol <- c(sd(EDM$popularity), sd(HipHop$popularity),sd(Pop$popularity),sd(Rock$popularity),sd(Indie$popularity),sd(Jazz$popularity),sd(Metal$popularity),sd(RandB$popularity),sd(Romance$popularity),sd(Soul$popularity))
  varCol <- c(var(EDM$popularity), var(HipHop$popularity),var(Pop$popularity),var(Rock$popularity),var(Indie$popularity),var(Jazz$popularity),var(Metal$popularity),var(RandB$popularity),var(Romance$popularity),var(Soul$popularity))
  iqrCol <- c(IQR(EDM$popularity), IQR(HipHop$popularity),IQR(Pop$popularity),IQR(Rock$popularity),IQR(Indie$popularity),IQR(Jazz$popularity),IQR(Metal$popularity),IQR(RandB$popularity),IQR(Romance$popularity),IQR(Soul$popularity))
  #MAKE DATA FRAME AND VISUALIZE
  
#???
spotify_dt %>% 
  filter(category == 'Pop') %>%
  select(danceability)
