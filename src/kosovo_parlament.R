install.packages("pacman")
pacman::p_load(ggparliament, dplyr, ggplot2)

# set wd
setwd("C:/Projects/Personal/kosovo-past-elections/src/")

ks_data <- read.csv2("../data/interim/parlamenti_2017.csv")

ks_parliament <- parliament_data(election_data = ks_data,
                                 type = "semicircle",
                                 parl_rows = 5,
                                 party_seats = ks_data$seats)

deputies <- ggplot(ks_parliament, aes(x, y, colour = party_short)) +
  geom_parliament_seats() + 
  #highlight the party in control of the House with a black line
  geom_highlight_government(government == 1) +
  #draw majority threshold
  draw_majoritythreshold(n = 61, label = TRUE, type = 'semicircle')+
  #set theme_ggparliament
  theme_ggparliament() +
  #other aesthetics
  labs(colour = NULL, 
       title = "Republic of Kosovo Parliament",
       subtitle = "Party that controls the Parliament highlighted.") 
#+
#  scale_colour_manual(values = us_house$colour, 
#                      limits = us_house$party_short) 

deputies

ggsave("visualization/kosovo-parliament-v3.png", width=12, height = 7)