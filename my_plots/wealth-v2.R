install.packages("mgcv")
install.packages("ggplot2")
install.packages("dplyr")

# Load necessary libraries
library(dplyr)
library(ggplot2)

# Prepare and filter data
income_mean_filtered <- income_mean %>%
  filter(!(race %in% c("Asian Alone or in Combination", "Black Alone or in Combination", "White, Not Hispanic"))) %>%
  filter(dollar_type == "2019 Dollars") %>%
  filter(income_quintile == "Highest")

# Calculate mean income for each year and race
mean_income_per_year <- income_mean_filtered %>%
  group_by(year, race) %>%
  summarise(mean_income = mean(income_dollars, na.rm = TRUE))

# Calculate growth rate from 1967 to 2019 for each race
growth_rate <- mean_income_per_year %>%
  filter(year %in% c(1967, 2019)) %>%
  spread(key = year, value = mean_income) %>%
  mutate(growth_rate = (`2019` - `1967`) / `1967` * 100) %>%
  select(race, growth_rate)

# Print growth rates
print(growth_rate)

# Plot trends in income
ggplot(income_mean_filtered) +
  aes(x = year, y = income_dollars, colour = race) +
  geom_jitter(alpha = 0.5) +
  geom_smooth(method = "gam", formula = y ~ s(x), se = FALSE) + 
  scale_x_continuous(limits = c(1967, 2019), breaks = seq(1967, 2019, length.out = 14)) +
  labs(
    x = "Year",
    y = "Income (Inflation-Adjusted to 2019 Dollars)",
    title = "Trends in Income Quintile's Among Racial Groups (1967-2019)",
    subtitle = "Highest Income Quintile",
    caption = "Figure 1: Trends in the highest income quintile among different racial groups from 1967 to 2019. The plot illustrates how income levels have varied over time for each group, with a smoothed line showing general trends."
  ) +
  theme_minimal() +
  theme(plot.title = element_text(size = 15L, face = "bold"), plot.subtitle = element_text(size = 13L))

# Optionally, plot the growth rates
ggplot(growth_rate) +
  aes(x = reorder(race, growth_rate), y = growth_rate, fill = race) +
  geom_bar(stat = "identity") +
  coord_flip() +
  labs(
    x = "Race",
    y = "Growth Rate (%)",
    title = "Income Growth Rate by Race (1967-2019)",
    subtitle = "Calculated as the percentage increase in mean income from 1967 to 2019",
    caption = "Figure 2: Income growth rates for the highest income quintile among different racial groups from 1967 to 2019."
  ) +
  theme_minimal() +
  theme(plot.title = element_text(size = 15L, face = "bold"), plot.subtitle = element_text(size = 13L))


