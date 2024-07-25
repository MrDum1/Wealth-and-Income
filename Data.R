
esquisse::esquisser(viewer = "browser")
#Plot browser

race_wealth_clean <- race_wealth %>% 
  mutate(wealth_family = round(wealth_family)) %>%
  filter(!is.na(wealth_family)) %>%
  arrange(desc(year)) %>%
  pivot_wider( names_from = c(race, type), values_from = wealth_family) %>%
  select(- c("Non-White_Average", "Non-White_Median")) %>%
  select(year, "White Average" = White_Average, "White Median" = White_Median,
         "Black Average" = Black_Average, "Black Median" = Black_Median,
         "Hispanic Average" = Hispanic_Average, "Hispanic Median" = Hispanic_Median) %>%
  filter(year >= 1989)
#filtered data

race_wealth_plot <- race_wealth %>% 
  mutate(wealth_family = round(wealth_family)) %>%
  filter(!is.na(wealth_family)) %>%
  arrange(desc(year)) %>%
  filter(year >= 1989)

Wealth_avg <- subset(race_wealth_plot, type == "Average")
Wealth_med <- subset(race_wealth_plot, type == "Median") 

race_wealth_plot <- merge(Wealth_avg, Wealth_med, by = c("year")) %>%
  rename(average = type.x, median = type.y, average_race = race.x, median_race = race.y, average_income = wealth_family.x, median_income = wealth_family.y)
##plot data


ggplot(race_wealth_plot) +
  aes(x = year, y = average_income, colour = average_race) +
  geom_line(linewidth = 3L) +
  scale_color_viridis_d(option = "inferno", direction = 1) +
  labs(title = "Average Race Wealth", x = "Year", y = "Average Income") +
  theme_minimal() +
  theme(
    legend.text = element_text(size = 11L),
  ) +
  facet_wrap(vars(average))
#plotted data (Average)

ggplot(race_wealth_plot) +
  aes(x = year, y = median_income, colour = median_race) +
  geom_line(linewidth = 3L) +
  scale_color_viridis_d(option = "inferno", direction = 1) +
  labs(title = "Median Race Wealth", x = "Year", y = "Median Income") +
  theme_minimal() +
  theme(legend.text = element_text(size = 11L)) +
  facet_wrap(vars(median))
#plotted data (Median)

kable(race_wealth_clean) %>%
  kable_styling("striped","bordered")

#############################################
#Student Debt Data


student_debt_clean <- student_debt %>%
  mutate(loan_debt = round(loan_debt)) %>%
  arrange(desc(year)) %>%
  pivot_wider(names_from = race, values_from = c(loan_debt, loan_debt_pct))%>%
  select(year, "Loan Debt (white)" = loan_debt_White, "Loan Debt Pct (White)" = loan_debt_pct_White,
         "Loan Debt (Black)" = loan_debt_Black, "Loean Debt Pct (Black)" = loan_debt_pct_Black,
         "Loan Debt (Hispanic)" = loan_debt_Hispanic, "Loan Debt Pct (Hispanic)" = loan_debt_pct_Hispanic)
#filtered data

ggplot(student_debt) +
  aes(x = year, y = loan_debt_pct, colour = race) +
  geom_line(linewidth = 3L) +
  scale_color_viridis_d(option = "inferno", direction = 1) +
  labs(title = "Student Debt", x = "Year", y = "Loan Debt Percentage") +
  theme_minimal()
#plotted data (percentage)

ggplot(student_debt) +
  aes(x= year, y = loan_debt, colour = race) + 
  geom_line(linewidth = 3L) +
  scale_color_viridis_d(option = "inferno", direction = 1) +
  labs(title = "Student Debt", x = "Year", y = "Loan Debt ($)") +
  theme_minimal()
#plotted data ($)

kable(student_debt_clean) %>%
    kable_styling("striped","bordered")

  

