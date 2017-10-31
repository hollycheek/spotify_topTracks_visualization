library(readr)
data <- read.csv(file='song-data-unique.csv', header = TRUE, sep = ',')
View(data)
spotifyDataset <- read.csv(file='song-data-unique.csv', header = TRUE, sep = ',')
View(spotifyDataset)
spotifyDataset$time_signature=NULL
install.packages('ggplot2')
install.packages('plotly')

library(ggplot2)
library(plotly)
install.packages('ISLR')
library(ISLR)
data(spotifyDataset)
spotify_dt <- data.frame(spotifyDataset)
spotify_dt[1]
spotify_dt[,1, with = FALSE]
ggplot(data = spotify_dt, aes(x=danceability, y=popularity))
data = spotify_dt
ggplot(data = spotify_dt, aes(x=danceability, y=popularity)) + geom_point()
ggplot(data = spotify_dt, 
       aes(x = danceability, 
           y = popularity)) +
  geom_point(col = 'turquoise4') + 
  ggtitle('Scatter Plot: Danceability Vs. Popularity') +
  labs(x = 'Danceability', 
       y = 'Popularity') + 
  theme_minimal()
