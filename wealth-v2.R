income_mean %>%
  filter(year >= 2009L & year <= 2009L) %>%
  filter(!(race %in% c("Asian Alone or in Combination", 
                       "Black Alone or in Combination"))) %>%
  filter(income_dollars >= 6799L & income_dollars <= 577189L) %>%
  ggplot() +
  aes(x = race, y = income_dollars, fill = race) +
  geom_bar(stat = "summary", fun = "sum") +
  scale_fill_viridis_d(option = "plasma", direction = 1) +
  coord_flip() +
  theme_minimal() +
  facet_wrap(vars(year))

income_mean %>% 
  #filter(year %in% c(1989, 1999, 2009, 2019)) %>% 
  filter(income_dollars >= 6799L & income_dollars <= 577189L) %>% 
  ggplot() +
  aes(year, income_dollars, group = race) +
  geom_line()

          