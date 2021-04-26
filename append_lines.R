setwd("/home/agricolamz/work/TECkit_maps/adyghe cyrillic to trans")
library(tidyverse)
df <- read_csv("correspondences.csv")

df %>% 
  select(trans, cyr) %>% 
  mutate(upper = str_to_upper(cyr),
         title = str_to_title(cyr)) %>% 
  pivot_longer(names_to = "type", values_to = "cyr", cyr:title) %>% 
  mutate(result = str_c('"', cyr, '" <> "', trans, '"')) %>% 
  pull(result) %>% 
  write_lines("ady_cyr_trans_v4.map", append = TRUE)
