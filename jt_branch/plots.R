esquisse::esquisser(viewer = "browser")

ggplot(student_debt) +
  aes(x = year, y = loan_debt, colour = race) +
  geom_line(linewidth = 1.9) +
  geom_line() +
  scale_color_viridis_d(option = "plasma", direction = 1) +
  labs(
    x = "Years",
    y = "Loan Debt (in USD)",
    title = "Student Loan Debt Among Race",
    subtitle = "Average family student loan debt for aged 25-55 [1989 - 2016].",
    color = "Race"
  ) +
  theme_light() +
  theme(
    legend.position = "top",
    plot.title = element_text(size = 20L,
                              face = "bold"),
    plot.subtitle = element_text(size = 13L,
                                 face = "italic"),
    axis.title.y = element_text(size = 15L,
                                face = "bold"),
    axis.title.x = element_text(size = 15L,
                                face = "bold"),
    axis.text.y = element_text(size = 15L,
                               angle = 20L),
    axis.text.x = element_text(size = 15L),
    legend.text = element_text(size = 13L),
    legend.title = element_text(face = "bold",
                                size = 13L)
  )


ggplot(retirement) +
  aes(x = year, y = retirement, colour = race) +
  geom_line(linewidth = 1.9) +
  scale_color_viridis_d(option = "plasma", direction = 1) +
  labs(
    x = "Years",
    y = "Retirement Savings (In USD)",
    title = "Retirement Savings Among Race",
    subtitle = "Average retirement savings [1989 - 2016].",
    color = "Race"
  ) +
  theme_light() +
  theme(
    legend.position = "top",
    plot.title = element_text(size = 20L,
                              face = "bold"),
    plot.subtitle = element_text(size = 13L,
                                 face = "italic"),
    axis.title.y = element_text(size = 15L,
                                face = "bold"),
    axis.title.x = element_text(size = 15L,
                                face = "bold"),
    axis.text.y = element_text(size = 15L,
                               angle = 20L),
    axis.text.x = element_text(size = 15L),
    legend.text = element_text(size = 13L),
    legend.title = element_text(face = "bold",
                                size = 13L)
  )


ggplot(student_debt) +
  aes(x = year, y = loan_debt_pct, colour = race) +
  geom_line(linewidth = 1.9) +
  scale_color_viridis_d(option = "plasma", direction = 1) +
  labs(
    x = "Years",
    y = "Loan Debt (in percentage)",
    title = "Student Debt Percentage Among Race",
    subtitle = "Average family student loan debt percentage for aged 25-55 [1989 - 2016].",
    color = "Race"
  ) +
  theme_light() +
  theme(
    legend.position = "top",
    plot.title = element_text(size = 20L,
                              face = "bold"),
    plot.subtitle = element_text(size = 13L,
                                 face = "italic"),
    axis.title.y = element_text(size = 15L,
                                face = "bold"),
    axis.title.x = element_text(size = 15L,
                                face = "bold"),
    axis.text.y = element_text(size = 15L,
                               angle = 20L),
    axis.text.x = element_text(size = 15L),
    legend.text = element_text(size = 13L),
    legend.title = element_text(face = "bold",
                                size = 13L)
  )


home_owner %>%
  filter(year >= 1989L & year <= 2016L) %>%
  ggplot() +
  aes(x = year, y = home_owner_pct, colour = race) +
  geom_line(linewidth = 1.9) +
  scale_color_viridis_d(option = "plasma", direction = 1) +
  labs(
    x = "Year",
    y = "Ownership percentage",
    title = "Home Owner Percentage",
    subtitle = "Home ownership percentage based on race [1989 - 2016].",
    color = "Race"
  ) +
  theme_minimal() +
  theme(
    legend.position = "top",
    plot.title = element_text(size = 20L,
                              face = "bold"),
    plot.subtitle = element_text(size = 13L,
                                 face = "italic"),
    axis.title.y = element_text(size = 15L,
                                face = "bold"),
    axis.title.x = element_text(size = 15L,
                                face = "bold"),
    axis.text.y = element_text(size = 15L,
                               angle = 20L),
    axis.text.x = element_text(size = 15L),
    legend.text = element_text(size = 13L),
    legend.title = element_text(face = "bold",
                                size = 13L)
  )
