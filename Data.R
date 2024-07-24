
esquisse::esquisser(viewer = "browser")

race_wealth_v2 <- race_wealth %>% 
  mutate(wealth_family = round(wealth_family)) %>%
  filter(!is.na(wealth_family)) %>%
  arrange(desc(year)) %>%
  pivot_wider( names_from = c(race, type), values_from = wealth_family) %>%
  select(- c("Non-White_Average", "Non-White_Median")) %>%
  filter(year >= 1989)
  
ggplot(race_wealth_v2) +
  aes(x = year, y = White_Average) +
  geom_line(linewidth = 3L, colour = "#2857AC") +
  geom_line(
    aes(x = year,
        y = Black_Average),
    linewidth = 3L,
    colour = "#46337E"
  ) +
  geom_line(
    aes(x = year,
        y = Hispanic_Average),
    linewidth = 3L,
    colour = "#EF562D"
  ) +
  labs(title = "Race Wealth", x = "Year", y = "Income Average") +
  theme_minimal()

kable(race_wealth_v2) %>%
  kable_styling("striped","bordered")



#Student Debt Data

student_debt_v2 <- student_debt %>%
  mutate(loan_debt = round(loan_debt)) %>%
  arrange(desc(year)) %>%
  pivot_wider(names_from = race, values_from = c(loan_debt, loan_debt_pct))%>%
  select(year, loan_debt_White, loan_debt_pct_White, loan_debt_Black, loan_debt_pct_Black, loan_debt_Hispanic, loan_debt_pct_Hispanic)

ggplot(student_debt_v2) +
  aes(x = year, y = loan_debt_pct_White) +
  geom_line(linewidth = 3L, colour = "#0C4C8A") +
  geom_line(
    aes(x = year,
        y = loan_debt_pct_Black),
    linewidth = 3L,
    colour = "#46337E"
  ) +
  geom_line(
    aes(x = year,
        y = loan_debt_pct_Hispanic),
    linewidth = 3L,
    colour = "#EF562D"
  ) +
  labs(title = "Student Debt", x = "Year", y = "Loan Debt Percentage ") +
  theme_minimal()

  
  kable(student_debt_v2) %>%
    kable_styling("striped","bordered")

