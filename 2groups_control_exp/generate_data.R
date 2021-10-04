library(madsim)
library(dplyr)
library(tidyr)

# set parameters settings
supergroup <- "Supergroup"
group      <- "Group"
observation<- "Observation"
variable   <- "Variable" 
measurement<- "Measurement"

num_controls   <- 7
num_treatments <- 7
num_obs        <- num_controls + num_treatments
num_vars       <- 1000

var_name <- sprintf(paste0("variable%0", nchar(as.character(num_vars)), "d"), 1:num_vars)
obs_name <- sprintf(paste0("observation%0", nchar(as.character(num_obs)), "d"), 1:num_obs)

fparams <- data.frame(m1 = num_controls, m2 = num_treatments, shape2 = 4, lb = 4, ub = 14, pde=0.02, sym=0.5);
dparams <- data.frame(lambda1 = 0.13, lambda2 = 2, muminde = 1, sdde = 0.5);
sdn     <- 0.4
rseed   <- 42

# generate fully synthetic data
data_gen1 <- madsim(mdata = NULL, n = num_vars, ratio = 0, fparams, dparams, sdn, rseed)
data <- as_tibble(data_gen1$xdata) %>% 
  pivot_longer(everything(), names_to = observation, values_to = measurement) %>%
  mutate(Group = case_when(
    startsWith(Observation, "cont") ~ "Control",
    startsWith(Observation, "test") ~ "Treatment")) %>%
  mutate(Observation = rep(obs_name, num_vars)) %>%
  mutate(Variable = unlist(lapply(seq(num_vars), FUN = function(x) { rep(x, num_obs) }))) %>%
  select(Observation, Variable, Group, Measurement)

write.table(data, "2groups_control_exp/2groups_control_exp.tsv", sep = "\t", row.names = FALSE)





