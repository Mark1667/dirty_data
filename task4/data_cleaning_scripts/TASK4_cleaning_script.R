

library(tidyverse)
library(readxl)
library(janitor)


  candy_2015 <-read_excel("raw_data/boing-boing-candy-2015.xlsx")
  candy_2016 <-read_excel("raw_data/boing-boing-candy-2016.xlsx")
  candy_2017 <-read_excel("raw_data/boing-boing-candy-2017.xlsx")

  
  candy_2015c <- janitor::clean_names(candy_2015)
  candy_2016c <- janitor::clean_names(candy_2016)
  candy_2017c <- janitor::clean_names(candy_2017)

  common_col_names1516 <- intersect(names(candy_2015c), names(candy_2016c))
  
  common_col_names1617 <- intersect(names(candy_2016c), names(candy_2017c))
  
  common_col_names1517 <- intersect(names(candy_2015c), names(candy_2017c))
  
  
  combined_candyc <- merge(candy_2015c, candy_2016c, by = common_col_names, all.candy_2015 =TRUE)
  
  common_col_names_all <- intersect(names(combined_candyc), names(candy_2017c))
  
  combined_candyc_all <- merge(combined_candyc, candy_2017c, by = common_col_names_all, all.combined_candyc =TRUE)
  
  
  
  
  candy_2015c <- candy_2015c %>% 
    rename(age = how_old_are_you,
           going_out = are_you_going_actually_going_trick_or_treating_yourself,
           brown_black_orange = anonymous_brown_globs_that_come_in_black_and_orange_wrappers,
           gum = gum_from_baseball_cards)
   Select(age, going_out, butterfinger, x100_grand_bar, brown_black_orange,    any_full_size_candy_bar, black_jacks, bonkers,bubble_gum, cadbury_creame_eggs, candy_corn, chiclets, caramellos, snickers, dark_chocolate_hershey, dots, fuzzy_peaches, goo_goo_clusters, gum, gummy_bears_straight_up, health_bar, hershey_s_kissables, hershey_s_milk_chocolate, jolly_rancher_bad_flavor, Jolly_rancher_good_flavor, kinder_happy_hippo, lemon_heads, licorice, licorice_not_black, lint_truffle, lollipops,  )        
           
  
  names(candy_2015)
  
  names(candy_2016)
  
  names(candy_2017)