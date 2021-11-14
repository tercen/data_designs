library(madsim)
library(dplyr)
library(tidyr)

# set parameters settings
supergroup <- "Supergroup"
group      <- "Group"
observation<- "Observation"
variable   <- "Variable" 
measurement<- "Measurement"
pair       <- "Pair"

num_controls   <- 4
num_treatments <- 4
num_pairs      <- 2
num_obs        <- num_controls + num_treatments
num_vars       <- 100
num_super_groups <- 2

pair_name <- c(unlist(lapply(seq(num_pairs), FUN = function(x) { rep(paste0("pair", x),  num_controls/num_pairs)} )),
               unlist(lapply(seq(num_pairs), FUN = function(x) { rep(paste0("pair", x),  num_treatments/num_pairs)} )))

fparams <- data.frame(m1 = num_controls, m2 = num_treatments, shape2 = 4, lb = 4, ub = 14, pde=0.02, sym=0.5);
dparams <- data.frame(lambda1 = 0.13, lambda2 = 2, muminde = 1, sdde = 0.5);
sdn     <- 0.4
rseed   <- 42

# generate fully synthetic data
get_group_data <- function(supergroup) {
  data_gen1 <- madsim(mdata = NULL, n = num_vars, ratio = 0, fparams, dparams, sdn, rseed)
  as_tibble(data_gen1$xdata) %>% 
    pivot_longer(everything(), names_to = observation, values_to = measurement) %>%
    mutate(Group = case_when(
      startsWith(Observation, "cont") ~ "control",
      startsWith(Observation, "test") ~ "treatment")) %>%
    mutate(Variable = unlist(lapply(seq(num_vars), FUN = function(x) { rep(sprintf(paste0("var%0", nchar(as.character(num_vars)), "d"), x), num_obs) }))) %>%
    mutate(Pair = rep(pair_name, num_vars)) %>%
    mutate(Supergroup = paste0("supergroup", supergroup)) %>%
    distinct(Variable, Group, Supergroup, Pair, .keep_all = TRUE) %>%
    select(Variable, Group, Supergroup, Pair, Measurement)
}

data <- do.call(rbind, lapply(seq(num_super_groups), FUN = function(x) {get_group_data(x)})) %>%
  mutate(Observation = sprintf(paste0("obs%0", nchar(as.character(n())), "d"), 1:n())) %>%
  select(Observation, Variable, Group, Supergroup, Pair, Measurement)

write.table(data, "2groups_super_pairing_control_design/2groups_super_pairing_control_design.tsv", sep = "\t", row.names = FALSE)





