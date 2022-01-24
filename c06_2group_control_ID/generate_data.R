library(madsim)
library(dplyr)
library(tidyr)

# set parameters settings

group      <- "Group"
observation<- "Observation"
measurement<- "Measurement"
ID         <- "ID"

num_controls   <- 4
num_treatments <- 4
num_obs        <- num_controls + num_treatments
num_vars       <- 10
ID_values      <- c("EFS_246_258", "41_654_666", "ANXA2_17_29", "CBL_693_705", "CD3Z_116_128", 
                    "CDK2_8_20", "CTNB1_79_91", "DCX_67_79", "DDR1_506_518", "DYR1A_312_324")

fparams <- data.frame(m1 = num_controls, m2 = num_treatments, shape2 = 4, lb = 4, ub = 14, pde=0.02, sym=0.5);
dparams <- data.frame(lambda1 = 0.13, lambda2 = 2, muminde = 1, sdde = 0.5);
sdn     <- 0.4
rseed   <- 42


# generate fully synthetic data
data_gen <- madsim(mdata = NULL, n = num_vars, ratio = 0, fparams, dparams, sdn, rseed)
data     <- data_gen$xdata %>% 
  as_tibble() %>%
  top_n(10) %>%
  mutate(ID = ID_values) %>%
  pivot_longer(c(everything(), -ID), names_to = observation, values_to = measurement) %>%
  mutate(Group = case_when(
    startsWith(Observation, "cont") ~ "control",
    startsWith(Observation, "test") ~ "treatment")) %>%
  mutate(Observation = rep(sprintf(paste0("obs%0", nchar(as.character(num_obs)), "d"), 1:(num_obs)), num_vars)) %>%
  select(Observation, ID, Group, Measurement)

write.table(data, "c06_2group_control_ID/c06_2group_control_ID.tsv", sep = "\t", row.names = FALSE)





