
esquisse::esquisser(viewer = "browser")





race_wealth_v2 <- race_wealth %>% 
  mutate(wealth_family = round(wealth_family)) %>%
  filter(!is.na(wealth_family)) %>%
  arrange(desc(year))


race_wealth_v2 <- pivot_wider(race_wealth_v2, names_from = c(race, type), values_from = wealth_family) %>%
  select(- c("Non-White_Average", "Non-White_Median")) 
  
ggplot(race_wealth_v2) +
  aes(
    x = year,
    y = White_Average,
    colour = White_Median,
    size = year
  ) +
  geom_line() +
  geom_line(
    aes(color = Black_Median,
        size = year,
        x = year,
        y = Black_Average)
  ) +
  geom_line(
    aes(color = Hispanic_Median,
        size = year,
        x = year,
        y = Hispanic_Average)
  ) +
  scale_color_viridis_c(option = "plasma", direction = 1) +
  labs(title = "Race Wealth") +
  theme_minimal()

kable(race_wealth_v2) %>%
  kable_styling("striped","bordered")


student_debt_v2 <- student_debt %>%
  mutate(loan_debt = round(loan_debt)) %>%
  arrange(desc(year))

student_debt_v2 <- pivot_wider(student_debt_v2, names_from = race, values_from = c(loan_debt, loan_debt_pct))
  

student_debt_v2 <- student_debt_v2 %>%
  select(year, loan_debt_White, loan_debt_pct_White, loan_debt_Black, loan_debt_pct_Black, loan_debt_Hispanic, loan_debt_pct_Hispanic)

ggplot(student_debt_v2) +
  aes(
    x = year,
    y = loan_debt_Black,
    colour = loan_debt_pct_Black,
    size = year
  ) +
  geom_line() +
  geom_line(
    aes(color = loan_debt_pct_White,
        size = year,
        x = year,
        y = loan_debt_White)
  ) +
  geom_line(
    aes(color = loan_debt_pct_Hispanic,
        size = year,
        x = year,
        y = loan_debt_Hispanic)
  ) +
  scale_color_viridis_c(option = "plasma", direction = 1) +
  labs(title = "Student Debt")
  theme_minimal()
  
  kable(student_debt_v2) %>%
    kable_styling("striped","bordered")

