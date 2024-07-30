tail(income_aggregate)
tuesdata

test <- pivot_wider(home_owner, names_from = "year", values_from = "home_owner_pct")

home_owner_wide <- test_homeowner

retirement_wide <- pivot_wider(retirement, names_from = year, values_from = retirement)

student_debt_wide <- pivot_wider(student_debt, names_from = race, values_from = c(loan_debt, loan_debt_pct))

group_by(retirement_wide, year)

summarise(retirement_wide)

summary(home_owner_wide)
summary(home_owner)
summary(retirement_wide)
summary(student_debt)

home_owner
home_owner_wide

ungroup(home_owner)
group_vars(home_owner)

class(student_debt_wide$year)
