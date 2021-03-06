install.packages("pacman")
pacman::p_load(ggparliament, dplyr, ggplot2)

# set wd
setwd("C:/Projects/Personal/kosovo-past-elections/src/")

election_data <- read.csv2("../data/interim/election-results.csv",stringsAsFactors=FALSE)

election_2017_data <- election_data %>%
  filter(year == 2017)

# use descending percentage (-percentage)
election_2017_data <- transform(election_2017_data, �..party_short = reorder(�..party_short, -percentage))

election_2019_data <- election_data %>%
  filter(year == 2019)

# use descending votes (-votes)
election_2019_data <- transform(election_2019_data, �..party_short = reorder(�..party_short, -percentage))
 
ggplot(data=election_2017_data, aes(x=�..party_short, y=percentage, fill=�..party_short)) +
  labs(title="Rezultatet e zgjedhjeve t� 2017-�s sipas koalicioneve t� 2017-�s", x="Partia ose Koalicionet",
       y="P�rqindja e votave t� p�rgjithshme", fill="Partia ose Koalicionet")+
  geom_bar(stat="identity") +
  theme_minimal() +
  scale_fill_manual(values = election_2017_data$colour, limits = election_2017_data$party_short)

# save
ggsave("visualization/election-results-percentage-summarized-2017-shqip.png")

ggplot(data=election_2019_data, aes(x=�..party_short, y=percentage, fill=�..party_short)) +
  labs(title="Rezultatet e zgjedhjeve t� 2017-�s sipas koalicioneve t� 2019-�s", x="Partia ose Koalicionet",
       y="P�rqindja e votave t� p�rgjithshme", fill="Partia ose Koalicionet")+
  geom_bar(stat="identity") +
  theme_minimal() +
  scale_fill_manual(values = election_2019_data$colour, limits = election_2019_data$party_short)

# Save
ggsave("visualization/election-results-percentage-summarized-2019-shqip.png")