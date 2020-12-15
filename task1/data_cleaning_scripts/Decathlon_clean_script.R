
library(tidyverse)
library(assertr)
library(janitor)


decathlon_data <-read_rds("raw_data/decathlon.rds")

names(decathlon_data)

stopifnot(
  names(decathlon_data) == c("100m", "Long.jump", "Shot.put", "High.jump", "400m", "110m.hurdle",
                             "Discus", "Pole.vault", "Javeline", "1500m", "Rank", "Points", "Competition"))

decathlon_clean_data <- janitor::clean_names(decathlon_data)

names(decathlon_clean_data)

decathlon_clean_data <- tibble::rownames_to_column(decathlon_clean_data)

names(decathlon_clean_data)

decathlon_clean_data

decathlon_clean_data <- decathlon_clean_data %>% 
  rename(athlete = rowname, track_100m = x100m, track_400m = x400m, track_100m_hurdle = x110m_hurdle,track_1500m = x1500m) %>% 
  mutate(athlete = str_to_lower(athlete))


names(decathlon_clean_data)

decathlon_clean_data <- decathlon_clean_data %>% 
  pivot_longer(cols = track_100m : track_1500m,
              names_to = "race_event",
              values_to = "event_results")
              
  write_csv(decathlon_clean_data, "clean_data/decathlon_cleaned.csv")           



