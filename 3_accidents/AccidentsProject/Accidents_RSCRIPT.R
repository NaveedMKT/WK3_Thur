library(tidyverse)
library(here)
accidents_data <- readRDS(here("data", "accidents.rds"))
accidents_data1 <- accidents_data %>%
  select(severity, date, time) %>%
  mutate(day_category = ifelse(wday(date) %in% c(1,7), "Weekend", "Weekday"))
accidents_data1 %>%
ggplot(aes(x = time, fill = severity)) +
  theme_minimal() +
  geom_density(alpha = 0.5) +
  facet_wrap(~day_category, ncol = 1) +
  labs(title = "Number of accidents throughout the day", subtitle = "By day of week and severity",
       y = "Density", x = "Time of Day") +
  scale_fill_manual(
    values = c("Fatal" = "#D55E00", "Serious" = "#009E73", "Slight" = "#F0E442"), name = "Severity"
  )

