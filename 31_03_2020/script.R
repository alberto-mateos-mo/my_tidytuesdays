require(dplyr)
require(ggplot2)
require(unam.theme)


brewing_materials <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-03-31/brewing_materials.csv')
beer_taxed <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-03-31/beer_taxed.csv')
brewer_size <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-03-31/brewer_size.csv')
beer_states <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-03-31/beer_states.csv')


glimpse(brewing_materials)
summary(brewing_materials)

glimpse(beer_states)

beer_states %>% 
  group_by(year) %>% 
  summarise(prod_barrels = sum(barrels, na.rm = TRUE)) %>% 
  ggplot(., aes(year, prod_barrels))+
  geom_line(size = 1)+
  geom_point(size = 2)+
  scale_x_continuous(breaks = seq(from = 2007, to = 2019), labels = seq(from = 2007, to = 2019))+
  scale_y_continuous(labels = scales::comma)+
  expand_limits(y = 300000000)+
  labs(y = "")+
  ggtitle("Barrel Production by Year")+
  theme_unam()
